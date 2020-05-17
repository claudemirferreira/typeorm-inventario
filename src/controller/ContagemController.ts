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
        return await this.repository.createQueryBuilder("contagem")
            .innerJoinAndSelect("contagem.endereco", "endereco")
            .innerJoinAndSelect("endereco.item", "item")
            .where("item.codigo= :codigo", { codigo: request.params.codigo })
            .getMany();
    }

    async finalizarContagem(request: Request, response: Response, next: NextFunction) {

        if (request.params.numeroContagem != '1'
            && request.params.numeroContagem != '2'
            && request.params.numeroContagem != '3') {
            console.error('numero da contagem invalido: ' + request.params.numeroContagem);
            response.status(500).send('numero da contagem invalido: ' + request.params.numeroContagem);
            return response;
        }

        const list = await getRepository(Contagem)
            .createQueryBuilder("contagem")
            .innerJoin("contagem.endereco", "endereco")
            .innerJoin("endereco.item", "item")
            .select("item.codigo codigo")
            .addSelect("SUM(contagem.quantidade)", "quantidade")
            .where("contagem.numeroContagem= :numeroContagem", { numeroContagem: request.params.numeroContagem })
            .groupBy("item.codigo")
            .getRawMany();

        // atualizar a quantidade dos itens 
        list.forEach(element => {
            //primeira contagem
            if (request.params.numeroContagem == '1') {
                this.repositoryItem
                    .createQueryBuilder()
                    .update(Item)
                    .set({ primeiraContagem: element.quantidade })
                    .where("codigo = :codigo", { codigo: element.codigo })
                    .execute();
                    // segunda contagem
            } else if (request.params.numeroContagem == '2') {
                this.repositoryItem
                    .createQueryBuilder()
                    .update(Item)
                    .set({ segundaContagem: element.quantidade })
                    .where("codigo = :codigo", { codigo: element.codigo })
                    .execute();
                    // terceira contagem
            } else if (request.params.numeroContagem == '3') {
                this.repositoryItem
                    .createQueryBuilder()
                    .update(Item)
                    .set({ terceiraContagem: element.quantidade })
                    .where("codigo = :codigo", { codigo: element.codigo })
                    .execute();
            }

        });

        return list;
    }

    async listContagemStatus(request: Request, response: Response, next: NextFunction) {
        return await this.repository.createQueryBuilder("contagem")
            .innerJoinAndSelect("contagem.inventario", "inventario")
            .where("contagem.status= :status", { status: request.body.status })
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

    //servico para gerar o inventario
    async gerarPrimeriraContagem(request: Request, response: Response, next: NextFunction) {
        const list = await this.repositoryEndereco.find();
        var inventario = new Inventario();
        inventario.id = request.body.idInventario;

        list.forEach(element => {
            var endereco = new Endereco();
            endereco.id = element.id;

            var json = {
                'numeroContagem': '1',//request.body.numeroContagem,
                'status': '0',
                'quantidade': 0,
                'observacao': '',
                'data': null,
                'inventario': inventario,
                'endereco': endereco
            };

            this.repository.save(json);

        });

        return 'ok';
    }

    //servico para gerar o inventario
    async gerarSegundaContagem(request: Request, response: Response, next: NextFunction) {

        //const list = await this.repositoryEndereco.find();
        var inventario = new Inventario();
        inventario.id = request.body.idInventario;

        return await getRepository(Endereco)
            .createQueryBuilder("endereco")
            .innerJoinAndSelect("endereco.item", "item")
            .where("item.quantidadeSistema != item.primeiraContagem")
            .getRawMany();
    }

    //servico para gerar o inventario
    async gerarTerceiraContagem(request: Request, response: Response, next: NextFunction) {
        const list = await this.repositoryEndereco.find();
        var inventario = new Inventario();
        inventario.id = request.body.idInventario;

        list.forEach(element => {
            var endereco = new Endereco();
            endereco.id = element.id;

            var json = {
                'numeroContagem': '3', //request.body.numeroContagem,
                'status': '0',
                'quantidade': 0,
                'observacao': '',
                'data': null,
                'inventario': inventario,
                'endereco': endereco
            };

            this.repository.save(json);

        });

        return 'ok';
    }

}