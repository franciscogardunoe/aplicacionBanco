<%-- 
    Document   : buscarEjecutivo
    Created on : 26/02/2017, 08:38:09 PM
    Author     : franc
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%String context = request.getContextPath();%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>BBVA Bancomer | SuperUsuario</title>
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
            <a href="<%=context%>/superusuario/menuSuperusuario.jsp" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>BBVA</b></span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>BBVA </b>Bancomer</span>
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
                                <span class="hidden-xs"><s:property value="UnEjecutivo.nombre"/></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="<%=context%>/img/iconoUsuario.png" class="img-circle" alt="User Image">

                                    <p>
                                        <s:property value="UnEjecutivo.nombre"/> 
                                        <small>Super administrador</small>
                                    </p>
                                </li>

                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-right">
                                        <a href="<%=context%>/cerrarSesion" class="btn btn-default btn-flat">Cerrar sesión</a>
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
                        Super administrador
                        <p><s:property value="UnEjecutivo.nombre"/></p>        
                    </div>
                </div>

                <!--COMIENZA EL MENÚ DE LA APLICACIÓN -->
                <ul class="sidebar-menu">
                    <li class="header"><center><strong>MENÚ PRINCIPAL</strong></center></li>               

                    <li class="treeview">
                        <a href="#">
                            <i class="glyphicon glyphicon-user"></i> 
                            <span>Ejecutivos</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="<%=context%>/superusuario/registrarEjecutivo.jsp"><i class="glyphicon glyphicon-edit"></i> Registrar ejecutivo </a></li>
                            <li><a href="<%=context%>/superusuario/buscarEjecutivo.jsp"><i class="glyphicon glyphicon-search"></i> Buscar ejecutivo</a></li>
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
                </div>

                <div class="col-md-12 ">
                    <div class="nav-tabs-custom">
                        <div class="tab-content">

                            <!--inicia pestaña carteras-->
                            <div id="mainContent" role="tabpanel" class="tab-pane active">
                                <h1>Buscar ejecutivo</h1>
                                <br>
                                <form name="form1" action="<%=context%>/buscarEjecutivo">
                                    <div class="form-group">
                                        <label for="nc">Buscar:</label>
                                        <input name="buscar" required="" type="text" class="form-control">
                                    </div>
                                    <div class="container">
                                        <input type="submit" value="Buscar" class="btn btn-success">
                                    </div>
                                </form>

                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Apellidos</th>
                                            <th>Fecha de nacimiento</th>
                                            <th>Correo electrónico</th>
                                            <th>Modificar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator value="misResultados" status="stet"> 
                                            <tr>
                                        <input name="idEjecutivo" type="hidden" value="<s:property value="idEjecutivo"/>"/>
                                        <td><s:property value="nombre"/></td>
                                        <td><s:property value="apellidos"/></td>
                                        <td><s:property value="fechaNacimiento"/></td>
                                        <td><s:property value="usuario.correoElectronico"/></td>
                                        <div class="container">
                                            <td> <a href="<%=context%>/consultarEjecutivoModificar?idEjecutivo=<s:property value="idEjecutivo"/>" class="btn btn-warning">Modificar</a></td>                                                      
                                        </div>  
                                        <div class="container">
                                            <td> <a href="<%=context%>/eliminarEjecutivo?idEjecutivo=<s:property value="idEjecutivo"/>" class="btn btn-danger">Eliminar</a></td>                                                      
                                        </div> 
                                        </tr>
                                    </s:iterator> 
                                    </tbody>
                                </table>           
                            </div>                          
                        </div>
                    </div>
                </div>
            </section>
        </div>


        <!-- INFORMACIÓN DE PIE DE PÁGINA -->
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Versión Beta</b> 1.0
            </div>
            <strong>Copyright &copy; 2017 BBVA Bancomer S.A. de C.V</a>.</strong> Todos los derechos reservados
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
