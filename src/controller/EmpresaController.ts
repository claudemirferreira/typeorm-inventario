import { NextFunction, Request, Response } from "express";
import { getRepository } from 'typeorm';
import { Empresa } from '../entity/Empresa';
import { EmpresaFilterQuery } from './../filter/empresa-filter-request';


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
        
        return await query.getMany();
    }

    async one(request: Request, response: Response, next: NextFunction) {
        return this.repository.findOne(request.params.cnpj);
    }

    async save(request: Request, response: Response, next: NextFunction) {
        let empresa = await this.repository.createQueryBuilder("empresa")
            .andWhere("empresa.cnpj = :cnpj", {cnpj: request.body.cnpj})
            .getOne();

        if(!empresa) {
            return this.repository.save(request.body);
        }

        response.status(400).json({message: "Empresa já foi cadastrada"}); 
    }

    async update(request: Request, response: Response, next: NextFunction) {
        return this.repository.save(request.body);
    }

    async remove(request: Request, response: Response, next: NextFunction) {
        try {
            const result = await this.repository.delete(request.params.cnpj);
            return response.send(result);
        } catch(error) {
            console.log(error);
            response.status(400).json({message: "Epresa possui itens ou está relacionada a algum inventário"});
        }
    }

}