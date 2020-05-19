import {InventarioController} from "./controller/InventarioController";
import { ContagemController } from "./controller/ContagemController";
import { ItemController } from "./controller/ItemController";
import { ItemXlsController } from "./controller/ItemXlsController";
import { EnderecoController } from "./controller/EnderecoController";
import { ExecucaoController } from "./controller/ExecucaoController";
import { EmpresaController } from "./controller/EmpresaController";

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

    //contagem listContagemPendente
    {
        method: "post",
        route: "/contagem/list-contagem-status/:id",
        controller: ContagemController,
        action: "listContagemStatus"
    }, {
        method: "get",
        route: "/contagem/lista/:codigo",
        controller: ContagemController,
        action: "listItem"

    // esse servico soma todas as contagem realizada e atualizar o total na tabela item
    }, {
        method: "post",
        route: "/contagem/finalizar/:numeroContagem",
        controller: ContagemController,
        action: "finalizarContagem"
    }, {
        method: "post",
        route: "/contagem/efetuar-contagem/:id",
        controller: ContagemController,
        action: "efetuarContagem"
    }, {
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
    }, {
        method: "post",
        route: "/contagem/gerar-primeira-contagem",
        controller: ContagemController,
        action: "gerarPrimeriraContagem"
    }, {
        method: "post",
        route: "/contagem/gerar-segunda-contagem/:idInventario",
        controller: ContagemController,
        action: "gerarSegundaContagem"
    }, {
        method: "post",
        route: "/contagem/gerar-terceira-contagem/:idInventario",
        controller: ContagemController,
        action: "gerarTerceiraContagem"
    }, {
        method: "get",
        route: "/contagem/teste",
        controller: ContagemController,
        action: "teste"
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


    //endereco
    {
        method: "get",
        route: "/endereco",
        controller: EnderecoController,
        action: "all"
    }, {
        method: "get",
        route: "/endereco/:id",
        controller: EnderecoController,
        action: "one"
    }, {
        method: "post",
        route: "/endereco",
        controller: EnderecoController,
        action: "save"
    }, {
        method: "delete",
        route: "/endereco/:id",
        controller: EnderecoController,
        action: "remove"

    }, {// http://localhost:3000/item/import-all
       method: "get",
        route: "/item/import",
        controller: ItemController,
        action: "import"
    },   

    //import
    {
        method: "get",
        route: "/item-import",
        controller: ItemXlsController,
        action: "all"
    }, {
        method: "get",
        route: "/item-import/:id",
        controller: ItemXlsController,
        action: "one"
    }, {
        method: "post",
        route: "/item-import",
        controller: ItemXlsController,
        action: "save"
    }, {
        method: "post",
        route: "/item-import/all",
        controller: ItemXlsController,
        action: "save"
    }, {
        method: "delete",
        route: "/item-import/:id",
        controller: ItemXlsController,
        action: "remove"
    },

    //execucao
    {
        method: "get",
        route: "/execucao",
        controller: ExecucaoController,
        action: "all"
    }, {
        method: "get",
        route: "/execucao/:id",
        controller: ExecucaoController,
        action: "one"
    }, {
        method: "post",
        route: "/execucao",
        controller: ExecucaoController,
        action: "save"
    }, {
        method: "delete",
        route: "/execucao/:id",
        controller: ExecucaoController,
        action: "remove"
    }, {
        method: "get",
        route: "/execucao/inventario/:id",
        controller: ExecucaoController,
        action: "findIdInventario"
    }, {
        method: "put",
        route: "/execucao/iniciar-contagem/:id",
        controller: ExecucaoController,
        action: "iniciarContagem"
    }, {
        method: "put",
        route: "/execucao/finalizar-contagem/:id",
        controller: ExecucaoController,
        action: "finalizarContagem"
    },

    //inventario
    {
        method: "get",
        route: "/empresa",
        controller: EmpresaController,
        action: "all"
    }, {
        method: "get",
        route: "/empresa/:cnpj",
        controller: EmpresaController,
        action: "one"
    }, {
        method: "post",
        route: "/empresa",
        controller: EmpresaController,
        action: "save"
    }, {
        method: "delete",
        route: "/empresa/:cnpj",
        controller: EmpresaController,
        action: "remove"
    }, {
        method: "post",
        route: "/empresa/find",
        controller: EmpresaController,
        action: "find"
    }

];