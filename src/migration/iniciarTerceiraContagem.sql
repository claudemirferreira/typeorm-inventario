CREATE DEFINER=`root`@`localhost` PROCEDURE `iniciarTerceiraContagem`(
												IN p_inve_id INT,
                                                IN p_exec_id INT)
BEGIN
	INSERT INTO inv_contagem  (numeroContagem, status, quantidade, observacao, data, inve_id, ende_id)
	select '3' numeroContagem, '0' status, 0 quantidade, '' observacao, null data, inve_id, ende_id
 	from (
    SELECT b.item_id, quantidadeSistema, c.primeiraContagem, c.segundaContagem,
		sum(a.quantidade) quantidadeContagem
				, c.inve_id
		FROM inv_contagem a 
		inner join inv_endereco b on a.ende_id = b.ende_id
		inner join inv_item c on c.item_id = b.item_id
		where a.inve_id = 15 -- p_inve_id
        and a.numeroContagem = '2'
        and c.quantidadeSistema <> c.segundaContagem
        and c.segundaContagem <> c.primeiraContagem
		group by b.item_id, quantidadeSistema, c.primeiraContagem, c.segundaContagem
        ) as itenDivergentes 
 	inner join inv_endereco f on itenDivergentes.item_id = f.item_id 
 	where quantidadeSistema <> quantidadeContagem;
    -- seta a data fim da contagem
    update inv_execucao set inicio = now() where exec_id = p_exec_id;

END