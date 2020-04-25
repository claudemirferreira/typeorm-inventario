import {getRepository} from "typeorm";
import {NextFunction, Request, Response} from "express";
import { Contagem } from "../entity/contagem";
import { Endereco } from "../entity/endereco";
import { Inventario } from "../entity/inventario";

export class ContagemController {

    private repository = getRepository(Contagem);

    private repositoryEndereco = getRepository(Endereco);

    async all(request: Request, response: Response, next: NextFunction) {
        return await this.repository.find();;
    }

    async one(request: Request, response: Response, next: NextFunction) {
        return this.repository.findOne(request.params.id);
    }

    async save(request: Request, response: Response, next: NextFunction) {
        return this.repository.save(request.body);
    }

    async remove(request: Request, response: Response, next: NextFunction) {
        let userToRemove = await this.repository.findOne(request.params.id);
        await this.repository.remove(userToRemove);
    }

    //servico para gerar o inventario
    async gerarContagem(request: Request, response: Response, next: NextFunction) {
        const list = await this.repositoryEndereco.find();

        var inventario = new Inventario();
        inventario.id = request.body.idInventario;
        
        list.forEach(element => {
            var endereco = new Endereco();
            endereco.id = element.id;
            
            var json = {
                'numeroContagem': request.body.numeroContagem,
                'status': '0', 
                'quantidade': 0, 
                'observacao': '',
                'data': null,
                'inventario': inventario,
                'endereco': endereco
            };
            
            this.repository.save(json);                    
           
        });
        
        return 'ok';
    }

}