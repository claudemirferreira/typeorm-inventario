import {InventarioController} from "./controller/InventarioController";
import { ContagemController } from "./controller/ContagemController";
import { ItemController } from "./controller/ItemController";
import { LancamentoController } from "./controller/LancamentoController";

export const Routes = [
    //inventario
    {
        method: "get",
        route: "/inventario",
        controller: InventarioController,
        action: "all"
    }, {
        method: "get",
        route: "/inventario/:id",
        controller: InventarioController,
        action: "one"
    }, {
        method: "post",
        route: "/inventario",
        controller: InventarioController,
        action: "save"
    }, {
        method: "delete",
        route: "/inventario/:id",
        controller: InventarioController,
        action: "remove"
    },

    //contagem
    {
        method: "get",
        route: "/contagem",
        controller: ContagemController,
        action: "all"
    }, {
        method: "get",
        route: "/contagem/:id",
        controller: ContagemController,
        action: "one"
    }, {
        method: "post",
        route: "/contagem",
        controller: ContagemController,
        action: "save"
    }, {
        method: "delete",
        route: "/contagem/:id",
        controller: ContagemController,
        action: "remove"
    },

    //item
    {
        method: "get",
        route: "/item",
        controller: ItemController,
        action: "all"
    }, {
        method: "get",
        route: "/item/:id",
        controller: ItemController,
        action: "one"
    }, {
        method: "post",
        route: "/item",
        controller: ItemController,
        action: "save"
    }, {
        method: "delete",
        route: "/item/:id",
        controller: ItemController,
        action: "remove"
    },

    //lancamento
    {
        method: "get",
        route: "/lancamento",
        controller: LancamentoController,
        action: "all"
    }, {
        method: "get",
        route: "/lancamento/:id",
        controller: LancamentoController,
        action: "one"
    }, {
        method: "post",
        route: "/lancamento",
        controller: LancamentoController,
        action: "save"
    }, {
        method: "delete",
        route: "/lancamento/:id",
        controller: LancamentoController,
        action: "remove"
    }
];