import { compareSync, hashSync } from 'bcryptjs';
import { NextFunction, Request, Response } from "express";
import { sign } from 'jsonwebtoken';
import { getManager, getRepository } from 'typeorm';
import { UsuarioFilterQuery } from '../filter/usuario-filter-request';
import { Empresa } from './../entity/Empresa';
import { Perfil } from './../entity/Perfil';
import { User } from './../entity/User';
import { PageWrapper } from './../wrapper/page-wrapper';

export class UserController {
    
    private repository = getRepository(User);
    private perfilRepository = getRepository(Perfil);
    private empresaRepository = getRepository(Empresa);

    async all(request: Request, response: Response, next: NextFunction) {           
        const filter: UsuarioFilterQuery = new UsuarioFilterQuery(request.query);
        const wrapper = new PageWrapper<User>();
        var result = null;
        var count = null;
        
        if(filter.name || filter.login) {
            result = await this.repository.createQueryBuilder('user')
                .innerJoinAndSelect('user.perfis as perfis', 'perfis')
                .innerJoinAndSelect('user.empresa', 'empresa')
                .where('user.active = :active', {'active': filter.is_active})
                .andWhere('user.nome or user.username like :name', {'name': '%'+filter.name+'%'})
                .orderBy(filter.ordering)
                .skip(filter.limit*(filter.page))
                .take(filter.limit)
                .getMany();
            count = await this.repository.createQueryBuilder("user")
                .select(" COUNT(*) ", "sum")
                .andWhere('user.nome like :name', {'name': '%'+filter.name+'%'})
                .getRawOne();
        } else {
            result = await this.repository.createQueryBuilder('user')
                .innerJoinAndSelect('user.perfis', 'perfis')
                .innerJoinAndSelect('user.empresa', 'empresa')
                .where('user.active = :active', {'active': filter.is_active})
                .orderBy(filter.ordering)
                .skip(filter.limit*(filter.page))
                .take(filter.limit)
                .getMany();
            
            count = await this.repository.createQueryBuilder("user").select(" COUNT(*) ", "sum").getRawOne();
        }
        
        const hasNextPage = ((filter.page + 1) * filter.limit) <= count['sum'] ? true : false;

        wrapper.results = result;
        wrapper.count = parseInt(count['sum']);
        wrapper.next = hasNextPage ? wrapper.nextPage(filter.page) : -1;
        wrapper.previous = wrapper.previusPage(filter.page);

        return wrapper;        
    }

    async one(request: Request, response: Response, next: NextFunction) {
        return this.repository.findOne(request.params.id);
    }

    async save(request: Request, response: Response, next: NextFunction) {
        const password = await hashSync(request.body.password, 10);
        request.body.password = password;
        const manager = getManager();

        const user = await this.repository.createQueryBuilder("user")
            .where("user.username = :username", {username: request.body.username})
            .getOne();

        const empresa = await this.empresaRepository.createQueryBuilder("empresa")
            .where("empresa.cnpj = :cnpj", {cnpj: request.body.empresa.cnpj})
            .getOne();

        if(!user) {
            
            const perfis = await this.perfilRepository.createQueryBuilder("perfil")
                .where("perfil.id in (:ids)", {ids: request.body.perfis})    
                .getMany()
            
            request.body.empresa = empresa;
            const newuser = await this.repository.save(request.body);
            newuser.perfis = perfis;

            return this.repository.save(newuser);;
        }

        response.status(400).json({message: "Usuário com o login " + request.body.username + " já existe"});
    }

    async update(request: Request, response: Response, next: NextFunction) {
        const id = request.params.id;
        
        let user = await this.repository.createQueryBuilder("user")
            .where("user.codigo = :id", {id: id})
            .getOne();

        user.empresa = request.body.empresa;

        if(!user) {
            response.status(404).json({message: "Usuário com ID " + id + " não foi encontrado"});
        }

        if(request.body.password) {
            const password = await hashSync(request.body.password, 10);
            user.password = password;
        }
        
        if(request.body.perfis && request.body.perfis.length > 0) {
            const perfis = await this.perfilRepository.createQueryBuilder("perfil")
                .where("perfil.id in (:ids)", {ids: request.body.perfis})    
                .getMany();
            
            user.perfis = [];
            const userupdate = await this.repository.save(user);
            userupdate.perfis = perfis; 
        }
        
        return await this.repository.save(user);
    }

    async remove(request: Request, response: Response, next: NextFunction) {
        let user = await this.repository.findOne(request.params.id);
        const result = await this.repository.delete(request.params.id);
        return response.send(result);
    }

    async authentication(request: Request, response: Response, next: NextFunction) {        
        var login = request.body.username;
        var password = request.body.password;
        
        const user = await this.repository.createQueryBuilder('user')
            .innerJoinAndSelect("user.empresa", "empresa")
            .innerJoinAndSelect("user.perfis", "perfis")
            .where('user.username = :username', {username: login})
            .getOne();

        if(!user) {
            response.status(400).json({error: "login e senha invalidos !"});
        }

        if(!user.active) {
            response.status(400).json({error: "User inactive !"});
        }

        if(!(await compareSync(password, user.password))) {
            response.status(400).json({error: "login e senha invalidos !"});
        }
        
        var json = JSON.stringify({
            id: user.codigo,
            nome: user.nome,
            username: user.username, 
            empresa: user.empresa,
            perfis: user.perfis,
            token: sign({id: user.codigo, username: user.username}, "secret", {
                expiresIn: 86400
            })
        });

        return json;
    }

}