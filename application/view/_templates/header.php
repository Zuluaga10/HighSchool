<!DOCTYPE html>
<html lang="en">
  
<!-- Mirrored from lethemes.net/umega/1.6/first-layout/forms-layouts.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 23 Nov 2017 14:08:48 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cleaning Master</title>
    <!-- PACE-->
    <link rel="stylesheet" type="text/css" href="<?php echo URL; ?>plugins/PACE/themes/blue/pace-theme-flash.css">
    <script type="text/javascript" src="<?php echo URL; ?>plugins/PACE/pace.min.js"></script>
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" type="text/css" href="<?php echo URL; ?>plugins/bootstrap/dist/css/bootstrap.min.css">
    <!-- Fonts-->
    <link rel="stylesheet" type="text/css" href="<?php echo URL; ?>plugins/themify-icons/themify-icons.css">
    <!-- Malihu Scrollbar-->
    <link rel="stylesheet" type="text/css" href="<?php echo URL; ?>plugins/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css">
    <!-- Animo.js-->
    <link rel="stylesheet" type="text/css" href="<?php echo URL; ?>plugins/animo.js/animate-animo.min.css">
    <!-- Flag Icons-->
    <link rel="stylesheet" type="text/css" href="<?php echo URL; ?>plugins/flag-icon-css/css/flag-icon.min.css">
    <!-- Bootstrap Progressbar-->
    <link rel="stylesheet" type="text/css" href="<?php echo URL; ?>plugins/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css">
    <!-- Primary Style-->
    <link rel="stylesheet" type="text/css" href="<?php echo URL; ?>build/css/first-layout.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
    <!-- WARNING: Respond.js doesn't work if you view the page via file://--> 
    <!--[if lt IE 9]>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script type="text/javascript" src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body data-sidebar-color="sidebar-light" class="sidebar-light">
    <?php
