import {getRepository, getManager} from "typeorm";
import {NextFunction, Request, Response} from "express";
import { ItemXls } from "../entity/item-xls";

export class ItemXlsController {

    private repository = getRepository(ItemXls);

    private manager = getManager(); 

    async all(request: Request, response: Response, next: NextFunction) {
        return this.repository.find();
    }

    async one(request: Request, response: Response, next: NextFunction) {
        return this.repository.findOne(request.params.id);
    }

    async save(request: Request, response: Response, next: NextFunction) {
        console.log(0);
        const list = await this.repository.save(request.body);
        console.log(1);
        var sql = 'CALL importarItens(1)';
        const result = await this.manager.query(sql);
        console.log(2);
        return list;
    }

    async remove(request: Request, response: Response, next: NextFunction) {
        let userToRemove = await this.repository.findOne(request.params.id);
        await this.repository.remove(userToRemove);
    }

    async importarItens(request: Request, response: Response, next: NextFunction) {
        console.log('iniciou a importacao item-xls');
        const list = await this.repository.save(request.body);
        console.log('iniciou a importacao item e endereco');
        var sql = 'CALL importarItens(1)';
        const result = await this.manager.query(sql);
        console.log('importcao concluida');
        return list;
    }

}