import { compareSync, hashSync} from 'bcryptjs';
import {sign} from 'jsonwebtoken';
import { getRepository } from 'typeorm';
import { User } from './../entity/User';
import { NextFunction, Request, Response } from "express";

export class UserController {
    
    private repository = getRepository(User);

    async one(request: Request, response: Response, next: NextFunction) {
        return this.repository.findOne(request.params.id);
    }

    async save(request: Request, response: Response, next: NextFunction) {
        const password = await hashSync(request.body.password, 10);
        request.body.password = password;
        return this.repository.save(request.body);
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
            .where('user.username = :username', {username: login})
            .getOne();

        if(!user) {
            response.status(400).json({error: "User or password invalid !"});
        }

        if(!user.active) {
            response.status(400).json({error: "User inactive !"});
        }

        if(!(await compareSync(password, user.password))) {
            response.status(400).json({error: "User or password invalid !"});
        }
        
        var json = JSON.stringify({
            id: user.codigo,
            nome: user.nome,
            username: user.username, 
            token: sign({id: user.codigo, username: user.username}, "secret", {
                expiresIn: 86400
            })
        });

        return json;
    }

}