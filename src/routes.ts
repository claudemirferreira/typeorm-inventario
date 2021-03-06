import { UserController } from './controller/UserController';
import {InventarioController} from "./controller/InventarioController";
import { ContagemController } from "./controller/ContagemController";
import { ItemController } from "./controller/ItemController";
import { ItemXlsController } from "./controller/ItemXlsController";
import { EnderecoController } from "./controller/EnderecoController";
import { ExecucaoController } from "./controller/ExecucaoController";
import { EmpresaController } from "./controller/EmpresaController";
import { PerfilController } from "./controller/PerfilController";
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
        route: "/contagem/inventario/:id",
        controller: ContagemController,
        action: "findIdInventario"
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
    },

    //item
    {
        method: "get",
        route: "/item/importItens/:inventarioId",
        controller: ItemController,
        action: "importItens"
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
    },{
        method: "get",
        route: "/item/inventario/:inventarioId",
        controller: ItemController,
        action: "listByInventario"
    },


    //listByInventario
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
        route: "/item-import/all/:inventarioId",
        controller: ItemXlsController,
        action: "importarItens"
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
        route: "/execucao/iniciarContagem/:inventarioId",
        controller: ExecucaoController,
        action: "iniciarContagem"
    }, {
        method: "put",
        route: "/execucao/finalizarContagem/:inventarioId",
        controller: ExecucaoController,
        action: "finalizarContagem"
    },

    //inventario
    {
        method: "get",
        route: "/empresa/find",
        controller: EmpresaController,
        action: "all"
    }, {
        method: "post",
        route: "/empresa",
        controller: EmpresaController,
        action: "save"
    }, {
        method: "put",
        route: "/empresa",
        controller: EmpresaController,
        action: "update"
    }, {
        method: "get",
        route: "/empresa/:cnpj",
        controller: EmpresaController,
        action: "one"
    }, {
        method: "delete",
        route: "/empresa/:cnpj",
        controller: EmpresaController,
        action: "remove"
    },

    //User
    {
        method: "get",
        route: "/user",
        controller: UserController,
        action: "all"
    },
    {
        method: "get",
        route: "/user/:id",
        controller: UserController,
        action: "one"
    },
    {
        method: "post",
        route: "/user/authentication",
        controller: UserController,
        action: "authentication"
    },
    {
        method: "post",
        route: "/user",
        controller: UserController,
        action: "save"
    },
    {
        method: "delete",
        route: "/user/:id",
        controller: UserController,
        action: "remove"
    }, {
        method: "put",
        route: "/user/:id",
        controller: UserController,
        action: "update"
    },

    {
        method: "get",
        route: "/perfil/find-perfil",
        controller: PerfilController,
        action: "findPerfil"
    },

    {
        method: "get",
        route: "/perfil/find-user-perfis",
        controller: PerfilController,
        action: "findPerfilByLoggedUser"
    }

];