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

    async listItem(request: Request, response: Response, next: NextFunction) {
        /*
        return await this.repository.find({ 
            join: {
                alias: "contagem",
                leftJoinAndSelect: {
                    endereco: "contagem.endereco",
                    item: "endereco.item"
                }
            }//
            , where: { "endereco.item.codigo": "106049"} 
        }); request.body "443250"
        */
       return await this.repository.createQueryBuilder("contagem")
        .innerJoinAndSelect("contagem.endereco", "endereco")
        .innerJoinAndSelect("endereco.item", "item")
        .where("item.codigo= :codigo", { codigo: request.body.codigo})
        .getMany();
        

        //return await this.repository.find();;
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
    async gerarPrimeriraContagem(request: Request, response: Response, next: NextFunction) {
        const list = await this.repositoryEndereco.find();
        var inventario = new Inventario();
        inventario.id = request.body.idInventario;
        
        list.forEach(element => {
            var endereco = new Endereco();
            endereco.id = element.id;
            
            var json = {
                'numeroContagem': '1',//request.body.numeroContagem,
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

    //servico para gerar o inventario
    async gerarSegundaContagem(request: Request, response: Response, next: NextFunction) {
        const list = await this.repositoryEndereco.find();
        var inventario = new Inventario();
        inventario.id = request.body.idInventario;
        
        list.forEach(element => {
            var endereco = new Endereco();
            endereco.id = element.id;
            
            var json = {
                'numeroContagem': '2',//request.body.numeroContagem,
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

    //servico para gerar o inventario
    async gerarTerceiraContagem(request: Request, response: Response, next: NextFunction) {
        const list = await this.repositoryEndereco.find();
        var inventario = new Inventario();
        inventario.id = request.body.idInventario;
        
        list.forEach(element => {
            var endereco = new Endereco();
            endereco.id = element.id;
            
            var json = {
                'numeroContagem': '3', //request.body.numeroContagem,
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