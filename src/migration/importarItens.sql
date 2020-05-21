CREATE DEFINER=`root`@`localhost` PROCEDURE `importarItens`(IN p_inve_id INT)
BEGIN

	-- DELETE FROM inv_endereco;
    DELETE FROM inv_item WHERE inve_id = p_inve_id;
    
	-- importar os itens para tabela itens
	insert into inv_item (codigo, nome, quantidadeSistema, 
	quantidadeFisica, primeiraContagem, segundaContagem,
	terceiraContagem, empr_cnpj, inve_id )
	select distinct codigo, nome, quantidade as quantidadeSistema, 
	0.00 as quantidadeFisica, 0.00 primeiraContagem, 0.00 segundaContagem,
	0.00 terceiraContagem, null empr_cnpj, inve_id 
	from inv_item_xls where inve_id =p_inve_id;
    
    -- importar os enderecos
    insert into inv_endereco (descricao, item_id)
    SELECT a.endereco, b.item_id 
    FROM dbinventario.inv_item_xls a, dbinventario.inv_item b
	where a.codigo = b.codigo 
	and b.inve_id = p_inve_id;
    
    
END