import { getRepository } from "typeorm";
import { NextFunction, Request, Response } from "express";
import { Contagem } from "../entity/contagem";
import { Endereco } from "../entity/endereco";
import { Inventario } from "../entity/inventario";
import { Item } from "../entity/item";

export class ContagemController {

    private repository = getRepository(Contagem);

    private repositoryEndereco = getRepository(Endereco);

    private repositoryItem = getRepository(Item);

    async all(request: Request, response: Response, next: NextFunction) {
        return await this.repository.find();;
    }

    async listItem(request: Request, response: Response, next: NextFunction) {
        console.log('listItem');
        return await this.repository.createQueryBuilder("contagem")
            .innerJoinAndSelect("contagem.endereco", "endereco")
            .innerJoinAndSelect("endereco.item", "item")
            .where("item.codigo= :codigo", { codigo: request.params.codigo })
            .getMany();
    }

    async listContagemStatus(request: Request, response: Response, next: NextFunction) {
        return await this.repository.createQueryBuilder("contagem")
            .innerJoinAndSelect("contagem.inventario", "inventario")
            .where("contagem.numeroContagem= :numeroContagem", { numeroContagem: request.body.status })
            .andWhere("inventario.id = :id", { id: request.params.id })
            .getMany();
    }

    async efetuarContagem(request: Request, response: Response, next: NextFunction) {
        const contagem = await this.repository.findOne(request.params.id);
        return await this.repository.update(request.params.id, {
            status: "1",
            quantidade: request.body.quantidade,
            data: new Date
        });
    }

    async findIdInventario(request: Request, response: Response, next: NextFunction) {
        console.log('findIdInventario');
        const list = await this.repository.createQueryBuilder("contagem")
                            .innerJoin("contagem.inventario", "inventario")
                            .innerJoinAndSelect("contagem.endereco","endereco")
                            .innerJoinAndSelect("endereco.item","item")
                            .where("inventario.id = :id", { id: request.params.id })                            
                            .orderBy({
                                        "contagem.numeroContagem": "DESC",
                                        "item.nome": "ASC"
                                    })
                            .getMany();
        return list;
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