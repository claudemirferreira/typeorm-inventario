import "reflect-metadata";
import {createConnection} from "typeorm";
import * as express from "express";
import * as bodyParser from "body-parser";
import {Request, Response} from "express";
import {Routes} from "./routes";
import { Item } from "./entity/item";
import { Inventario } from "./entity/inventario";


createConnection().then(async connection => {

    // create express app
    const app = express();
    var cors = require('cors');

    app.use(cors());
    app.use(bodyParser.json());

    var cors = require("cors");
    app.use(cors());


    // register express routes from defined application routes
    Routes.forEach(route => {
        (app as any)[route.method](route.route, (req: Request, res: Response, next: Function) => {
            const result = (new (route.controller as any))[route.action](req, res, next);

            if (result instanceof Promise) {
                result.then(result => result !== null && result !== undefined ? res.send(result) : undefined);

            } else if (result !== null && result !== undefined) {
                res.json(result);
            }
        });
    });

    // setup express app here
    // ...

    // start express server
    app.listen(3000);

    // insert new users for test
    /*

   await connection.manager.save(connection.manager.create(Item, {
        nome: "Administrador",
        codigoBarras: "Arroz",
        endereco: "Arroz",
        quantidadeSistema: 10,
        quantidadeFisica: 10,
    }));
    */   

   await connection.manager.save(connection.manager.create(Inventario, {
        data: new Date(),
        nome: "Administrador",
        status: "1",
    }));   
    
    console.log("Express server has started on port 3000. Open http://localhost:3000/users to see results");

}).catch(error => console.log(error));
