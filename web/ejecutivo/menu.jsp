<%-- 
    Document   : index
    Created on : 19/02/2017, 01:12:12 AM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%String context = request.getContextPath();%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Bancomer</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="<%=context%>/AdminLTE-master/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="<%=context%>/AdminLTE-master/dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="<%=context%>/AdminLTE-master/dist/css/skins/_all-skins.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="<%=context%>/AdminLTE-master/plugins/iCheck/flat/blue.css">
        <!-- Morris chart -->
        <link rel="stylesheet" href="<%=context%>/AdminLTE-master/plugins/morris/morris.css">
        <!-- jvectormap -->
        <link rel="stylesheet" href="<%=context%>/AdminLTE-master/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
        <!-- Date Picker -->
        <link rel="stylesheet" href="<%=context%>/AdminLTE-master/plugins/datepicker/datepicker3.css">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="<%=context%>/AdminLTE-master/plugins/daterangepicker/daterangepicker.css">
        <!-- bootstrap wysihtml5 - text editor -->
        <link rel="stylesheet" href="<%=context%>/AdminLTE-master/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="hold-transition skin-blue sidebar-mini">

        <header class="main-header">
            <!-- Logo -->
            <a href="index2.html" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>A</b>LT</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>BBVA</b> Bancomer</span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>

                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="<%=context%>/img/iconoUsuario.png" class="user-image" alt="User Image">
                                <span class="hidden-xs">Francisco Javier</span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="<%=context%>/img/iconoUsuario.png" class="img-circle" alt="User Image">

                                    <p>
                                        Francisco Javier 
                                        <small>Administrador</small>
                                    </p>
                                </li>

                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">Ver mi perfil</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="#" class="btn btn-default btn-flat">Cerrar sesión</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <!-- Control Sidebar Toggle Button -->
                    </ul>
                </div>
            </nav>
        </header>

        <aside class="main-sidebar">
            <section class="sidebar">
                <div class="user-panel">
                    <div class="pull-left image">
                        <!--AQUI VA LA IMAGEN DE ARRIBA DEL MEN-->
                        <img src="<%=context%>/img/iconoUsuario.png" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <center><p>Hola :)</p></center>
                        <p>Francisco Javier</p>
                    </div>
                </div>

                <!--COMIENZA EL MENÚ DE LA APLICACIÓN -->
                <ul class="sidebar-menu">
                    <li class="header">MENÚ PRINCIPAL</li>               

                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-laptop"></i>
                            <span>Ejecutivos</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#registrarEjecutivo" aria-controls="registrarEjecutivo" role="tab" data-toggle="tab"><i class="glyphicon glyphicon-edit"></i> Registrar ejecutivo </a></li>
                            <li><a href="#buscarEjecutivo" aria-controls="buscarEjecutivo" role="tab" data-toggle="tab"><i class="glyphicon glyphicon-search"></i> Buscar ejecutivo </a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="glyphicon glyphicon-user"></i> 
                            <span>Clientes</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href=""><i class="glyphicon glyphicon-edit"></i> Registrar cliente </a></li>
                            <li><a href=""><i class="glyphicon glyphicon-search"></i> Buscar cliente</a></li>
                        </ul>
                    </li>
                </ul>
            </section>
        </aside>

        <div class="content-wrapper">
            <!-- CONTENEDOR DE COLORES -->
            <section class="content">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3>150</h3>

                                <p>New Orders</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-green">
                            <div class="inner">
                                <h3>53<sup style="font-size: 20px">%</sup></h3>

                                <p>Bounce Rate</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-yellow">
                            <div class="inner">
                                <h3>44</h3>

                                <p>User Registrations</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-red">
                            <div class="inner">
                                <h3>65</h3>

                                <p>Unique Visitors</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>  
                </div>
                <!--inicia pestaña estadisticas-->
                <div id="no" role="tabpanel" class="tab-pane">
                    <h1>Ejecutivos</h1>
                    <p>Registrar un ejecutivo
                    <p>Reemplazar contenido</p>
                </div>
            </section>

            <!--termina pestaña estadisticas-->

            <!--TERMINAN PESTAÑAS DE DE FUNCIONES-->








            <!--FORMULARIOS DE MODIFICACIÓN Y REGISTRO-->
            <!--inicia formulario de modificación de cartera-->
            <div class="bd-example">
                <div class="modal fade" id="modificarCartera" tabindex="-1" role="dialog" aria-labelledby="titulo" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="titulo">Modificar Cartera</h4>
                            </div>
                            <div class="modal-body">

                                <form action="<%=context%>/modificarCartera" onsubmit="return validModifCartera()">
                                    <div class="form-group">
                                        <input type="hidden" name="cartera.idCartera" id="id"/>
                                        <input type="hidden" name="cartera.idTipoCartera" id="idTC"/>
                                        <label for="recipient-name" class="form-control-label">Nombre</label>
                                        <br>
                                        <input name="cartera.nombre" id="nuevoNombreCartera" type="text"  class="form-control" required=""/>
                                    </div>
                                    <div class="form-group" id="saldoContenedor">
                                        <label for="message-text" class="form-control-label">Saldo</label>
                                        <br>
                                        <input name="cartera.saldo"  id="nuevoSaldoCartera" type="tel"  class="form-control" required=""/>
                                    </div>
                                    <div class="form-group">
                                        <label id="nuevoCreditoMaxCarteraLabel" for="message-text" class="form-control-label">Crédito Máximo</label>
                                        <br>
                                        <input name="cartera.creditoMaximo" id="nuevoCreditoMaxCartera"
                                               type="number" step="any" maxlength="9" class="form-control" required=""/>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <input type="submit" class="btn btn-primary" value="Guardar Cambios"/>
                                    </div>
                                </form>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!--termina formulario modificacion de cartera-->


            <!--inicia formulario de creación de cartera-->
            <div class="bd-example">
                <div class="modal fade" id="registroCartera" tabindex="-1" role="dialog" aria-labelledby="titulo" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="titulo">Crear Cartera</h4>
                            </div>
                            <div class="modal-body">

                                <form action="<%=context%>/crearCartera" onsubmit="return validarSaldoCreditoCartera()">
                                    <div class="form-group">
                                        <label for="recipient-name" class="form-control-label">Nombre</label>
                                        <br>
                                        <input name="cartera.nombre" id="nuevoNombreCartera" type="text"  class="form-control" required=""/>
                                    </div>
                                    <div class="form-group">
                                        <label for="message-text" class="form-control-label">Saldo</label>
                                        <br>
                                        <input name="cartera.saldo"  id="saldoBox" type="number" step="any" min="0" class="form-control" required=""/>
                                    </div>
                                    <div class="form-group">
                                        <label for="message-text" class="form-control-label">Tipo de cartera</label>
                                        <br>
                                        <select onchange="crearCarteraFields()" id="lista" name="cartera.idTipoCartera" class="form-control">
                                            <s:iterator value="tiposCartera">
                                                <option value="<s:property value="idTipoCartera"/>"><s:property value="nombre"/></option>
                                            </s:iterator>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label id="creditLabel" for="message-text" class="form-control-label">Crédito Máximo</label>
                                        <br>
                                        <input id="creditBox" name="cartera.creditoMaximo"  type="number" step="any" min="0" class="form-control" required=""/>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <input type="submit" class="btn btn-primary" value="Registrar cartera"/>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--termina formulario-->


            <!--inicia formulario para modificar perfil del usuario-->
            <div class="bd-example">
                <div class="modal fade" id="modificarPerfil" tabindex="-1" role="dialog" aria-labelledby="titulo" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="titulo">Editar perfil</h4>
                                <h5>Toca un apartado para editar tus datos</h5>
                            </div>
                            <div class="modal-body">
                                <div class="panel-group" id="accordion" align="center">
                                    <form action="<%=context%>/modificarPerfil" onsubmit="return verifDatosPerfil()">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <input type="hidden" class="form-control" name="usuario.idUsuario" value="<s:property value="usuario.idUsuario"/>" required=""/>
                                                <h3>
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                                                        Nombre y apellidos
                                                    </a>
                                                </h3>
                                            </div>
                                            <div id="collapse1" class="panel-collapse collapse out">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="form-control-label">Nombre</label>
                                                        <br>
                                                        <input type="text" class="form-control" name="usuario.nombre" value="<s:property value="usuario.nombre"/>" required=""/>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-6 col-xs-6">
                                                                <label for="recipient-name" class="form-control-label">Primer apellido</label>
                                                                <br>
                                                                <input type="text" class="form-control" name="usuario.apellidoPaterno" value="<s:property value="usuario.apellidoPaterno"/>" required=""/>
                                                            </div>
                                                            <div class="col-md-6 col-sm-6 col-xs-6">
                                                                <label for="recipient-name" class="form-control-label">Segundo apellido</label>
                                                                <br>
                                                                <input type="text" class="form-control" name="usuario.apellidoMaterno" value="<s:property value="usuario.apellidoMaterno"/>" required=""/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3>
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                                                        Correo
                                                    </a>
                                                </h3>
                                            </div>
                                            <div id="collapse2" class="panel-collapse collapse out">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="form-control-label">Correo</label>
                                                        <br>
                                                        <input type="mail" class="form-control" name="usuario.correo" value="<s:property value="usuario.correo"/>" required=""/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3>
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                                                        Contraseña
                                                    </a>
                                                </h3>
                                            </div>
                                            <div id="collapse3" class="panel-collapse collapse out">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <label for="recipient-name" class="form-control-label">Contraseña actual</label>
                                                                <br>
                                                                <input id="currentPass" type="hidden" class="form-control" name="usuario.password" value="<s:property value="usuario.password"/>" required=""/>
                                                                <input id="currentPassVerif" type="password" class="form-control"/>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-6 col-xs-6">
                                                                <label for="recipient-name" class="form-control-label">Nueva contraseña</label>
                                                                <br>
                                                                <input id="newPass1" type="password" class="form-control"/>
                                                            </div>
                                                            <div class="col-md-6 col-sm-6 col-xs-6">
                                                                <label for="recipient-name" class="form-control-label">Confirmar contraseña</label>
                                                                <br>
                                                                <input id="newPass2" type="password" class="form-control"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                            <input type="submit" class="btn btn-primary" value="Guardar cambios"/>
                                        </div>
                                    </form>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!--termina formulario para modificar perfil del usuario-->

            <!--inicia formulario para modificar Imagen del usuario-->
            <div class="bd-example">
                <div class="modal fade" id="modificarImagen" tabindex="-1" role="dialog" aria-labelledby="titulo" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="titulo">Cambiar imagen</h4>

                            </div>
                            <div class="modal-body">
                                <form action="<%=context%>/cambiarImagenPerfil">
                                    <div class="container">
                                        <br><br><br>
                                        <select  id="sel" class="my-select form-control" onchange="ShowSelected();" name="imagen" >
                                            <s:iterator value="misImagenes" >
                                                <option  value="<s:property value="idImagen"/>"  data-img-src="IMG/Users/Login/<s:property value="idImagen"/>.jpg" ><s:property value="nombre"/></option>
                                            </s:iterator>
                                        </select>
                                        <script>
                                            //toma la imagen seleccionada en el select de cambio de foto de perfil
                                            $(".my-select").chosen({
                                                width: "25%",
                                                html_template: '<img style="border:1px solid black;padding:0px;margin-right:5px " class="{class_name}" src="{url}">'
                                            });
                                        </script>
                                        <div id="content">
                                            <br>
                                            <img  id="mg" class="img-circle" style="width: 200px; height: 200px;">
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <input type="submit" class="btn btn-primary" value="Cambiar avatar"/>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!--termina formulario para modificar perfil del usuario-->


            <!--inicia formulario abonar-->
            <div class="bd-example">
                <div class="modal fade" id="abonarCartera" tabindex="-1" role="dialog" aria-labelledby="titulo" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="titulo">Abonar a la cartera <label id="walletName"></label></h4>
                            </div>
                            <div class="modal-body">

                                <form action="<%=context%>/abonarCartera" onsubmit="return validAbonarCartera()">
                                    <div class="form-group">
                                        <input type="hidden" name="abono.idCartera" id="idCarAb"/>
                                        <input type="hidden" id="idTCCarAb"/>
                                        <input type="hidden" id="saldoCar"/>
                                        <input type="hidden" id="crediMax"/>
                                        <input type="hidden" name="abono.idUser" id="idUserAb"  value="<s:property value="#session.id"/>"/>
                                    </div>
                                    <div class="form-group" id="saldoContenedor">
                                        <label for="message-text" class="form-control-label">Cantidad</label>
                                        <br>
                                        <input name="abono.monto"  id="abonoCartera" type="number" min="1"  class="form-control" required=""/>
                                    </div>

                                    <div class="form-group">
                                        <label for="message-text" class="form-control-label">Descripción</label>
                                        <br>
                                        <textarea name="abono.descrip" id="descrip" class="form-control" required=""></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="message-text" class="form-control-label">Fecha</label>
                                        <br>
                                        <input type="date" name="abono.fecha" class="form-control date"/>
                                    </div>
                            </div>


                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                <input type="submit" class="btn btn-primary" value="Guardar Cambios"/>
                            </div>
                            </form>

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!--termina formulario abonar-->
    </div>
    <!-- /.tab-content -->
</div>
<!-- /.col -->
</div>











<!-- INFORMACIÓN DE PIE DE PÁGINA -->
<footer class="main-footer">
    <div class="pull-right hidden-xs">
        <b>Versión Beta</b> 1.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
</footer>


<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="<%=context%>/AdminLTE-master/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
                                    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="<%=context%>/AdminLTE-master/bootstrap/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="<%=context%>/AdminLTE-master/plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="<%=context%>/AdminLTE-master/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="<%=context%>/AdminLTE-master/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<%=context%>/AdminLTE-master/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="<%=context%>/AdminLTE-master/plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="<%=context%>/AdminLTE-master/plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="<%=context%>/AdminLTE-master/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="<%=context%>/AdminLTE-master/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="<%=context%>/AdminLTE-master/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<%=context%>/AdminLTE-master/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=context%>/AdminLTE-master/dist/js/app.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<%=context%>/AdminLTE-master/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=context%>/AdminLTE-master/dist/js/demo.js"></script>
</body>
</html>

