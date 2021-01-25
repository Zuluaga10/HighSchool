
  
  <div class="row">
    <div class="col-md-1"></div>
            <div class="col-md-10">
              <div class="widget">
                <div class="widget-heading">
                  <h3 class="widget-title">CLIENTE</h3>
                </div>
                <div class="widget-body">
                  <form method="POST" action="<?php echo URL; ?>Cliente/botonesCliente" class="form-horizontal">
                   
                    <div class="form-group">
                      <label for="textInput">Tipo de Documento</label>
                      <select class="form-control required" name="dd1">
                       <option value="<?= $datos['tipoDocumento']?>"><?= $datos['tipoDocumento']==1?"Tarjeta de Identidad":$datos['tipoDocumento']==2?"Cedula de Ciudadania":"Cedula extranjera"?> </option>
                      <option value="1">Tarjeta de Identidad</option>
                      <option value="2">Cedula de Ciudadania</option>
                      <option value="3">Cedula extranjera</option>
                    </select>
                    </div>
                     <div class="form-group">
                      <!-- <label for="textInput">Documento</label> -->
                      <input  type="hidden" type="number" required class="form-control" name="cedula">
                    </div>
                    <div class="form-group">
                      <label for="textInput">Nombre</label>
                      <input  type="text" required class="form-control" name="Nombres" value="<?= $datos['nombre']; ?>">
                    </div>
                     <div class="form-group">
                      <label for="textInput">Numero de Contacto</label>
                      <input type="number" class="form-control mask" data-inputmask="'mask':'+57 999 999 999'" name="Contactos" value="<?= $datos['contacto']; ?>" />
                    </div>
                     <div class="form-group">
                      <label for="textInput">Direcciòn</label>
                      <input type="text"  class="form-control" name="Direcciones" value="<?= $datos['direccion']; ?>">
                    </div>
                    <div class="form-group">
                    <label for="textInput">Estado</label>
                          <select class="form-control required" name="dd2" >
                      <option value="<?= $datos['estado']?>"><?= $datos['estado']==1?"ACTIVO":"INACTIVO"?></option>
                      <option value=" <?= $datos["estado"]?>"><?= $datos["estado"]==2?"ACTIVO":"INACTIVO"?></option>
                    </select>
                    </div>
                    
                   <div class="form-actions">
                  <div>
                  <center>
                     <button class="btn btn-primary" type="submit" name="submit_modificar">MODIFICAR</button>
                    
                    </center>
                  </div>
                
                </div>
                    </form>
                  </div>
                   </div>
                    </div>
         </div>
 



