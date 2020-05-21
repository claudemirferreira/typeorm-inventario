import { getRepository } from "typeorm";
import { NextFunction, Request, Response } from "express";
import { Execucao } from "../entity/execucao";
import { Inventario } from "../entity/inventario";
import { Contagem } from "../entity/contagem";
import { Endereco } from "../entity/endereco";

export class ExecucaoController {

    private repository = getRepository(Execucao);

    private repositoryInventario = getRepository(Inventario);

    private repositoryContagem = getRepository(Contagem);

    private repositoryEndereco = getRepository(Endereco);

    

    async all(request: Request, response: Response, next: NextFunction) {        
        return this.repository.find();        
    }

    async one(request: Request, response: Response, next: NextFunction) {
        return this.repository.findOne(request.params.id);
    }

    async findIdInventario(request: Request, response: Response, next: NextFunction) {
        const inventario = await this.repositoryInventario.createQueryBuilder("inventario")
                            .leftJoinAndSelect("inventario.execucoes", "execucao")
                            .where("inventario.id = :id", { id: request.params.id })
                            .getOne();
        return inventario.execucoes;
    }

    async save(request: Request, response: Response, next: NextFunction) {
        return this.repository.save(request.body);
    }

    async iniciarContagem(request: Request, response: Response, next: NextFunction) {
        try {
            await this.gerarPrimeriraContagem(request.params.id);
            return await this.repository.update(request.params.id, request.body);
          }
          catch(error) {
            return response.status(401).send(error);
          }
    }

    async finalizarContagem(request: Request, response: Response, next: NextFunction) {
        console.log('request.body.status='+request.body.status);
        console.log('request.params.id='+request.params.id);
        const list = await this.repositoryContagem.createQueryBuilder("contagem")
                            .innerJoin("contagem.inventario", "inventario")
                            .where("contagem.status= :status", { status: '0' })
                            .andWhere("inventario.id = :id", { id: request.params.id })
                            .getMany();

        console.log('list.length='+list.length);

        if (list.length > 0 ){
            return response.status(500).send('existem '+list.length+' iten(s) pendente(s) de contagem.');
        }

        return list;
        /*
        try {
            await this.repository.update(request.params.id, request.body);
            const inventario = await this.repositoryInventario.findOne(request.body.inventario.id);
            return await this.repositoryInventario.update(inventario.id, { status: inventario.status + 1 });
        } catch (error) {
            return response.status(500).send('erro ao atualizar o status do inventario');
        }
        */
    }

    async finalizarContagemOld(request: Request, response: Response, next: NextFunction) {
        const list = await this.repositoryContagem.createQueryBuilder("contagem")
                            .innerJoin("contagem.inventario", "inventario")
                            .where("contagem.status= :status", { status: request.body.status })
                            .andWhere("inventario.id = :id", { id: request.params.id })
                            .getMany();
        if (list.length > 0 ){
            return response.status(500).send('existem itens pendentes de contagem, totoal= '+list.length);
        }

        try {
            await this.repository.update(request.params.id, request.body);
            const inventario = await this.repositoryInventario.findOne(request.body.inventario.id);
            return await this.repositoryInventario.update(inventario.id, { status: inventario.status + 1 });
        } catch (error) {
            return response.status(500).send('erro ao atualizar o status do inventario');
        }
    }


    async remove(request: Request, response: Response, next: NextFunction) {
        let userToRemove = await this.repository.findOne(request.params.id);
        await this.repository.remove(userToRemove);
    }

    private async gerarPrimeriraContagem(idInventario: number) {
        const list = await this.repositoryEndereco.find();
        var inventario = new Inventario();
        inventario.id = idInventario;
        
        list.forEach(element => {
            var endereco = new Endereco();
            endereco.id = element.id;
            
            var json = {
                'numeroContagem': '1',
                'status': '0', 
                'quantidade': 0, 
                'observacao': '',
                'data': null,
                'inventario': inventario,
                'endereco': endereco
            };
            
            this.repositoryContagem.save(json);                    
           
        });
        
        return 'ok';
    }

    private async gerarSegundaContagem(idInventario: number) {
        const list = await this.repositoryEndereco.find();
        var inventario = new Inventario();
        inventario.id = idInventario;
        
        list.forEach(element => {
            var endereco = new Endereco();
            endereco.id = element.id;
            
            var json = {
                'numeroContagem': '1',
                'status': '0', 
                'quantidade': 0, 
                'observacao': '',
                'data': null,
                'inventario': inventario,
                'endereco': endereco
            };
            
            this.repositoryContagem.save(json);                    
           
        });
        
        return 'ok';
    }

}
