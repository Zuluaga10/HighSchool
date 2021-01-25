
  
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
                      <option value=""></option>
                      <option value="1">Tarjeta de Identidad</option>
                      <option value="2">Cedula de Ciudadania</option>
                      <option value="3">Cedula extranjera</option>
                    </select>
                    </div>
                     <div class="form-group">
                      <label for="textInput">Documento</label>
                      <input  type="number" required class="form-control" name="cedula">
                    </div>
                    <div class="form-group">
                      <label for="textInput">Nombre</label>
                      <input  type="text" required class="form-control" name="Nombres">
                    </div>
                     <div class="form-group">
                      <label for="textInput">Numero de Contacto</label>
                      <input type="number" class="form-control mask" data-inputmask="'mask':'+57 999 999 999'" name="Contactos" />
                    </div>
                     <div class="form-group">
                      <label for="textInput">Direcciòn</label>
                      <input type="text"  class="form-control" name="Direcciones">
                    </div>
                    <div class="form-group">
                    <label for="textInput">Estado</label>
                       <select class="form-control required" name="dd2">
                      <option value=""></option>
                      <option value="1">ACTIVO</option>
                      <option value="2">INACTIVO</option>
                    </select>
                    </div>
                    
                   <div class="form-actions">
                  <div>
                  <center>

                    <input class="btn btn-primary" type="submit" name="submit_guardar" value="REGISTRAR" />


                    </center>
                  </div>
                </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          
          <div class="row">
          <div class="col-md-1"></div>
           <div class="col-lg-10">
          <div class="widget">
            <div class="widget-header"> <i class="icon-hand-up"></i>
              <h3>CLIENTES</h3>
            </div>
            <div class="widget-content">
              <table class="table">
                <thead>
                  <tr>
                    <th>TIPO DOCUMENTO</th>
                    <th>DOCUMENTO</th>
                    <th>NOMBRE</th>
                    <th>CONTACTO</th>
                    <th>DIRECCION</th>
                    <th>ESTADO</th>
                    <th>OPCIONES</th>
                  </tr>
                </thead>
                <tbody>
                <?php foreach ($datos as $value): ?>
                  <tr>
                    <td><?=$value["tipoDocumento"]?></td>
                    <td><?=$value["documento"]?></td>
                    <td><?=$value["nombre"]?></td>
                    <td><?=$value["contacto"]?></td>
                    <td><?=$value["direccion"]?></td>
                    <td><?=$value["estado"]==1?"Activo":"Inactivo"?></td>
                    <td>
                      <a href="<?php echo URL; ?>cliente/edit/<?=$value["documento"] ?>">editar</a>

                      <?php if ($value["estado"]==1){ ?>
                      <a href="#" onclick="cambiarEstadoCliente(<?=$value["documento"]?>,0)">Inhabilitar</a>
                      <?php }
                      else{ ?>
                      <a href="#" onclick="cambiarEstadoCliente(<?=$value["documento"]?>,1)">Activar</a>
                      <?php } ?>
                    </td>
                  </tr>

                <?php endforeach; ?>
  
                </tbody>
              </table>
            </div>
          </div>
        </div>
        </div>