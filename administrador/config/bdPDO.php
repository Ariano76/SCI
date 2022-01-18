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
        $opciones = array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8');            
  		//echo "Connected successfully";  		

        try {
         $this->pdo = new PDO($dsn, $this->DB_USER, $this->DB_PASSWORD, $opciones);
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


    public function limpiarStage($sp) {
    	try { 	    		

            // calling stored procedure command
    		$sql = "CALL " . $sp . "(@total)";
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

    public function incidencia_Doc_Identidad($sp) {
        try {               
            // calling stored procedure command
            //$sql = 'CALL SP_SelectDocIdentConIncidencias()';
            $sql = "CALL " . $sp . "()";
            // prepare for execution of the stored procedure
            $stmt = $this->pdo->prepare($sql);                  
            // execute the stored procedure
            $stmt->execute();
            $data=$stmt->fetchAll();            
            $stmt->closeCursor();
            return $data;
            
        } catch (PDOException $e) {         
            die("Error ocurrido:" . $e->getMessage());
        }
        return null;
    }

    public function incidencia_Nombres($sp) {
        try {               
            // calling stored procedure command
            //$sql = 'CALL SP_SelectNombresConDigitos()';
            $sql = "CALL " . $sp . "()";
            // prepare for execution of the stored procedure
            $stmt = $this->pdo->prepare($sql);                  
            // execute the stored procedure
            $stmt->execute();
            $data=$stmt->fetchAll();            
            $stmt->closeCursor();
            return $data;
            
        } catch (PDOException $e) {         
            die("Error ocurrido:" . $e->getMessage());
        }
        return null;
    }

// STORED PARA ACTUALIZAR LA INFORMACION DEL STAGE DATA HISTORICA

    public function update_stored_procedure_DH($sp) {
        try {               
            // calling stored procedure command
            //$sql = 'CALL SP_SelectNombresConDigitos()';
            $sql = "CALL " . $sp . "(@total)";
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


// FUNCION PARA MIGRAR LOS DATOS A PARA ACTUALIZAR LA INFORMACION DEL STAGE DATA HISTORICA

    public function cotejo(){
        $cadena=null;
        try{
            $array = array();
            $contPrinc = 1;
            $contSecund = 1;
            $sql = 'CALL SP_SelectCotejo()';
            // call the stored procedure
            $q = $this->pdo->prepare($sql);            
            $q->execute();
            //$q->setFetchMode(PDO::FETCH_ASSOC); 
            $lista = $q->fetchAll();
            $q->closeCursor();

            foreach($lista as $usuario){
                for ($i = 0; $i < 4; $i++) {
                    if ($i!=1) {
                        if ($usuario[$i]!=null) {
                            $cadena .= "+" . $usuario[$i] . "* ";
                        }                         
                    }

                }
                $sql = "SELECT ID_DH, nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, numero_documento, proyecto, MATCH(nombre_1, nombre_2, apellido_1, apellido_2,numero_documento) AGAINST('".$cadena."') as relevancia FROM DATA_HISTORICA WHERE MATCH(nombre_1, nombre_2, apellido_1, apellido_2, numero_documento) AGAINST('".$cadena."' IN BOOLEAN MODE)";
                // call the stored procedure
                    $q = $this->pdo->prepare($sql);            
                    $q->execute();
                //$q->setFetchMode(PDO::FETCH_ASSOC); 
                    $resultado = $q->fetchAll();
                    $q->closeCursor();

                    foreach($resultado as $usu){
                        $sql1 = 'CALL SP_InsertResultadoCotejo(:id_caso,:id_result,:nomb_1,:nomb_2,:ape_1,:ape_2,:tipo_doc,:numero_doc,:proyecto )';
                    // prepare for execution of the stored procedure
                        $stmt = $this->pdo->prepare($sql1);
                    // pass value to the command
                        $stmt->bindParam(':id_caso', $contPrinc, PDO::PARAM_INT);
                        $stmt->bindParam(':id_result', $contSecund, PDO::PARAM_INT);
                        $stmt->bindParam(':nomb_1', $usu[1], PDO::PARAM_STR);
                        $stmt->bindParam(':nomb_2', $usu[2], PDO::PARAM_STR);
                        $stmt->bindParam(':ape_1', $usu[3], PDO::PARAM_STR);
                        $stmt->bindParam(':ape_2', $usu[4], PDO::PARAM_STR);
                        $stmt->bindParam(':tipo_doc', $usu[5], PDO::PARAM_STR);
                        $stmt->bindParam(':numero_doc', $usu[6], PDO::PARAM_STR);
                        $stmt->bindParam(':proyecto', $usu[7], PDO::PARAM_STR);
                    // execute the stored procedure
                        $stmt->execute();
                        $stmt->closeCursor();                        
                        echo "Principal: ".$contPrinc. " Secundario: ".$contSecund."<br>";
                        $contSecund++;
                    }
                    echo $cadena . "<br>" . $sql. "<br>" . "Principal: " .$contPrinc."<br>";
                    $cadena = "";
                    $sql = "";
                    $contPrinc++;
                    $contSecund=1;
                }

        /*while ($r = $lista):
            $contSecund = 1;
                //$sql1 = 'CALL SP_SelectCotejo()';
                //$rs = $this->pdo->query($sql);
                //$rs->setFetchMode(PDO::FETCH_ASSOC);
            for ($i = 0; $i < 4; $i++) {
                if ($lista[$i]!=null) {
                    $cadena = "+" . $lista[$i] . "* ";
                } 
            }
            echo $cadena . "<br>";


            while ($r = $rs->fetch()):

                $sql1 = 'CALL SP_InsertResulatdoCotejo()';
                    // prepare for execution of the stored procedure
                $stmt = $pdo->prepare($sql1);
                    // pass value to the command
                $stmt->bindParam(':id_caso', $contPrinc, PDO::PARAM_INT);
                $stmt->bindParam(':id_result', $contSecund, PDO::PARAM_INT);
                $stmt->bindParam(':nomb_1', $r['customerName'], PDO::PARAM_STR);
                $stmt->bindParam(':nomb_2', $r['customerName'], PDO::PARAM_STR);
                $stmt->bindParam(':ape_1', $r['customerName'], PDO::PARAM_STR);
                $stmt->bindParam(':ape_2', $r['customerName'], PDO::PARAM_STR);
                $stmt->bindParam(':tipo_doc', $r['customerName'], PDO::PARAM_STR);
                $stmt->bindParam(':numero_doc', $r['customerName'], PDO::PARAM_STR);
                $stmt->bindParam(':proyecto', $r['customerName'], PDO::PARAM_STR);
                    // execute the stored procedure
                $stmt->execute();
                $stmt->closeCursor();

            endwhile;*/            
            /*endwhile;*/
        } catch (PDOException $e) {
            die("Error occurred:" . $e->getMessage());
        }
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