<%@page import="DataTypes.DtPromocion"%>
<!DOCTYPE html>
<%@page import="Usuario.infoSesion"%>
<%@page import="DataTypes.DtTiposAsociativos"%>
<%@page import="DataTypes.DtInfoReserva"%>
<%@page import="DataTypes.DtCliente"%>
<%@page import="DataTypes.DtInfoServicio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="Logica.ISistema"%>
<%@page import="Logica.Fabrica"%>
<%@page import="Modelo.Reserv" %>
<%
    //Tomo el identificador de reserva que me llega por servlet
    ISistema IS = Fabrica.getInstance().getISistema();
    HttpSession misession = (HttpSession) request.getSession();
    infoSesion datos = (infoSesion) misession.getAttribute("datos");
    DtCliente cli = IS.verInfoCliente(datos.getNickname());

    ArrayList<Integer> lista = null;
        if (!cli.getReservas().isEmpty()) {
            lista = cli.getReservas();
        }
    List<DtPromocion> promociones = new ArrayList();
//    promociones = IS.listarPromociones();
    List servicios = IS.listarServicios();
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/i18n/defaults-*.min.js"></script>
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
                            <li class="active"><a href="index.jsp">Inicio</a></li>
                            <li><a href="promociones.jsp">Promociones</a></li>
                            <li><a href="servicios.jsp">Servicios</a></li>
                        </ul>
                        <form action="" class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Servicios o Promociones">
                            </div>
                            <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
                        </form>

                        <!-- buscador -->
                    </div>
                </div>
            </nav>
        </header>

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
                                    <% String nickname = cli.getNick();%>
                                    <h1><%= nickname%></h1>
                                    <a class="divider"></a>
                                    <% String nombre = cli.getNombre();%>
                                    <h3><%= nombre%></h3>
                                    <a class="divider"></a>
                                    <% String apellido = cli.getApellido();%>
                                    <h3><%= apellido%></h3>
                                    <a class="divider"></a>
                                    <% String email = cli.getCorreo();%>
                                    <h3><%= email%></h3>
                                    <a class="divider"></a>
                                    <% String fechaN = cli.getFechaN().toString();%>
                                    <h3><%= fechaN%></h3> 
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
                                        <p>Reservas del usuario <%= nombre%> :</p>
                                        <%
                                            if (lista != null) {
                                        %><select class="form-control" name="rsv" size="1"><%
                                            for (int i = 0; i < lista.size(); i++) {
                                                reservaUsu = Integer.parseInt(lista.get(i).toString());
                                            %>
                                            <option value="<%= reservaUsu%>">Reserva Nº<%= reservaUsu%> </option> 

                                            <%
                                                }
                                            %></select><button type="submit" class="btn btn-primary">ver info</button><%
                                            } else {
                                            %>
                                        <h3>No hay reservas para el usuario <%= nombre%></h3> 
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
                                    <!-- carrito -->
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

        <section class="main container">
            <div class="row">
                <section class="posts col-md-9">
                    <div class="miga-de-pan">
                        <ol class="breadcrumb">
                            <li>Inicio</li>
                            <li><a href="promociones.jsp">Promociones</a></li>
                            <li><a href="servicios.jsp">Servicios</a></li>
                        </ol>
                    </div>
                    <section class="jumbotron4">
                        <% if (lista.size() > 0) {
                                Reserv rs = (Reserv) request.getSession().getAttribute("rU");
                                int r = Integer.parseInt(rs.getNumero());

                                DtInfoReserva infoR = IS.verInfoReserva(r);
                                String estado = infoR.getEstado().name();
                                int numero = infoR.getNumero();
                                float precio = infoR.getPrecio();
                                Date fc = infoR.getFecha();
                                List P = null;
                                List S = null;
                                if (!infoR.getPromociones().isEmpty()) {
                                    P = infoR.getPromociones();
                                }

                                if (!infoR.getServicios().isEmpty()) {
                                    S = infoR.getServicios();
                                }


                        %>

                        <h3>Estado: </h3><h4><%= estado%></h4>
                        <h3>Numero: </h3><h4><%= numero%></h4>
                        <h3>Precio:</h3><h4>$ <%= precio%></h4>
                        <h3>Fecha: </h3><h4><%= fc%></h4>
                        <form name="form" action="reservaser.do" method="POST"> 
                            <h3>Servicios:</h3>

                            <%
                                if (S != null) {
                            %> <select class="form-control" name="rS" size="1"> <%
                                for (int i = 0; i < S.size(); i++) {
                                    DtTiposAsociativos asos = (DtTiposAsociativos) S.get(i);
                                    String a = asos.getNomSerPro();
                                %>
                                <option value="<%= a%>">Servicio: <%= a%> </option> 
                                <%
                                    }

                                %></select><button type="submit" class="btn btn-primary">ver info</button><%                                } else {
                                %>
                            <h3>No tiene Servicios</h3> 
                            <%}%>

                        </form>

                        <form name="form" action="reservapromo.do" method="POST"> 
                            <h3>Promociones:</h3>

                            <%
                                if (P != null) {
                            %> <select class="form-control" name="rP" size="1"> <%
                                for (int i = 0; i < P.size(); i++) {
                                    DtTiposAsociativos prom = (DtTiposAsociativos) P.get(i);
                                    String a = prom.getNomSerPro();
                                %>
                                <option value="<%= a%>">Promocion: <%= a%> </option> 
                                <%
                                    }
                                %></select><button type="submit" class="btn btn-primary">ver info</button><%
                                } else {
                                %>
                            <h3>No tiene Promociones</h3> 
                            <%}%>

                        </form>
                        <%}%>
                    </section>
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
