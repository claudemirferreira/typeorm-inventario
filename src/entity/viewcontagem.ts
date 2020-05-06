import {ViewEntity, ViewColumn} from "typeorm";

@ViewEntity({ 
    expression: `
    SELECT DISTINCT
    "a"."codigo" AS "codigo",
    "a"."nome" AS "nome",
    "c"."numeroContagem" AS "numeroContagem",
    "a"."quantidadeSistema" AS "quantidadeSistema",
    "c"."inve_id" AS "inventarioId",
    (SELECT 
            SUM("d"."quantidade")
        FROM
            ("inv_contagem" "d"
            JOIN "inv_endereco" "f")
        WHERE
            (("d"."ende_id" = "f"."ende_id")
                AND ("f"."codigo" = "a"."codigo"))) AS "quantidadeFisica"
FROM
    (("inv_item" "a"
    JOIN "inv_endereco" "b")
    JOIN "inv_contagem" "c")
WHERE
    (("a"."codigo" = "b"."codigo")
        AND ("b"."ende_id" = "c"."ende_id"))
    `
})
export class VwContagem {

    @ViewColumn()
    codigo: string;

    @ViewColumn()
    nome: string;

    @ViewColumn()
    numeroContagem: string;

    @ViewColumn()
    quantidadeSistema: number;

    @ViewColumn()
    quantidadeFisica: number;

    @ViewColumn()
    inventarioId: number;

    
}
