import {getRepository} from "typeorm";
import {NextFunction, Request, Response} from "express";
import {Inventario} from "../entity/inventario";

export class InventarioController {

    private repository = getRepository(Inventario);

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

        this.repository.delete(request.params.id)
            .then((successResponse) => {
            if (successResponse) {
                return response.send(200);
            } else {
                return next(response.send(400));
            }
        });
        
    }

}