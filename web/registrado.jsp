<%-- 
    Document   : registrado
    Created on : 19/10/2016, 02:16:20 AM
    Author     : nicop
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>help4travel</title>
        <link rel="shortcut icon" href="img/logo.ico">
        <link rel="stylesheet" href="css/fontello.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/estilos.css">
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
                            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
                        </form>
                    </div>
                </div>
            </nav>
        </header>


        <section class="jumbotron">
            <div class="container"> 
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
                <p>Se ha registrado correctamente!</p>
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

                    <section class="carrusel">       
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <img src="img/bannerPromo.jpg" alt="...">
                                    <div class="carousel-caption">
                                        <a href="promociones.jsp">
                                            <h4>Todas las Promociones de H4T</h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="item">
                                    <img src="img/bannerServi.jpg" alt="...">
                                    <div class="carousel-caption">
                                        <a href="servicios.jsp">
                                            <h4>Todos los Servicios de H4T</h4>
                                        </a>
                                    </div>
                                </div>
                                <!-- Controls -->
                                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
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
