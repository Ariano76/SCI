<?php



class TransactionSCI 
{

private $DB_HOST = 'localhost'; //localhost server 
private $DB_NAME = 'bd_bha_sci'; //database name
private $DB_USER = 'root'; //database username
private $DB_PASSWORD = ''; //database password 

	/**
     * PDO instance
     * @var PDO 
     */
	private $pdo;
	//private $conn;

  	/**
     * Open the database connection
     */
  	public function __construct() {
  		$this->Connect();  	 

  	}

  	public function Connect() {
  	    // open database connection
  		$dsn = 'mysql:host=' . $this->DB_HOST . ';dbname=' . $this->DB_NAME;
  		//echo "Connected successfully";  		
  		try {
  			$this->pdo = new PDO($dsn, $this->DB_USER, $this->DB_PASSWORD );		
  		} catch (PDOException $e) {
  			die($e->getMessage());
  		}

  	}

    /**
     * Transfer money between two accounts
     * @param int $from
     * @param int $to
     * @param float $amount
     * @return true on success or false on failure.
     */
    public function transfer($from, $to, $amount) {

    	try {
    		$this->pdo->beginTransaction();

            // get available amount of the transferer account
    		$sql = 'SELECT amount FROM accounts WHERE id=:from';
    		$stmt = $this->pdo->prepare($sql);
    		$stmt->execute(array(":from" => $from));
    		$availableAmount = (int) $stmt->fetchColumn();
    		$stmt->closeCursor();

    		if ($availableAmount < $amount) {
    			echo 'Insufficient amount to transfer';
    			return false;
    		}
            // deduct from the transferred account
    		$sql_update_from = 'UPDATE accounts
    		SET amount = amount - :amount
    		WHERE id = :from';
    		$stmt = $this->pdo->prepare($sql_update_from);
    		$stmt->execute(array(":from" => $from, ":amount" => $amount));
    		$stmt->closeCursor();

            // add to the receiving account
    		$sql_update_to = 'UPDATE accounts
    		SET amount = amount + :amount
    		WHERE id = :to';
    		$stmt = $this->pdo->prepare($sql_update_to);
    		$stmt->execute(array(":to" => $to, ":amount" => $amount));

            // commit the transaction
    		$this->pdo->commit();

    		echo 'The amount has been transferred successfully';

    		return true;
    	} catch (PDOException $e) {
    		$this->pdo->rollBack();
    		die($e->getMessage());
    	}
    }

    public function prueba(){
    	if (!$pdo) {
    		die("Connection failed: " . mysqli_connect_error());
    	}
    	echo "Connected successfully....";
    }


    public function limpiarStage() {
    	try { 	    		

            // calling stored procedure command
    		$sql = 'CALL SP_LimpiarTablaStage(@total)';
    		// prepare for execution of the stored procedure
    		$stmt = $this->pdo->prepare($sql);
    		// si hubiera parametros se utiliza este codigo pass value to the command
        	//$stmt->bindParam(':id', $customerNumber, PDO::PARAM_INT);
    		
    		// execute the stored procedure
    		$stmt->execute();
    		$stmt->closeCursor();

        	 // execute the second query to get customer's level
    		$row = $this->pdo->query("SELECT @total AS resultado")->fetch(PDO::FETCH_ASSOC);
    		if ($row) {
    			return $row !== false ? $row['resultado'] : null;
    		}
    		
    		//echo 'La operación se realizo satisfactoriamente';

    		return true;
    	} catch (PDOException $e) {    		
    		die("Error ocurrido:" . $e->getMessage());
    	}
    	return null;
    }

    public function limpiarDobleEspacioBlanco() {
    	try { 	    		
            // calling stored procedure command
    		$sql = 'CALL SP_UpdateDobleEspacioBlanco(@total)';
    		// prepare for execution of the stored procedure
    		$stmt = $this->pdo->prepare($sql);    		    	
    		// execute the stored procedure
    		$stmt->execute();
    		$stmt->closeCursor();
        	 // execute the second query to get customer's level
    		$row = $this->pdo->query("SELECT @total AS resultado")->fetch(PDO::FETCH_ASSOC);
    		if ($row) {
    			return $row !== false ? $row['resultado'] : null;
    		} 
    		//echo 'La operación se realizo satisfactoriamente';
    		return true;
    	} catch (PDOException $e) {    		
    		die("Error ocurrido:" . $e->getMessage());
    	}
    	return null;
    }

    public function limpiarTabulador() {
    	try { 	    		
            // calling stored procedure command
    		$sql = 'CALL SP_UpdateTab(@total)';
    		// prepare for execution of the stored procedure
    		$stmt = $this->pdo->prepare($sql);    		    	
    		// execute the stored procedure
    		$stmt->execute();
    		$stmt->closeCursor();
        	 // execute the second query to get customer's level
    		$row = $this->pdo->query("SELECT @total AS resultado")->fetch(PDO::FETCH_ASSOC);
    		if ($row) {
    			return $row !== false ? $row['resultado'] : null;
    		} 
    		//echo 'La operación se realizo satisfactoriamente';
    		return true;
    	} catch (PDOException $e) {    		
    		die("Error ocurrido:" . $e->getMessage());
    	}
    	return null;
    }    

