CREATE DEFINER=`root`@`localhost` PROCEDURE `iniciarPrimeiraContagem`(IN p_inve_id INT)
BEGIN
	DELETE FROM inv_contagem WHERE inve_id = p_inve_id;
    
	-- inseri os itens na contagens
	INSERT INTO inv_contagem  (numeroContagem, status, quantidade, observacao, data, inve_id, ende_id)
	SELECT '1' numeroContagem, '0' status, 0 quantidade, '' observacao, null data, b.inve_id, a.ende_id
	FROM inv_endereco a 
	INNER JOIN inv_item b on a.item_id = b.item_id
	WHERE b.inve_id = p_inve_id;

END