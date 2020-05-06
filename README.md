# Awesome Project Build with TypeORM

Steps to run this project:
npm install -g ts-node

1. Run `npm install -g ts-node` command
2. Run `npm i` command
3. Setup database settings inside `ormconfig.json` file
4. Run `npm start` command



CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `VIEW_CONTAGEM` AS
    SELECT DISTINCT
        `a`.`codigo` AS `codigo`,
        `a`.`nome` AS `nome`,
        `a`.`quantidadeSistema` AS `quantidadeSistema`,
        `c`.`numeroContagem` AS `numeroContagem`,
        `c`.`inve_id` AS `inve_id`,
        (SELECT 
                SUM(`d`.`quantidade`)
            FROM
                (`inv_contagem` `d`
                JOIN `inv_endereco` `f`)
            WHERE
                ((`d`.`ende_id` = `f`.`ende_id`)
                    AND (`f`.`codigo` = `a`.`codigo`))) AS `quantidadeFisica`
    FROM
        ((`inv_item` `a`
        JOIN `inv_endereco` `b`)
        JOIN `inv_contagem` `c`)
    WHERE
        ((`a`.`codigo` = `b`.`codigo`)
            AND (`b`.`ende_id` = `c`.`ende_id`))
