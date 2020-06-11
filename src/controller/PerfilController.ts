import { getRepository } from "typeorm";
import { NextFunction, Request, Response } from "express";
import { Perfil } from "../entity/Perfil";

export class PerfilController {

    private repository = getRepository(Perfil);

    async all(request: Request, response: Response, next: NextFunction) {
        return this.repository.find();        
    }

    async findPerfil(request: Request, response: Response, next: NextFunction) {
        console.log('######### findPerfilUsuario ##########');
        return await this.repository.createQueryBuilder("perfil")
            .innerJoinAndSelect("perfil.perfilRotinas", "perfilRotinas")
            .innerJoinAndSelect("perfilRotinas.rotina", "rotina")
            .printSql()
            .getMany();
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