CREATE DEFINER=`root`@`localhost` PROCEDURE `finalizarContagem`(IN p_inve_id INT
																, IN p_exec_id INT
                                                                , IN p_numero_contagem VARCHAR(1))
BEGIN	
    -- Declare local variables
   DECLARE done BOOLEAN DEFAULT 0;
   DECLARE v_item_id INT;
   DECLARE v_quantidade DECIMAL(20,2);
   DECLARE v_numero_contagem varchar(1);
   -- Declare the cursor
   DECLARE cursorContagem CURSOR FOR
		SELECT c.item_id item_id, sum( a.quantidade) quantidade
		FROM inv_contagem a , inv_endereco b, inv_item c
		WHERE a.ende_id = b.ende_id	
        AND c.item_id = b.item_id
		AND a.inve_id = p_inve_id 
        AND a.numeroContagem = p_numero_contagem
		GROUP BY c.item_id;                            
   -- Declare continue handler
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;   
   -- Open the cursor
   OPEN cursorContagem;
   -- Loop through all rows
   REPEAT
      -- Get order number
      FETCH cursorContagem INTO v_item_id, v_quantidade;
        -- atualizar os totais das contagens realizadas
        if p_numero_contagem = '1' then
			UPDATE inv_item SET primeiraContagem = v_quantidade 
			WHERE item_id = v_item_id;        
		elseif p_numero_contagem = '2' then
			UPDATE inv_item SET segundaContagem = v_quantidade 
			WHERE item_id = v_item_id;           
		elseif p_numero_contagem = '3' then
			UPDATE inv_item SET terceiraContagem = v_quantidade 
			WHERE item_id = v_item_id;        
        end if;        
        
   -- End of loop
   UNTIL done END REPEAT;
   -- Close the cursor
   CLOSE cursorContagem;   
	-- atualiza a data fim da contagem
	UPDATE inv_execucao SET fim = now() WHERE exec_id = p_exec_id;
    if p_numero_contagem = '1' then
		set v_numero_contagem = '2';
    elseif p_numero_contagem = '2' then
		set v_numero_contagem = '3';
    elseif p_numero_contagem = '3' then
		set v_numero_contagem = '4';
    end if;
    -- incrementa o status para a proxima contagem
    UPDATE inv_inventario SET numeroContagem = v_numero_contagem WHERE inve_id = p_inve_id;
END