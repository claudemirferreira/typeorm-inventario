import {getRepository, getManager} from "typeorm";
import {NextFunction, Request, Response} from "express";
import { ItemXls } from "../entity/item-xls";
import { Inventario } from "../entity/inventario";

export class ItemXlsController {

    private repository = getRepository(ItemXls);

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

    async importarItens(request: Request, response: Response, next: NextFunction) {
        console.log('iniciou a importacao item-xls');
        var itensXls = request.body;
        var inventario = new Inventario();
        inventario.id = Number(request.params.inventarioId);
        itensXls.forEach(element => {
            element.inventario = inventario;
        });
        const list = await this.repository.save(request.body);
        console.log('iniciou a importacao item e endereco');
        var sql = 'CALL importarItens('+request.params.inventarioId+')';
        console.log('executou a procedure ' + sql);
        const result = await this.manager.query(sql);
        console.log('importcao concluida');
        return list;
    }

}