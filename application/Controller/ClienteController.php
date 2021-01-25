<?php  
namespace Mini\Controller;

use Mini\Model\mdlCliente;

class ClienteController
{
	  function __construct(){
        $this ->mdlCliente =  new mdlCliente();
    }
public function index()
    {
        $datos= $this->mdlCliente->listarCliente();

        require APP . 'view/_templates/header.php';
        require APP . 'view/cliente/Cliente.php';
        require APP . 'view/_templates/footer.php';
    }

    public function botonesCliente(){

        if (isset($_POST["submit_guardar"])) {
        	$this ->mdlCliente->__SET("tipoDocumento",$_POST['dd1']);
            $this ->mdlCliente->__SET("documento",$_POST['cedula']);
            $this ->mdlCliente->__SET("nombre",$_POST['Nombres']);
            $this ->mdlCliente->__SET("contacto",$_POST['Contactos']);
            $this ->mdlCliente->__SET("direccion",$_POST['Direcciones']);
            $this ->mdlCliente->__SET("estado",$_POST['dd2']);
            $e = $this ->mdlCliente->registrarCliente();
            header("location:".URL."cliente/Cliente");

        }
        if (isset($_POST["submit_modificar"])) {
            $this ->mdlCliente->__SET("tipoDocumento",$_POST['dd1']);
            $this ->mdlCliente->__SET("documento",$_POST['cedula']);
            $this ->mdlCliente->__SET("nombre",$_POST['Nombres']);
            $this ->mdlCliente->__SET("contacto",$_POST['Contactos']);
            $this ->mdlCliente->__SET("direccion",$_POST['Direcciones']);
            $this ->mdlCliente->__SET("estado",$_POST['dd2']);
            $e = $this ->mdlCliente->modificarCliente();
            header("location:".URL."cliente/Cliente");
        }
    }
       public function cambiarEstado(){
        $this ->mdlCliente->__SET("documento",$_POST["documento"]);
        $this ->mdlCliente->__SET("estado",$_POST["estado"]);
        $datos= $this->mdlCliente->cambiarEstadoCliente();
        if ($datos) {
           echo json_encode(["b"=>1]);
        }else{
            echo json_encode(["b"=>0]);
        }
        // header("location:".URL."UnidadMedida/unidadMedida");
    }
    public function edit($codi){

         $this ->mdlCliente->__SET("documento",$codi);
         $datos= $this ->mdlCliente->consultarCliente();

        require APP . 'view/_templates/header.php';
        require APP . 'view/Cliente/edit.php';
        require APP . 'view/_templates/footer.php';

    }

}

