import {getRepository, DeepPartial} from "typeorm";
import {NextFunction, Request, Response} from "express";
import { Item } from "../entity/item";
import { ItemXls } from "../entity/item-xls";

export class ItemController {

    private repository = getRepository(Item);

    private repositoryItemXls = getRepository(ItemXls);

    async all(request: Request, response: Response, next: NextFunction) {

        var sql = ' select distinct codigo, nome, unidade, quantidade as quantidadeSistema, 0.00 as quantidadeFisica from inv_item_xls ';
        
        const list = await this.repository.query( sql );
        
        list.forEach(element => {
            var json = {'codigo': element.codigo, 
                        'nome': element.nome, 
                        'unidade': element.unidade,
                        'quantidadeSistema': element.quantidadeSistema,
                        'quantidadeFisica': element.quantidadeFisica
                    };
            this.repository.save(json);            
        });
        
        return list;
        
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

    async import(request: Request, response: Response, next: NextFunction) {

        /*
        let list = this.repositoryItemXls.createQueryBuilder("itemXls")
                                .distinctOn(["itemXls.codigo"])
                                .orderBy("itemXls.codigo");
        
        console.log(JSON.stringify(request.body));
        var data = request.body;

        data.forEach(function (item) {
            console.log(item.codigo);
            console.log(item.nome);
        });        
        */

       return 'ok';//this.repository.find();
    }


}
