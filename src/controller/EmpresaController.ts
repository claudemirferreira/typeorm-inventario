import { EmpresaFilterQuery } from './../filter/empresa-filter-request';

import { getRepository, Like } from 'typeorm';
import { NextFunction, Request, Response, query } from "express";
import { Empresa } from '../entity/Empresa';

export class EmpresaController {
    
    private repository = getRepository(Empresa);

    async all(request: Request, response: Response, next: NextFunction) {
        var filter:EmpresaFilterQuery = new EmpresaFilterQuery(request.query);
        
        
        let query = this.repository.createQueryBuilder("empresa");
        
        if(filter.cnpj) {
            query = query.andWhere("empresa.cnpj like :cnpj", {cnpj: filter.cnpj+'%'})
        } else if(filter.nome) {
            query = query.andWhere("empresa.nome like :nome", {nome: '%'+filter.nome+'%'})
        } 
        
        return query.getMany();
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