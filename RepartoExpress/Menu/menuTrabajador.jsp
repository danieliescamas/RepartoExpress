<%-- 
    Document   : menuTrabajador
    Created on : 14-abr-2021, 20:20:00
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            
    <!-- MENU NAVEGACION-->

 
    <header>
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            
            <div class="container">
                
                <a class="navbar-brand w-25 " id="imagen" name="imagen" href="inicio.jsp" style="margin-left: -2%; margin-right: 10%;">
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
                            <a class="nav-link " href="inicio.jsp">Empleo</a>
                        </li>
                        
                        <li class="nav-item rounded">
                            <a class="nav-link" href="inscripciones.jsp">Mis inscripciones</a>
                        </li>
                        
                        <li class="nav-item rounded ">
                            <a class="nav-link" href="verEmpresas.jsp">Buscar empresas</a>
                        </li>
                        
                        <li class="nav-item rounded">
                            <a class="nav-link" href="vehiculos.jsp">Gestionar mis vehículos</a>
                        </li>
                        
                        <li class="nav-item rounded"><a class="nav-link" href="contratos.jsp">Mis contratos
                            </a>
                        </li>
                        
                        <li class="nav-item rounded">
                            <a class="nav-link" href="notificaciones.jsp">Notificaciones 
                                
                                <c:if test="${gestion.tieneNoLeidas(trabajador)}">
                                    
                                        <span class="notificacion">${gestion.cargarNoLeidas(trabajador)}</span>
                                    
                                </c:if>
                                
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
                                            Cambiar contraseña</a></li>

                                    <li><a class="dropdown-item" href="../CerrarSesion">
                                            <i class="fas fa-sign-out-alt"></i>Cerrar sesión</a></li>
                                            
                                            
                                </ul>
                            </div>
                        </li>

                    </ul>

                </div>
                
                
            </div>
            
            
            
        </nav>
        
    </header>
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    