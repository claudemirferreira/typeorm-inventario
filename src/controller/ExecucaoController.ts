import { getRepository, getManager } from "typeorm";
import { NextFunction, Request, Response } from "express";
import { Execucao } from "../entity/execucao";
import { Inventario } from "../entity/inventario";
import { Contagem } from "../entity/contagem";

export class ExecucaoController {

    private repository = getRepository(Execucao);

    private repositoryInventario = getRepository(Inventario);

    private repositoryContagem = getRepository(Contagem);
    
    private manager = getManager();     

    async all(request: Request, response: Response, next: NextFunction) {        
        return this.repository.find();        
    }

    async one(request: Request, response: Response, next: NextFunction) {
        return this.repository.findOne(request.params.id);
    }

    async remove(request: Request, response: Response, next: NextFunction) {
        let userToRemove = await this.repository.findOne(request.params.id);
        await this.repository.remove(userToRemove);
    }

    async save(request: Request, response: Response, next: NextFunction) {
        return this.repository.save(request.body);
    }

    async findIdInventario(request: Request, response: Response, next: NextFunction) {
        const inventario = await this.repositoryInventario.createQueryBuilder("inventario")
                            .leftJoinAndSelect("inventario.execucoes", "execucao")
                            .where("inventario.id = :id", { id: request.params.id })
                            .getOne();
        return inventario.execucoes;
    }

    // inicia a primeira contagem do inventario
    async iniciarContagem(request: Request, response: Response, next: NextFunction) {
        console.log('entrou servico iniciarContagem');
        try {
            console.log('numero='+request.body.numeroContagem);
            if (request.body.numeroContagem == '1'){
                console.log('1 priemira contagem');
                var sql = 'CALL iniciarPrimeiraContagem('+request.params.inventarioId+','+request.body.id+')';
                console.log('executou a procedure ' + sql);
                const result = await this.manager.query(sql);
            } else if (request.body.numeroContagem == '2'){
                console.log('2 priemira contagem');
                var sql = 'CALL iniciarSegundaContagem('+request.params.inventarioId+','+request.body.id+')';
                console.log('executou a procedure ' + sql);
                const result = await this.manager.query(sql);
            } else if (request.body.numeroContagem == '3'){
                console.log('3 priemira contagem');
                var sql = 'CALL iniciarTerceiraContagem('+request.params.inventarioId+','+request.body.id+')';
                console.log('executou a procedure ' + sql);
                const result = await this.manager.query(sql);
            }

            const inventario = await this.repositoryInventario.createQueryBuilder("inventario")
                            .leftJoinAndSelect("inventario.execucoes", "execucao")
                            .where("inventario.id = :id", { id: request.params.inventarioId })
                            .getOne();
            return inventario.execucoes;
            
          }
          catch(error) {
            return response.status(401).send(error);
          }
    }

    async finalizarContagem(request: Request, response: Response, next: NextFunction) {
        console.log('entrou no finalizarContagem');
        const list = await this.repositoryContagem.createQueryBuilder("contagem")
                            .innerJoin("contagem.inventario", "inventario")
                            .where("contagem.status= :status", { status: '0' })
                            .andWhere("inventario.id = :id", { id: request.params.inventarioId })
                            .getMany();

        console.log('list.length='+list.length);
        console.log('request.params.inventarioId='+request.params.inventarioId);

        if (list.length > 0 ){
            return response.status(500).send('existem '+list.length+' iten(s) pendente(s) de contagem.');
        }
        //finalizarContagem`(p_inve_id , p_exec_id , p_numero_contagem )
        var sql = 'CALL finalizarContagem('+request.params.inventarioId+','+request.body.id+','+request.body.numeroContagem+')';
        console.log('executou a procedure ' + sql);
        const result = await this.manager.query(sql);

        const inventario = await this.repositoryInventario.createQueryBuilder("inventario")
                            .leftJoinAndSelect("inventario.execucoes", "execucao")
                            .where("inventario.id = :id", { id: request.params.inventarioId })
                            .getOne();
        return inventario.execucoes;
    }

}
