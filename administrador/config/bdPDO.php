<?php

class TransactionDemo {

const $db_host="localhost"; //localhost server 
const $db_name="bd_bha_sci"; //database name
const $db_user="root"; //database username
const $db_password=""; //database password 

  /**
     * Open the database connection
     */
  public function __construct() {
        // open database connection
  	$conStr = sprintf("mysql:host=%s;dbname=%s", self::db_host, self::db_name);
  	try {
  		$this->pdo = new PDO($conStr, self::db_user, self::db_password);
  	} catch (PDOException $e) {
  		die($e->getMessage());
  	}
  }

	/**
     * PDO instance
     * @var PDO 
     */
	private $pdo = null;


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


	public function transformacionDatos() {
        // close the database connection
		try {
    		$this->pdo->beginTransaction();

            // get available amount of the transferer account
    		$sql = 'call SP_UpdateDobleEspacioBlanco()';
    		 // call the stored procedure
            $q = $pdo->query($sql);
            $q->setFetchMode(PDO::FETCH_ASSOC);

   		            
           
            // commit the transaction
    		$this->pdo->commit();

    		echo 'La operación se realizo satisfactoriamente';

    		return true;
    	} catch (PDOException $e) {
    		$this->pdo->rollBack();
    		die($e->getMessage());
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