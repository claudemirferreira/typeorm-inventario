import "reflect-metadata";
import {createConnection} from "typeorm";
import * as express from "express";
import * as bodyParser from "body-parser";
import {Request, Response} from "express";
import {Routes} from "./routes";


createConnection().then(async connection => {

    // create express appconne
    const app = express();
    const middleware = require("../src/middleware/auth")
    var cors = require('cors');

    app.use(cors());
    app.use(bodyParser.json());

    var cors = require("cors");
    app.use(cors());


    // register express routes from defined application routes
    Routes.forEach(route => {
        //(app as any) [route.method] (route.route, middleware, (req: Request, res: Response, next: Function) => {

        (app as any) [route.method] (route.route, middleware, (req: Request, res: Response, next: Function) => {
            const result = (new (route.controller as any))[route.action] (req, res, next);
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
    var port = process.env.PORT || 3000;
    app.listen(port);

    // insert new users for test
    /* 
   await connection.manager.save(connection.manager.create(Inventario, {
        data: new Date(),
        nome: "Administrador",
        status: 1,
    }));
    */  
    
    console.log("Express server has started on port " + port + ". Open http://localhost:"+port+"/users to see results");

}).catch(error => console.log(error));