import { getRepository } from "typeorm";
import {NextFunction, Request, Response} from "express";
import { Item } from "../entity/item";
import { Endereco } from "../entity/endereco";

export class EnderecoController {

    private repository = getRepository(Endereco);

    async all(request: Request, response: Response, next: NextFunction) {

        var sql = ' SELECT distinct codigo, endereco FROM inv_item_xls ';

        const list = await this.repository.query( sql );
        
        list.forEach(element => {
            let item = new Item();
            item.id = element.id;
            var json = {
                        'descricao': element.endereco,
                        'item': item
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

}
