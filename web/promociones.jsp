<%@page import="DataTypes.DtPromocion"%>
<%@page import="DataTypes.DtInfoReserva"%>
<%@page import="DataTypes.DtCliente"%>
<%@page import="Usuario.infoSesion"%>
<!DOCTYPE html>
<%@page import="DataTypes.DtInfoServicio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="Logica.ISistema"%>
<%@page import="Logica.Fabrica"%>

<%
    ISistema IS = Fabrica.getInstance().getISistema();
    List<DtInfoServicio> serObtenidos = IS.listarServicios();
    HttpSession misession = (HttpSession) request.getSession();
    infoSesion datos = (infoSesion) misession.getAttribute("datos");
    DtCliente cli = null;
    ArrayList lista = null;
    int reservaUsu = 0;
%>

<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>help4travel</title>
    <link rel="shortcut icon" href="img/logo.ico">
    <link rel="stylesheet" href="css/fontello.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/estilos.css">
    <style class="cp-pen-styles">
            .recuadro{display:block;font-size:.8em;margin:0px 0 10px;padding:5px 0 5px 11px;width:200px}
            .confirmacion{background:#C6FFD5;border:1px solid green;}
            .negacion{background:#ffcccc;border:1px solid red}
        </style>
        <script type="text/javascript" src="js/botonSubmit.js"></script>
        <script type="text/javascript" src="js/camposSesion.js"></script>
</head>

<body background="img/fondo.jpg">
    <header>
        <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navegacion-Lm">
                        <span class="sr-only"> Desplegar / Ocultar menu</span>
                        <samp class="icon-bar"></samp>
                        <samp class="icon-bar"></samp>
                        <samp class="icon-bar"></samp>
                    </button>
                    <a href="index.jsp" class="navbar-brand">Help 4Travel</a><img src="img/logo.ico">
                </div>
                <! -- Inicia Menu -->
                <div class="collapse navbar-collapse" id="navegacion-Lm">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Inicio</a></li>
                        <li class="active"><a href="promociones.jsp">Promociones</a></li>
                        <li><a href="servicios.jsp">Servicios</a></li>
                    </ul>
                    <form action="" class="navbar-form navbar-right" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Servicios o Promociones">
                        </div>
                        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
                    </form>
                </div>
            </div>
        </nav>
    </header>
    <% if (datos == null) {

        %>
        <section class="jumbotron">
            <div class="container"> 
                <a href="#" data-toggle="modal" data-target="#ModalReg" role="button"><span class="icon-user-add"> Registrarte </span></a>
                <section class="jumbotron2">
                    <div class="modal fade" id="ModalReg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Registro</h4>
                                </div>
                                <form action="Registro" method="GET" name="Fregistro" onsubmit="return datosCompletos()">
                                    <div class="modal-body"> 
                                        <input type="text" class="form-control" placeholder="Nombre de Usuario" name="nick" id="nick">
                                        <a class="divider">----------------------------------------------------</a>
                                        <input type="password" class="form-control" placeholder="Contraseña" name="pass1" id="password">
                                        <a class="divider">----------------------------------------------------</a>
                                        <input type="password" class="form-control" placeholder="Repita Contraseña" name="pass2" id="password2"</a>
                                        <!--                                        <a class="divider">----------------------------------------------------</a>
                                                                                <input type="button" onclick="validar_clave()" value="Comprobar" class="form-control">
                                        -->     
                                        <a class="divider">----------------------------------------------------</a>
                                        <input type="text" class="form-control" placeholder="Nombre" name="nombre" id="nombre">
                                        <a class="divider">----------------------------------------------------</a>
                                        <input type="text" class="form-control" placeholder="Apellido" name="apellido" id="apellido">                            
                                        <a class="divider">----------------------------------------------------</a>
                                        <input type="text" class="form-control" placeholder="Email" name="email" id="email">
                                        <a class="divider">----------------------------------------------------</a>   
                                        <input type="date" class="form-control" name="fecha" name="fecha" id="fecha">
                                        <a class="divider">----------------------------------------------------</a>
                                        <br/>
                                        <label class="form-control" for="archivo">Imagen</label>
                                        <input id="archivo" name="uploadedfile" type="file" class="form-control" />
                                        <script src="//assets.codepen.io/assets/common/stopExecutionOnTimeout-53beeb1a007ec32040abaf4c9385ebfc.js"></script>
                                        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
                                        <script type="text/javascript" src="js/Comprobacion.js"></script>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                        <button name="aceptar" type="submit" class="btn btn-primary">Aceptar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>                
                </section>
                <a href="#" data-toggle="modal" data-target="#ModalIni" role="button"><span class="icon-user"> Iniciar Sesión </span></a>

                <section class="jumbotron2">
                    <div class="modal fade" id="ModalIni" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Inicio de Sesión</h4>
                                </div>
                                <form action="InicioSesion" method="POST" onsubmit="return inicio()">
                                    <div class="modal-body">
                                        <input type="text" class="form-control" placeholder="Nick" name="usu" id="usu">
                                        <a class="divider">----------------------------------------------------</a>
                                        <input type="password" class="form-control" placeholder="Contraseña" name="cont" id="cont">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                        <button type="submit" class="btn btn-primary">Iniciar Sesión</button> </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>                    
                </section>
                <h1><img src="img/H4Tlogo.png">H4T</h1>
                <p>Oferta de hoteles, Paquetes de viajes y mas...</p>
            </div>
        </section>

        <%} else {
        
                cli = IS.verInfoCliente(datos.getNickname());    
if (!cli.getReservas().isEmpty()) {
        lista = cli.getReservas();
    }
        %>
        <section class="jumbotron">
            <div class="container">   
                <a href="#" data-toggle="modal" data-target="#ModalUsu" role="button"><span class="icon-user"></span>Usuario</a>

                <section class="jumbotron2">
                    <div class="modal fade" id="ModalUsu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Usuario</h4>
                                </div>
                                <div class="modal-body">
                                    <div style="text-align:center;" ><img src="img/Usuario.jpg"></div>
                                    <a class="divider"></a>
                                    <h1>Nickname</h1>
                                    <a class="divider"></a>
                                    <h3>Nombre</h3>
                                    <a class="divider"></a>
                                    <h3>Apellido</h3>
                                    <a class="divider"></a>
                                    <h3>email</h3>
                                    <a class="divider"></a>
                                </div>
                                <div class="modal-footer">
                                    <a href="index.jsp"> <button type="button" class="btn btn-danger">Cerrar Sesión</button> </a>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <a href="#" data-toggle="modal" data-target="#ModalRes" role="button"><span class="glyphicon glyphicon-heart"></span>Reservas</a>

                <section class="jumbotron2">
                    <div class="modal fade" id="ModalRes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Reservas</h4>
                                </div>
                                <div class="modal-body">
                                    <a class="divider"></a>
                                    <form name="form" action="reservausu.do" method="POST"> 
                                        <p>Reservas del usuario <%= cli.getNick()%> :</p>
                                            <%
                                                
                                                if (lista!=null) {
                                                    %><select class="form-control" name="rsv" size="1"><%
                                                    for (int i = 0; i < lista.size(); i++) {

                                                        reservaUsu = Integer.parseInt(lista.get(i).toString());
                                                        DtInfoReserva rese = IS.verInfoReserva(reservaUsu);
                                            %>

                                            <option value="<%= reservaUsu%>">Reserva Nº<%= reservaUsu%> </option> 

                                            <%
                                                }
                                            %></select><button type="submit" class="btn btn-primary">ver info</button><%
                                            } else {
                                            %>
                                        <h3>No hay reservas para el usuario <%= cli.getNick()%></h3> 
                                        <%}%>
                                        
                                    </form>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>             
                <a href="#" data-toggle="modal" data-target="#ModalCar" role="button"><span class="icon-basket"></span>Carrito <span class="badge">0</span></a>

                <section class="jumbotron2">
                    <div class="modal fade" id="ModalCar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Carrito</h4>
                                </div>
                                <div class="modal-body">    
                                    ...
                                    <a class="divider">----------------------------------------------------</a>
                                    ...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                    <button type="button" class="btn btn-primary">Aceptar</button>
                                </div>
                            </div>
                        </div>
                    </div>            
                </section>

                <h1><img src="img/H4Tlogo.png">H4T</h1>
                <p>Oferta de hoteles, Paquetes de viajes y mas...</p>
            </div>
        </section>
        <%}%>
    
    <section class="main container">
        <div class="row">
            <section class="posts col-md-9">
                <div class="miga-de-pan">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Inicio</a></li>
                        <li>Promociones</li>
                        <li><a href="servicios.jsp">Servicios</a></li>
                    </ol>
                </div>
                <form name="form" action="reservapromo.do" method="POST"> 
                <%
                    List <DtPromocion>proObtenidos= IS.listarPromociones();
                    for(int i=0; i<proObtenidos.size(); i++){%>
                    <article class="post clearfix">
                        
                    <a href="#" class="thumb pull-left">
                        
                        <img class="img-thumbnail" src="img/bannerPromo.jpg" alt="imgP">
                    </a>
                    <% String num = Integer.toHexString(i+1); %>
                    <% String nomPro= proObtenidos.get(i).getNombre();%>
                        <h2 class="post-title"><a href="#">Promoción: <%= nomPro%></a></h2>
                    <p class="post-contenido text-justify"></p>
                    <p><span class="post-fecha">26 de Enero de 2016</span> por<span class="post-autor"><a href="#"> Proveedor</a></span></p>
                    <div class="contenedor-botones">
                        <a href="../index.jsp" class="btn btn-primary">Agregar a carrito</a>
                        <input type="hidden" name="rP" value="<%= nomPro%>">
                        <button type="submit" class="btn btn-primary">ver info</button>
                    </div>
                </article>
                <%}%>
                </form>
    
            </section>
            
            <aside class="col-md-3 hidden-xs hidden-sm">
                    <h4>Categorias</h4>
                    <div class="list-group">
                        <a href="#" class="list-group-item">Hoteles</a>
                        <a href="#" class="list-group-item">Viajes</a>
                        <a href="#" class="list-group-item">Vehiculos</a>
                    </div>
                </aside>
        </div>
    </section>
    
    <footer>
        <div class="contenedorPie">
            <p class="copy"><img src="img/logo.ico"> H4T &copy; 2016</p>
            <div class="sociales">
            </div>
        </div>
    </footer>
    
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
</body>
</html>