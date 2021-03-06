import { getRepository } from "typeorm";
import { NextFunction, Request, Response } from "express";
import { Item } from "../entity/item";

export class ItemController {

    private repository = getRepository(Item);

    async all(request: Request, response: Response, next: NextFunction) {             
        return this.repository.find();        
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

    async listByInventario(request: Request, response: Response, next: NextFunction) {
        return await this.repository.createQueryBuilder("item")
            .innerJoin("item.inventario", "inventario")
            .where("inventario.id = :id", { id: request.params.inventarioId })
            .getMany();
    }


}
