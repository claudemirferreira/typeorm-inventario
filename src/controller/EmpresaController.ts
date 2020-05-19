
import { getRepository, Like } from 'typeorm';
import { NextFunction, Request, Response } from "express";
import { Empresa } from '../entity/Empresa';

export class EmpresaController {
    
    private repository = getRepository(Empresa);

    async find(request: Request, response: Response, next: NextFunction) {
        var sql = "SELECT * FROM saa_empresa where cnpj like '"+ request.body.cnpj +"%' or nome like '" + request.body.nome + "%'";
        console.log(sql);
        return await this.repository.query(sql);
    }

    async all(request: Request, response: Response, next: NextFunction) {
        return this.repository.find();
    }

    async one(request: Request, response: Response, next: NextFunction) {
        return this.repository.findOne(request.params.cnpj);
    }

    async save(request: Request, response: Response, next: NextFunction) {
        return this.repository.save(request.body);
    }

    async remove(request: Request, response: Response, next: NextFunction) {
        let user = await this.repository.findOne(request.params.cnpj);
        const result = await this.repository.delete(request.params.cnpj);
        return response.send(result);
    }

}