<?php  
/**
* 
*/
namespace Mini\Model;

use Mini\Core\Model;

class mdlCliente extends Model
{
	private $tipoDocumento;
	private $documento;
	private $nombre;
	private $contacto;
	private $direccion;
	private $estado;
	private $Tipo_Persona_idTipo_Persona;
	// public $db;

	public function __SET($attr, $value){
		$this->$attr=$value;
	}
	public function __GET($attr){
	return	$this->$attr;
	}
	
	function __construct()
	{
		try {
			parent::__construct();
		} catch (PDOException $e) {
			exit("error en la conexion.");
		}
		
	}

	public function listarCliente(){
		$sql = "CALL CM_ListarCliente()";
		$stm = $this->db->prepare($sql);
		$stm->execute();
		return $stm->fetchall();
	}
		public function listarClienteActivo(){
		$sql = "CALL CM_ListarClienteActivo()";
		$stm = $this->db->prepare($sql);
		$stm->execute();
		return $stm->fetchall();
	}


	public function modificarCliente(){
		$sql = "CALL CM_ModificarCliente(?,?,?,?,?,?)";
		$stm = $this->db->prepare($sql);
		$stm ->bindParam(1, $this->tipoDocumento);
		$stm ->bindParam(2, $this->documento);
		$stm ->bindParam(3, $this->nombre);
		$stm ->bindParam(4, $this->contacto);
		$stm ->bindParam(5, $this->direccion);
		$stm ->bindParam(6, $this->estado);
		$stm->execute();
	}

	public function registrarCliente(){
		
		$sql = "CALL CM_RegistrarCliente(?,?,?,?,?,?)";
		$stm = $this->db->prepare($sql);
		$stm ->bindParam(1, $this->tipoDocumento);
		$stm ->bindParam(2, $this->documento);		
		$stm ->bindParam(3, $this->nombre);	
		$stm ->bindParam(4, $this->contacto);
		$stm ->bindParam(5, $this->direccion);
		$stm ->bindParam(6, $this->estado);	
		$stm->execute();
	}

	public function cambiarEstadoCliente(){
		$sql = "CALL CM_CambiarEstadoCliente(?,?)";
		$stm = $this->db->prepare($sql);
		$stm->bindParam(1, $this->documento);
		$stm->bindParam(2, $this->estado);
		$stm->execute();
	}

	public function consultarCliente(){
		$sql = "SELECT documento,tipoDocumento,nombre,contacto,direccion,estado FROM persona WHERE documento = ?";
		$stm = $this->db->prepare($sql);
		$stm->bindParam(1, $this->documento);
		$stm->execute();
		return $stm->fetch();
	}

	

	// public function registrar($codigo,$nombre,$estado){

	// }


}