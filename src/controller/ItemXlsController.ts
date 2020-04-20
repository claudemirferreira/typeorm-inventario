import {getRepository} from "typeorm";
import {NextFunction, Request, Response} from "express";
import { ItemXls } from "../entity/item-xls";

export class ItemXlsController {

    private repository = getRepository(ItemXls);

    async all(request: Request, response: Response, next: NextFunction) {
        return this.repository.find();
    }

    async one(request: Request, response: Response, next: NextFunction) {
        return this.repository.findOne(request.params.id);
    }

    async save(request: Request, response: Response, next: NextFunction) {
        return this.repository.save(request.body);
    }

    //import todos os itens
    async saveAll(request: Request, response: Response, next: NextFunction) {
        /*
        console.log(JSON.stringify(request.body));
        var data = request.body;

        data.forEach(function (item) {
            console.log(item.codigo);
            console.log(item.nome);
        });        
        */

        return this.repository.save(request.body);
    }

    async remove(request: Request, response: Response, next: NextFunction) {
        let userToRemove = await this.repository.findOne(request.params.id);
        await this.repository.remove(userToRemove);
    }

}