	public function limpiarSaltoLinea() {
    	try { 	    		
            // calling stored procedure command
    		$sql = 'CALL SP_UpdateSaltoLinea(@total)';
    		// prepare for execution of the stored procedure
    		$stmt = $this->pdo->prepare($sql);    		    	
    		// execute the stored procedure
    		$stmt->execute();
    		$stmt->closeCursor();
        	 // execute the second query to get customer's level
    		$row = $this->pdo->query("SELECT @total AS resultado")->fetch(PDO::FETCH_ASSOC);
    		if ($row) {
    			return $row !== false ? $row['resultado'] : null;
    		} 
    		//echo 'La operación se realizo satisfactoriamente';
    		return true;
    	} catch (PDOException $e) {    		
    		die("Error ocurrido:" . $e->getMessage());
    	}
    	return null;
    }    

	public function limpiarLetraPuntoGuion() {
    	try { 	    		
            // calling stored procedure command
    		$sql = 'CALL SP_UpdateLetrasPuntoGuion(@total)';
    		// prepare for execution of the stored procedure
    		$stmt = $this->pdo->prepare($sql);    		    	
    		// execute the stored procedure
    		$stmt->execute();
    		$stmt->closeCursor();
        	 // execute the second query to get customer's level
    		$row = $this->pdo->query("SELECT @total AS resultado")->fetch(PDO::FETCH_ASSOC);
    		if ($row) {
    			return $row !== false ? $row['resultado'] : null;
    		} 
    		//echo 'La operación se realizo satisfactoriamente';
    		return true;
    	} catch (PDOException $e) {    		
    		die("Error ocurrido:" . $e->getMessage());
    	}
    	return null;
    }    

	public function limpiarBackSlash() {
    	try { 	    		
            // calling stored procedure command
    		$sql = 'CALL SP_UpdateBackSlash(@total)';
    		// prepare for execution of the stored procedure
    		$stmt = $this->pdo->prepare($sql);    		    	
    		// execute the stored procedure
    		$stmt->execute();
    		$stmt->closeCursor();
        	 // execute the second query to get customer's level
    		$row = $this->pdo->query("SELECT @total AS resultado")->fetch(PDO::FETCH_ASSOC);
    		if ($row) {
    			return $row !== false ? $row['resultado'] : null;
    		} 
    		//echo 'La operación se realizo satisfactoriamente';
    		return true;
    	} catch (PDOException $e) {    		
    		die("Error ocurrido:" . $e->getMessage());
    	}
    	return null;
    }    

	public function limpiarEspacioBlanco() {
    	try { 	    		
            // calling stored procedure command
    		$sql = 'CALL SP_UpdateTrim(@total)';
    		// prepare for execution of the stored procedure
    		$stmt = $this->pdo->prepare($sql);    		    	
    		// execute the stored procedure
    		$stmt->execute();
    		$stmt->closeCursor();
        	 // execute the second query to get customer's level
    		$row = $this->pdo->query("SELECT @total AS resultado")->fetch(PDO::FETCH_ASSOC);
    		if ($row) {
    			return $row !== false ? $row['resultado'] : null;
    		} 
    		//echo 'La operación se realizo satisfactoriamente';
    		return true;
    	} catch (PDOException $e) {    		
    		die("Error ocurrido:" . $e->getMessage());
    	}
    	return null;
    }        

	public function recodificarSINO() {
    	try { 	    		
            // calling stored procedure command
    		$sql = 'CALL SP_UpdateRecodificarSiNo(@total)';
    		// prepare for execution of the stored procedure
    		$stmt = $this->pdo->prepare($sql);    		    	
    		// execute the stored procedure
    		$stmt->execute();
    		$stmt->closeCursor();
        	 // execute the second query to get customer's level
    		$row = $this->pdo->query("SELECT @total AS resultado")->fetch(PDO::FETCH_ASSOC);
    		if ($row) {
    			return $row !== false ? $row['resultado'] : null;
    		} 
    		//echo 'La operación se realizo satisfactoriamente';
    		return true;
    	} catch (PDOException $e) {    		
    		die("Error ocurrido:" . $e->getMessage());
    	}
    	return null;
    }        

	public function actualizarDataTransito() {
    	try { 	    		
            // calling stored procedure command
    		$sql = 'CALL SP_UpdateInfoTransito(@total)';
    		// prepare for execution of the stored procedure
    		$stmt = $this->pdo->prepare($sql);    		    	
    		// execute the stored procedure
    		$stmt->execute();
    		$stmt->closeCursor();
        	 // execute the second query to get customer's level
    		$row = $this->pdo->query("SELECT @total AS resultado")->fetch(PDO::FETCH_ASSOC);
    		if ($row) {
    			return $row !== false ? $row['resultado'] : null;
    		} 
    		//echo 'La operación se realizo satisfactoriamente';
    		return true;
    	} catch (PDOException $e) {    		
    		die("Error ocurrido:" . $e->getMessage());
    	}
    	return null;
    }        

	/**
     * close the database connection
     */
	public function __destruct() {
        // close the database connection
		$this->pdo = null;
	}

}


?>