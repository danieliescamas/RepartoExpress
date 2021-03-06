<%-- 
    Document   : menuEmpresa
    Created on : 16-may-2021, 11:44:32
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%-- 
    Document   : menuTrabajador
    Created on : 14-abr-2021, 20:20:00
    Author     : daniel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            
    <!-- MENU NAVEGACION-->

 
    <header>
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            
            <div class="container">
                
                <a class="navbar-brand w-25 " id="imagen" name="imagen" href="ofertas.jsp" style="margin-left: -2%; margin-right: 10%;">
                    REPARTO EXPRESS
                    <img class="w-50" src="../Imagenes/encabezado.jpg" alt="imagenEncabezado">
                    
                </a>
                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#listaNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse navbar-right" id="listaNav">

                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 align-items-center ">

                        <!--  -->
                        
                        
                        <li class="nav-item rounded">
                            <a class="nav-link " href="busquedaTrabajadores.jsp">Buscar trabajadores</a>
                        </li>
                        
                        <li class="nav-item rounded">
                            <a class="nav-link" href="nuevaOferta.jsp">Nueva oferta</a>
                        </li>
                        
                        <li class="nav-item rounded">
                            <a class="nav-link" href="contratos.jsp">Mis contratos</a>
                        </li>
                        
                        <li class="nav-item rounded ">
                            <a class="nav-link" href="ofertas.jsp">Mis ofertas</a>
                        </li>
                        
                        
                        <li class="nav-item rounded"><a class="nav-link" href="vehiculos.jsp">Gestionar mis veh??culos
                            </a>
                        </li>
                        

                    </ul>

                    <ul class="d-flex flex-row flex-row-reverse navbar-nav">
                        <li class="nav-item d">
                            <!--BOTON DESPLEGABLE-->
                            <div class="dropdown">
                                <button class="btn dropdown-toggle " type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                    Mi perfil
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    
                                    
                                    <li><a class="dropdown-item" href="perfil.jsp">
                                            Mi perfil</a></li>
                                            
                                            
                                     
                                    <li><a class="dropdown-item" href="modificarPassword.jsp">
                                            Cambiar contrase??a</a></li>

                                    <li><a class="dropdown-item" href="../CerrarSesion">
                                            <i class="fas fa-sign-out-alt"></i>Cerrar sesi??n</a></li>
                                            
                                            
                                </ul>
                            </div>
                        </li>

                    </ul>

                </div>
                
                
            </div>
            
            
            
        </nav>
        
    </header>