session_start();
$correo = $_SESSION["Correo"];

      if ($_SESSION["Correo"] != null) {


        if ($_SESSION["Rol"] != 1) {
          header('location: ' . URL . 'Login');
        }

        }else {
          header('location: ' . URL . 'Login');
        }


 ?>
    <!-- Header start-->
    <header>
      <div class="search-bar closed">
        <form>
          <div class="input-group input-group-lg">
            <input type="text" placeholder="Search for..." class="form-control"><span class="input-group-btn">
              <button type="button" class="btn btn-default search-bar-toggle"><i class="ti-close"></i></button></span>
          </div>
        </form>
      </div><a href="<?php echo URL; ?>ordenServicio" class="brand pull-left"><img src="<?php echo URL; ?>build/images/logo/logo.png" width="170" height="70"></a><a href="javascript:;" role="button" class="hamburger-menu pull-left"><span></span></a>
      <form class="search-form pull-left hidden-xs">
        <div class="form-group has-feedback mb-0">
          <input type="text" aria-describedby="inputSearchFor" placeholder="Search for..." style="width: 200px" class="form-control rounded"><span aria-hidden="true" class="ti-search form-control-feedback"></span><span id="inputSearchFor" class="sr-only">(default)</span>
        </div>
      </form>
      <ul class="notification-bar list-inline pull-right">
        <li class="visible-xs"><a href="javascript:;" role="button" class="header-icon search-bar-toggle"><i class="ti-search"></i></a></li>
        <li class="visible-lg"><a href="javascript:;" role="button" class="header-icon sidebar-control"><i class="ti-pin-alt"></i></a></li>
        <li class="dropdown"><a id="dropdownMenu1" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle bubble header-icon"><i class="ti-world"></i><span class="badge bg-danger">6</span></a>
          <div aria-labelledby="dropdownMenu1" class="dropdown-menu dropdown-menu-right dm-medium fs-12 animated fadeInDown">
            <h5 class="dropdown-header">You have 6 notifications</h5>
            <ul data-mcs-theme="minimal-dark" class="media-list mCustomScrollbar">
              <li class="media"><a href="javascript:;">
                  <div class="media-left avatar"><img src="<?php echo URL; ?>build/images/users/17.jpg" alt="" class="media-object img-circle"><span class="status bg-warning"></span></div>
                  <div class="media-body">
                    <h6 class="media-heading">William Carlson</h6>
                    <p class="text-muted mb-0">Commented on your post</p>
                  </div>
                  <div class="media-right text-nowrap">
                    <time datetime="2015-12-10T20:27:48+07:00" class="fs-11">5 mins</time>
                  </div></a></li>
              <li class="media"><a href="javascript:;">
                  <div class="media-left avatar"><img src="<?php echo URL; ?>build/images/users/19.jpg" alt="" class="media-object img-circle"><span class="status bg-danger"></span></div>
                  <div class="media-body">
                    <h6 class="media-heading">Barbara Ortega</h6>
                    <p class="text-muted mb-0">Sent you a new email</p>
                  </div>
                  <div class="media-right text-nowrap">
                    <time datetime="2015-12-10T20:42:40+07:00" class="fs-11">8 mins</time>
                  </div></a></li>
              <li class="media"><a href="javascript:;">
                  <div class="media-left avatar"><img src="<?php echo URL; ?>build/images/users/02.jpg" alt="" class="media-object img-circle"><span class="status bg-success"></span></div>
                  <div class="media-body">
                    <h6 class="media-heading">Mark Barnett</h6>
                    <p class="text-muted mb-0">Sent you a new message</p>
                  </div>
                  <div class="media-right text-nowrap">
                    <time datetime="2015-12-10T20:50:48+07:00" class="fs-11">9 mins</time>
                  </div></a></li>
              <li class="media"><a href="javascript:;">
                  <div class="media-left avatar"><img src="<?php echo URL; ?>build/images/users/11.jpg" alt="" class="media-object img-circle"><span class="status bg-danger"></span></div>
                  <div class="media-body">
                    <h6 class="media-heading">Alexander Gilbert</h6>
                    <p class="text-muted mb-0">Sent you a new email</p>
                  </div>
                  <div class="media-right text-nowrap">
                    <time datetime="2015-12-10T20:42:40+07:00" class="fs-11">15 mins</time>
                  </div></a></li>
              <li class="media"><a href="javascript:;">
                  <div class="media-left avatar"><img src="<?php echo URL; ?>build/images/users/12.jpg" alt="" class="media-object img-circle"><span class="status bg-success"></span></div>
                  <div class="media-body">
                    <h6 class="media-heading">Amanda Collins</h6>
                    <p class="text-muted mb-0">You have 8 unread messages</p>
                  </div>
                  <div class="media-right text-nowrap">
                    <time datetime="2015-12-10T20:35:35+07:00" class="fs-11">22 mins</time>
                  </div></a></li>
              <li class="media"><a href="javascript:;">
                  <div class="media-left avatar"><img src="<?php echo URL; ?>build/images/users/13.jpg" alt="" class="media-object img-circle"><span class="status bg-warning"></span></div>
                  <div class="media-body">
                    <h6 class="media-heading">Christian Lane</h6>
                    <p class="text-muted mb-0">Commented on your post</p>
                  </div>
                  <div class="media-right text-nowrap">
                    <time datetime="2015-12-10T20:27:48+07:00" class="fs-11">30 mins</time>
                  </div></a></li>
            </ul>
            <div class="dropdown-footer text-center p-10"><a href="javascript:;" class="fw-500 text-muted">See all notifications</a></div>
          </div>
        </li>
        <li class="dropdown visible-lg visible-md"><a id="dropdownMenu2" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle header-icon lh-1 pt-15 pb-15">
            <div class="media mt-0">
              <div class="media-left avatar"><img src="<?php echo URL; ?>build/images/users/04.jpg" alt="" class="media-object img-circle"><span class="status bg-success"></span></div>
              <div class="media-right media-middle pl-0">
                <p class="fs-12 mb-0">Hi, Matthew</p>
              </div>
            </div></a>
          <ul aria-labelledby="dropdownMenu2" class="dropdown-menu fs-12 animated fadeInDown">
            <li><a href="<?php echo URL; ?>Perfil"><i class="ti-user mr-5"></i> Mi Perfil</a></li>
            <li><a href="<?php echo URL; ?>Perfil"><i class="ti-settings mr-5"></i> Configuraciones</a></li>
            <li><a href="<?php echo URL; ?>Login/salir"><i class="ti-power-off mr-5"></i> Logout</a></li>
          </ul>
        </li>
      
      </ul>
    </header>
    <!-- Header end-->
    <div class="main-container">
      <!-- Main Sidebar start-->
      <aside data-mcs-theme="minimal-dark" style="background-image: url(<?php echo URL; ?>build/images/backgrounds/11.jpg)" class="main-sidebar mCustomScrollbar">
        <div class="user">
          <div id="esp-user-profile" data-percent="65" style="height: 130px; width: 130px; line-height: 100px; padding: 15px;" class="easy-pie-chart"><img src="<?php echo URL; ?>build/images/users/04.jpg" alt="" class="avatar img-circle"><span class="status bg-success"></span></div>
          <h4 class="fs-16 text-muted mt-15 mb-5 fw-300">Matthew Gonzalez</h4>
          <p class="mb-0 text-muted">Designer</p>
        </div>
        <ul class="list-unstyled navigation mb-0">
          <li class="sidebar-category">Main</li>
          
          <li><a href="<?php echo URL; ?>ordenServicio"> <i class="icon-file-text-alt"></i> Orden de servicio </a> </li>
            <li> <a href="<?php echo URL; ?>tipoVehiculo"> <i class="icon-ambulance"></i> Tipo de vehiculo </a> </li>

        <li> <a href="<?php echo URL; ?>servicio"> <i class="icon-tint"></i> Servicio </a> </li>

        <li> <a href="<?php echo URL; ?>cliente"> <i class="icon-user"></i> Cliente </a> </li>
        
         <li> <a href="<?php echo URL; ?>empleado"> <i class="icon-group"></i> Empleado </a> </li>
          
          <li> <a href="<?php echo URL; ?>producto"> <i class="icon-archive"></i> Producto </a> 
          </li>
          <li> <a href="<?php echo URL; ?>unidadMedida"> <i class="icon-stackexchange"></i> Unidad de medida </a> </li>
           <li> <a href="<?php echo URL; ?>entradaYsalida"> <i class="icon-stackexchange"></i> Entrada y Salida </a> </li> 
          <li> <a href="<?php echo URL; ?>kit"> <i class="icon-stackexchange"></i> Kit </a> </li>
           <BR><BR><BR><BR><BR><BR>

        
 
        
        </ul>
        
      </aside>
    </div>
      <!-- Main Sidebar end-->
      <div class="page-container">

        <div class="page-content container-fluid">
