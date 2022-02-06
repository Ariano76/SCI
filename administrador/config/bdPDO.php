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

    public function limpiarDataKobo($sp) {
        try {               
            // calling stored procedure command
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

    public function cotejo($idBusqueda) {
        $cadena=null;
        $tipo;
        try {
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

            foreach($lista as $usuario) {
                for ($i = 0; $i < 4; $i++) {
                    if ($i!=1) {
                        if ($usuario[$i]!=null) {
                            $cadena .= "+" . $usuario[$i] . "* ";
                        }
                    }
                }
                // GUARDANDO EL CASO DE BUSQUEDA
                $nulo = 0;
                $tipo = "Nombre";
                $sql1 = 'CALL SP_InsertResultadoCotejo(:id_busqueda, :id_caso, :id_result, :id_tipo, :nomb_1, :nomb_2, :ape_1, :ape_2, :tipo_doc, :numero_doc, :proyecto, :cod_familia )';
                // prepare for execution of the stored procedure
                $stmt = $this->pdo->prepare($sql1);
                // pass value to the command
                $stmt->bindParam(':id_busqueda', $idBusqueda, PDO::PARAM_INT);
                $stmt->bindParam(':id_caso', $contPrinc, PDO::PARAM_INT);
                $stmt->bindParam(':id_result', $nulo, PDO::PARAM_INT);
                $stmt->bindParam(':id_tipo', $nulo, PDO::PARAM_STR);
                $stmt->bindParam(':nomb_1', $usuario[0], PDO::PARAM_STR);
                $stmt->bindParam(':nomb_2', $usuario[1], PDO::PARAM_STR);
                $stmt->bindParam(':ape_1', $usuario[2], PDO::PARAM_STR);
                $stmt->bindParam(':ape_2', $usuario[3], PDO::PARAM_STR);
                $stmt->bindParam(':tipo_doc', $usuario[4], PDO::PARAM_STR);
                $stmt->bindParam(':numero_doc', $usuario[5], PDO::PARAM_STR);
                $stmt->bindParam(':proyecto', $nulo, PDO::PARAM_STR);
                $stmt->bindParam(':cod_familia', $usuario[7], PDO::PARAM_STR);
                // execute the stored procedure
                $stmt->execute();
                $stmt->closeCursor();
                // REALIZANDO LA BUSQUEDA FULLTEXT 
                $sql = "SELECT ID_DH, nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, numero_documento, proyecto, cod_familia, MATCH(beneficiario,numero_documento) AGAINST('".$cadena."') as relevancia FROM DATA_HISTORICA WHERE MATCH(beneficiario, numero_documento) AGAINST('" . $cadena . "' IN BOOLEAN MODE)";
                // call the stored procedure
                $q = $this->pdo->prepare($sql);            
                $q->execute();                
                $resultado = $q->fetchAll();
                $q->closeCursor();
                // GUARDANDO EL RESULTADO DE LA BUSQUEDA
                foreach($resultado as $usu) {
                    $sql1 = 'CALL SP_InsertResultadoCotejo(:id_busqueda, :id_caso, :id_result, :id_tipo, :nomb_1, :nomb_2, :ape_1, :ape_2, :tipo_doc, :numero_doc, :proyecto, :cod_familia )';
                    // prepare for execution of the stored procedure
                    $stmt = $this->pdo->prepare($sql1);
                    // pass value to the command
                    $stmt->bindParam(':id_busqueda', $idBusqueda, PDO::PARAM_INT);
                    $stmt->bindParam(':id_caso', $contPrinc, PDO::PARAM_INT);
                    $stmt->bindParam(':id_result', $contSecund, PDO::PARAM_INT);
                    $stmt->bindParam(':id_tipo', $tipo, PDO::PARAM_STR);
                    $stmt->bindParam(':nomb_1', $usu[1], PDO::PARAM_STR);
                    $stmt->bindParam(':nomb_2', $usu[2], PDO::PARAM_STR);
                    $stmt->bindParam(':ape_1', $usu[3], PDO::PARAM_STR);
                    $stmt->bindParam(':ape_2', $usu[4], PDO::PARAM_STR);
                    $stmt->bindParam(':tipo_doc', $usu[5], PDO::PARAM_STR);
                    $stmt->bindParam(':numero_doc', $usu[6], PDO::PARAM_STR);
                    $stmt->bindParam(':proyecto', $usu[7], PDO::PARAM_STR);
                    $stmt->bindParam(':cod_familia', $usu[8], PDO::PARAM_STR);
                    // execute the stored procedure
                    $stmt->execute();
                    $stmt->closeCursor();                        
                    $contSecund++;
                }
                $cadena = "";
                $sql = "";
                $contPrinc++;
                $contSecund=1;
            }

            // BUSQUEDA FULLTEXT UTILIZANDO EL NUMERO DE DOCUMENTO
            $contPrinc = 1;
            $contSecund = 1000;
            $tipo = "Numero";
            foreach($lista as $usuario){                    
                // RECUPERANDO EL NUMERO DE DOCUMENTO
                //$cadena .= "+" . $usuario[5] . "* ";
                $cadena = $usuario[5];
                // REALIZANDO LA BUSQUEDA FULLTEXT POR NUMERO DOCUMENTO
                $sql = "SELECT ID_DH, nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, numero_documento, proyecto, cod_familia, MATCH(beneficiario,numero_documento) AGAINST('".$cadena."') as relevancia FROM DATA_HISTORICA WHERE MATCH(beneficiario, numero_documento) AGAINST('" . $cadena . "' IN BOOLEAN MODE)";
                    // call the stored procedure
                $q = $this->pdo->prepare($sql);            
                $q->execute();
                    //$q->setFetchMode(PDO::FETCH_ASSOC); 
                $resultado = $q->fetchAll();
                $q->closeCursor();
                    // GUARDANDO EL RESULTADO DE LA BUSQUEDA
                foreach($resultado as $usu) {
                    $sql1 = 'CALL SP_InsertResultadoCotejo(:id_busqueda, :id_caso, :id_result, :id_tipo, :nomb_1, :nomb_2, :ape_1, :ape_2, :tipo_doc, :numero_doc, :proyecto, :cod_familia )';
                        // prepare for execution of the stored procedure
                    $stmt = $this->pdo->prepare($sql1);
                    // pass value to the command
                    $stmt->bindParam(':id_busqueda', $idBusqueda, PDO::PARAM_INT);
                    $stmt->bindParam(':id_caso', $contPrinc, PDO::PARAM_INT);
                    $stmt->bindParam(':id_result', $contSecund, PDO::PARAM_INT);
                    $stmt->bindParam(':id_tipo', $tipo, PDO::PARAM_STR);
                    $stmt->bindParam(':nomb_1', $usu[1], PDO::PARAM_STR);
                    $stmt->bindParam(':nomb_2', $usu[2], PDO::PARAM_STR);
                    $stmt->bindParam(':ape_1', $usu[3], PDO::PARAM_STR);
                    $stmt->bindParam(':ape_2', $usu[4], PDO::PARAM_STR);
                    $stmt->bindParam(':tipo_doc', $usu[5], PDO::PARAM_STR);
                    $stmt->bindParam(':numero_doc', $usu[6], PDO::PARAM_STR);
                    $stmt->bindParam(':proyecto', $usu[7], PDO::PARAM_STR);
                    $stmt->bindParam(':cod_familia', $usu[8], PDO::PARAM_STR);
                    // execute the stored procedure
                    $stmt->execute();
                    $stmt->closeCursor();
                    $contSecund++;
                }
                $cadena = "";
                $sql = "";
                $contPrinc++;
                $contSecund=1000;
            }
        } catch (PDOException $e) {
            die("Error occurred:" . $e->getMessage());
        }
    }

    public function resultado_cotejo($codigo) {
        try {               
            // calling stored procedure command
            //$sql = 'CALL SP_SelectNombresConDigitos()';
            $sql = "CALL SP_SelectResultadoCotejo(" . $codigo . ")";
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

    public function login($usuario, $pass) {
        try {               
            $sql = "CALL SP_Login_validar('".$usuario."','".$pass."',@total)";
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
        return $data;
    }

    public function select_usuarios() {
        try {               
            // calling stored procedure command
            //$sql = 'CALL SP_SelectNombresConDigitos()';
            $sql = "CALL SP_Usuarios_Select()";
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

    public function select_usuario($codigo) {
        try {               
            // calling stored procedure command
            $sql = "CALL SP_Usuario_Select(" . $codigo. ")";
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

    public function update_usuario($cod, $nombre, $correo, $idrol, $idestado) {
        try {               
            // calling stored procedure command
            $sql = "CALL SP_Usuario_Update(".$cod.",'".$nombre."','".$correo."',".$idrol.",".$idestado.",@total)";
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

    public function insert_usuario($nombre, $correo, $idrol, $idestado) {
        try {               
            // calling stored procedure command
            $sql = "CALL SP_Usuario_Insert('".$nombre."','".$correo."','123456',".$idrol.",".$idestado.",@total)";
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

    public function delete_usuario($id) {
        try {               
            // calling stored procedure command
            $sql = "CALL SP_Usuario_Delete(".$id.",@total)";
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
            return true;
        } catch (PDOException $e) {         
            die("Error ocurrido:" . $e->getMessage());
        }
            return null;
    }

    public function update_password($id,$clave) {
        try {               
            // calling stored procedure command
            $sql = "CALL SP_Usuario_Update_Password(".$id.",".$clave.",@total)";
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

    public function migrar_data_historica() {
        try {               
            // calling stored procedure command
            $sql = "CALL SP_Migrar_Data_Historica(@total)";
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

    public function select_beneficiarios() {
        try {               
            // calling stored procedure command
            //$sql = 'CALL SP_SelectNombresConDigitos()';
            $sql = "CALL SP_Select_stage_00()";
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

    public function Insert_beneficiario($d_01, $d_02, $d_03, $d_04, $d_05, $d_06, $d_07, $d_08, $d_09, $d_10, $d_11, $d_12, $d_13, $d_14, $d_15, $d_16, $d_17, $d_18, $d_19, $d_20, $d_21, $d_22) {
        try {
            $sql = "CALL SP_Insert_beneficiario('".$d_01."','".$d_02."','".$d_03."','".$d_04."','".$d_05."','".$d_06."','".$d_07."','".$d_08."','".$d_09."','".$d_10."','".$d_11."','".$d_12."','".$d_13."','".$d_14."','".$d_15."','".$d_16."','".$d_17."','".$d_18."','".$d_19."','".$d_20."','".$d_21."','".$d_22."',@total)";
            //$sql = "CALL SP_Insert_beneficiario(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $row=0;
            $stmt = $this->pdo->prepare($sql);
            /*$stmt->bindParam(1, $d_01, PDO::PARAM_STR);
            $stmt->bindParam(2, $d_02, PDO::PARAM_STR);
            $stmt->bindParam(3, $d_03, PDO::PARAM_INT);
            $stmt->bindParam(4, $d_04, PDO::PARAM_STR);
            $stmt->bindParam(5, $d_05, PDO::PARAM_STR);
            $stmt->bindParam(6, $d_06, PDO::PARAM_STR);
            $stmt->bindParam(7, $d_07, PDO::PARAM_STR);
            $stmt->bindParam(8, $d_08, PDO::PARAM_STR);
            $stmt->bindParam(9, $d_09, PDO::PARAM_STR);
            $stmt->bindParam(10, $d_10, PDO::PARAM_STR);
            $stmt->bindParam(11, $d_11, PDO::PARAM_STR);
            $stmt->bindParam(12, $d_12, PDO::PARAM_STR);
            $stmt->bindParam(13, $d_13, PDO::PARAM_STR);
            $stmt->bindParam(14, $d_14, PDO::PARAM_STR);
            $stmt->bindParam(15, $d_15, PDO::PARAM_STR);
            $stmt->bindParam(16, $d_16, PDO::PARAM_INT);
            $stmt->bindParam(17, $d_17, PDO::PARAM_STR);
            $stmt->bindParam(18, $d_18, PDO::PARAM_STR);
            $stmt->bindParam(19, $d_19, PDO::PARAM_STR);
            $stmt->bindParam(20, $d_20, PDO::PARAM_STR);            
            $stmt->bindParam(21, $d_21, PDO::PARAM_STR);  
            $stmt->bindParam(22, $d_22, PDO::PARAM_STR);  
            $stmt->bindParam(23, $row, PDO::PARAM_INT|PDO::PARAM_INPUT_OUTPUT);
        */
            $stmt->execute();
            $row = $this->pdo->query("SELECT @total AS resultado")->fetch(PDO::FETCH_ASSOC);
            $stmt->closeCursor();
            return $row["resultado"];
        } catch (PDOException $e) {
            die("Error ocurrido:" . $e->getMessage());
        }
        //echo 'Error <br>';
        return null;
    }

    public function Insert_encuesta($d_01, $d_02, $d_03, $d_04, $d_05, $d_06, $d_07) {
        try {
            $sql = "CALL SP_Insert_encuesta(@total,'".$d_01."','".$d_02."','".$d_03."','".$d_04."','".$d_05."','".$d_06."','".$d_07."')";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            $stmt->closeCursor();
            return true;
        } catch (PDOException $e) {
            die("Error ocurrido:" . $e->getMessage());
        }
        //echo 'Error <br>';
        return null;
    }

    public function Insert_comunicacion($d_01, $d_02, $d_03, $d_04, $d_05, $d_06, $d_07, $d_08, $d_09, $d_10, $d_11, $d_12, $d_13, $d_14, $d_15) {
        try {
            $sql = "CALL SP_Insert_comunicacion(@total,'".$d_01."','".$d_02."','".$d_03."','".$d_04."','".$d_05."','".$d_06."','".$d_07."','".$d_08."','".$d_09."','".$d_10."','".$d_11."','".$d_12."','".$d_13."','".$d_14."','".$d_15."')";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            $stmt->closeCursor();
            return true;
        } catch (PDOException $e) {
            die("Error ocurrido:" . $e->getMessage());
        }
        //echo 'Error <br>';
        return null;
    }

    public function Insert_nutricion($d_01, $d_02, $d_03, $d_04, $d_05, $d_06, $d_07, $d_08, $d_09) {
        try {
            $sql = "CALL SP_Insert_nutricion(@total,'".$d_01."','".$d_02."','".$d_03."','".$d_04."','".$d_05."','".$d_06."','".$d_07."','".$d_08."','".$d_09."')";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            $stmt->closeCursor();
            return true;
        } catch (PDOException $e) {
            die("Error ocurrido:" . $e->getMessage());
        }
        //echo 'Error <br>';
        return null;
    }    

    public function Insert_educacion($d_01, $d_02, $d_03, $d_04, $d_05, $d_06, $d_07, $d_08, $d_09, $d_10, $d_11, $d_12, $d_13) {
        try {
            $sql = "CALL SP_Insert_educacion(@total,'".$d_01."','".$d_02."','".$d_03."','".$d_04."','".$d_05."','".$d_06."','".$d_07."','".$d_08."','".$d_09."','".$d_10."','".$d_11."','".$d_12."',".$d_13.")";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            $stmt->closeCursor();
            return true;
        } catch (PDOException $e) {
            die("Error ocurrido:" . $e->getMessage());
        }
        //echo 'Error <br>';
        return null;
    }    

    public function Insert_salud($d_01, $d_02, $d_03, $d_04, $d_05) {
        try {
            $sql = "CALL SP_Insert_salud(@total,'".$d_01."','".$d_02."','".$d_03."','".$d_04."',".$d_05.")";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            $stmt->closeCursor();
            return true;
        } catch (PDOException $e) {
            die("Error ocurrido:" . $e->getMessage());
        }
        //echo 'Error <br>';
        return null;
    }    

    public function Insert_derivacion_sectores($d_01, $d_02, $d_03, $d_04, $d_05, $d_06, $d_07) {
        try {
            $sql = "CALL SP_Insert_derivacion_sectores(@total,'".$d_01."','".$d_02."','".$d_03."','".$d_04."','".$d_05."','".$d_06."',".$d_07.")";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            $stmt->closeCursor();
            return true;
        } catch (PDOException $e) {
            die("Error ocurrido:" . $e->getMessage());
        }
        //echo 'Error <br>';
        return null;
    }    

    public function Insert_integrantes($d_01, $d_02, $d_03, $d_04, $d_05, $d_06, $d_07, $d_08, $d_09, $d_10, $d_11, $d_12, $d_13, $d_14, $d_15, $d_16, $d_17, $d_18, $d_19, $d_20, $d_21, $d_22, $d_23, $d_24, $d_25, $d_26, $d_27, $d_28, $d_29, $d_30, $d_31, $d_32, $d_33, $d_34, $d_35, $d_36, $d_37, $d_38, $d_39, $d_40, $d_41, $d_42, $d_43, $d_44, $d_45, $d_46, $d_47, $d_48, $d_49, $d_50, $d_51, $d_52, $d_53, $d_54, $d_55, $d_56, $d_57, $d_58, $d_59, $d_60, $d_61, $d_62, $d_63, $d_64, $d_65, $d_66, $d_67, $d_68, $d_69, $d_70, $d_71) {
        try {
            $sql = "CALL SP_Insert_integrantes(@total,'"
            .$d_01."','".$d_02."','".$d_03."','".$d_04."','".$d_05."','".$d_06."','".$d_07.",'".$d_08."','".$d_09."','".$d_10."','"
            .$d_11."','".$d_12."','".$d_13."','".$d_14."','".$d_15."','".$d_16."','".$d_17.",'".$d_18."','".$d_19."','".$d_20."','"
            .$d_21."','".$d_22."','".$d_23."','".$d_24."','".$d_25."','".$d_26."','".$d_27.",'".$d_28."','".$d_29."','".$d_30."','"
            .$d_31."','".$d_32."','".$d_33."','".$d_34."','".$d_35."','".$d_36."','".$d_37.",'".$d_38."','".$d_39."','".$d_40."','"
            .$d_41."','".$d_42."','".$d_43."','".$d_44."','".$d_45."','".$d_46."','".$d_47.",'".$d_48."','".$d_49."','".$d_50."','"
            .$d_51."','".$d_52."','".$d_53."','".$d_54."','".$d_55."','".$d_56."','".$d_57.",'".$d_58."','".$d_59."','".$d_60."','"
            .$d_61."','".$d_62."','".$d_63."','".$d_64."','".$d_65."','".$d_66."','".$d_67.",'".$d_68."','".$d_69."','".$d_70."',"
            .$d_71.")";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();
            $stmt->closeCursor();
            return true;
        } catch (PDOException $e) {            
            die("Error ocurrido:" . $e->getMessage());
        }
        //echo 'Error <br>';
        return null;
    }    






    public function validar_fecha_espanol($fecha){
        $valores = explode('-', $fecha);
        if(count($valores) == 3 && checkdate($valores[1], $valores[2], $valores[0])){
            return true;
        }
            return false;
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