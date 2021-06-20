<%-- 
    Document   : inicio
    Created on : 14-abr-2021, 16:15:23
    Author     : daniel
--%>

<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>
            <title>Inicio</title>

            <style>
                #verVehiculos:hover{
                    background-color: #0275d8;
                    color:white;
                }
                
            </style>
        </head>
        <body>


        <c:import url="../Menu/menuTrabajador.jsp"></c:import>

        <c:set var="hoy" value="<%=new Date()%>"/>



         <c:if test="${!empty error}">
            <script>
                Swal.fire({
                icon: 'error',
                title: 'Error',
                text: '${error}'
                });
            </script>
        </c:if>

        <c:if test="${!empty mensaje}">
            <script>
                Swal.fire({
                icon: 'success',
                title: 'Hecho!',
                text: '${mensaje}'
                });
            </script>
        </c:if>


        <%--
        
        Al cargar la página mostraremos las 10 últimas ofertas en la ciudad del trabajador
        
        A la derecha habrá un menú donde el trabajador establecerá los filtros para buscar ofertas
        
        Cuando el trabajador pulse en una oferta, irá a la pagina de inscripcion de la oferta.
        
        --%>




        <div class="container mt-4 bg-white p-3" style="border-radius: 10px;">


            <div class="row">

                <div class="col-12 col-md-8 offset-md-2">
                    <h1 class="text-center mt-2"> Bienvenido ${trabajador.nombre} </h1>
                </div>

                <div class="col-12 col-md-8 offset-md-2 bg-light p-2" style="font-weight: bold; font-size: 1em;">


                    <form method="POST" action="BusquedaOfertaParam">

                        <div class="container">
                            <div class="row">
                                <div class="col-12 col-md-6">

                                    <div class="form-group">


                                        <label for="ciudad">Ciudad</label>
                                        <select class="form-select" name="ciudad" id="ciudad">

                                            <option value="cualquiera" 

                                                    <c:if test="${ciudad.equals('cualquiera')}">
                                                        selected
                                                    </c:if>

                                                    >Cualquiera</option>

                                            <c:forEach var="ciudad" items="${gestion.obtenerCiudades()}">
                                                <option value="${ciudad}"
                                                        <c:if test="${ciudad.equals(trabajador.ciudad) && empty param.ciudad}">
                                                            selected
                                                        </c:if>

                                                        <c:if test="${!empty ciudad && ciudad.equals(param.ciudad)}">
                                                            selected
                                                        </c:if>
                                                        >
                                                    ${ciudad}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">


                                        <label for="salario">Salario mínimo</label>
                                        <input class="form-control" type="number" id="salario" name="salario" min="0" max="100"

                                               <c:if test="${!empty salario}"></c:if>
                                               value="${salario}"

                                               <c:if test="${empty salario}">
                                                   value="0"    
                                               </c:if>
                                               >
                                    </div>

                                </div>

                                <div class="col-12 col-md-6">


                                    <div class="form-group">

                                        <label for="fechaInicio">Desde:</label>
                                        <input class="form-control" type="date" id="fechaInicio" name="fechaInicio" min="<fmt:formatDate pattern="yyyy-MM-dd" value="${hoy}"></fmt:formatDate>"

                                            <c:if test="${!empty fechaInicio}">
                                                value="${fechaInicio}"
                                            </c:if>
                                            ></div>

                                    <div class="form-group">
                                        <label for="fechaFin">Hasta:</label>

                                        <input class="form-control" type="date" id="fechaFin" name="fechaFin" min="<fmt:formatDate pattern="yyyy-MM-dd" value="${hoy}"></fmt:formatDate>"

                                            <c:if test="${!empty fechaFin}">
                                                value="${fechaFin}"
                                            </c:if>
                                            >
                                    </div>

                                </div>

                                <div class="col-12 col-md-4 offset-md-4 mt-3">
                                    <div class="form-group">
                                        <input style="color:white;" class="form-control btn bg-primary" type="submit" name="buscar" value="Buscar">    
                                    </div>
                                </div>
                            </div>
                        </div>






                    </form>

                </div>

            </div>



            <div id="listado" class="row">

                <div class="col-12 col-md-8 offset-md-2 mt-4 mb-4">
                    <h2> Ofertas para ti... </h2>
                </div> 
                <c:if test="${empty buscar}">


                    <c:forEach var="oferta" items="${gestion.cargarUltimasCincoOfertas(trabajador.ciudad)}">


                        <div class="col-12 col-md-8 offset-md-2 rounded border border-primary p-3 mb-4 columnas">

                                        <h2 class="text-center">${oferta.empresa.nombre}</h2>
                                        <p>
                                            ${oferta.descripcion}
                                        </p>
                                        <span>${oferta.empresa.ciudad}</span><br>
                                        <span >Fecha de inicio: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaInicio}"/>
                                               - Fecha de fin: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaFin}"/></span><br>
                                        
                                               <span>Salario: ${oferta.salario} &euro;</span><br>
                                        <span>Vehiculos de la empresa: ${oferta.empresa.vehiculos.size()}</span><br>

                                        <c:if test="${oferta.empresa.vehiculos.size() > 0}">
                                            <button id="verVehiculos" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#vehiculosModal">
                                                Ver vehículos
                                            </button>

                                            <div class="modal fade" id="vehiculosModal" tabindex="-1" role="dialog" aria-labelledby="vehiculosModal" 
                                                 aria-hidden="true">

                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header bg-primary mb-3" style="color:white;">
                                                            <h1>${oferta.empresa.nombre}</h1></div>
                                                        <div class="modal-content p-3">
                                                            <c:forEach var="vehiculo" items="${oferta.empresa.vehiculos}">

                                                                <h4>Vehículo</h4>
                                                                <ul class="list-group" >

                                                                    <li class="list-group-item list-group-item">
                                                                        Tipo: ${vehiculo.tipo}
                                                                    </li>

                                                                    <li class="list-group-item list-group-item">
                                                                        <c:if test="${vehiculo.tipo.equals('Coche')}">
                                                                            Carnet necesario tipo B
                                                                        </c:if>

                                                                        <c:if test="${vehiculo.tipo.equals('Moto')}">
                                                                            Carnet necesario tipo AM
                                                                        </c:if>
                                                                    </li>

                                                                </ul>

                                                            </c:forEach>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Volver</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                        <br><span>Vacantes: ${oferta.vacantes}</span>
                                        <br><span>Inscritos: ${oferta.numeroInscritos}</span>

                                        <form action="ReenvioOferta" method="POST">
                                            <input type="hidden" name="id" value="${oferta.id}">
                                            <input class="btn bg-primary" style="float:right;color:white;" type="submit" name="inscripcion" value="Inscribirme en la oferta">
                                        </form>
                                    </div>


                    </c:forEach>

                </c:if>



                <c:if test="${!empty buscar}">



                    <c:forEach var="oferta" items="${ofertas}">

                    
                                    <div class="col-12 col-md-8 offset-md-2 rounded border border-primary p-3 mb-4">

                                        <h2 class="text-center">${oferta.empresa.nombre}</h2>
                                        <p>
                                            ${oferta.descripcion}
                                        </p>
                                        <span>${oferta.empresa.ciudad}</span><br>
                                        <span >Fecha de inicio: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaInicio}"/></span><br>
                                        <span >Fecha de fin: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaFin}"/></span><br>
                                        <span>Salario: ${oferta.salario}</span><br>
                                        <span>Vehiculos de la empresa: ${oferta.empresa.vehiculos.size()}</span><br>

                                        <c:if test="${oferta.empresa.vehiculos.size() > 0}">
                                            <button id="verVehiculos" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#vehiculosModal">
                                                Ver vehículos
                                            </button>

                                            <div class="modal fade" id="vehiculosModal" tabindex="-1" role="dialog" aria-labelledby="vehiculosModal" 
                                                 aria-hidden="true">

                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header bg-primary mb-3" style="color:white;">
                                                            <h1>${oferta.empresa.nombre}</h1></div>
                                                        <div class="modal-content p-3">
                                                            <c:forEach var="vehiculo" items="${oferta.empresa.vehiculos}">

                                                                <h4>Vehículo</h4>
                                                                <ul class="list-group" >

                                                                    <li class="list-group-item list-group-item">
                                                                        Tipo: ${vehiculo.tipo}
                                                                    </li>

                                                                    <li class="list-group-item list-group-item">
                                                                        <c:if test="${vehiculo.tipo.equals('Coche')}">
                                                                            Carnet necesario tipo B
                                                                        </c:if>

                                                                        <c:if test="${vehiculo.tipo.equals('Moto')}">
                                                                            Carnet necesario tipo AM
                                                                        </c:if>
                                                                    </li>

                                                                </ul>

                                                            </c:forEach>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Volver</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                        <br><span>Vacantes: ${oferta.vacantes}</span>
                                        <br><span>Inscritos: ${oferta.numeroInscritos}</span>

                                        <form action="ReenvioOferta" method="POST">
                                            <input type="hidden" name="id" value="${oferta.id}">
                                            <input class="btn bg-primary" style="float:right;color:white;" type="submit" name="inscripcion" value="Inscribirme en la oferta">
                                        </form>
                                    </div>


                    </c:forEach>

                </c:if>


            </div>



        </div>	






























        <%--

        <div class="container mt-4">

            <div class="row">

                <div class="col text-center" style="font-weight: bold; font-size: 200%; color: #0275d8">

                    <p> Bienvenido ${trabajador.nombre} </p>

                </div>

            </div>

        </div>


        <div class="container mt-4">

            <div class="row">

                <div class="col-md-3 rounded border border-primary p-3" style="height: 25em;">
        <%-- FORMULARIO 
        <form method="POST" action="BusquedaOfertaParam">

                        <div class="form-group">


                            <label for="ciudad">Ciudad</label>
                            <select class="form-control" name="ciudad" id="ciudad">

                                <option value="cualquiera" 

                                        <c:if test="${ciudad.equals('cualquiera')}">
                                            selected
                                        </c:if>

                                        >Cualquiera</option>

                                <c:forEach var="ciudad" items="${gestion.obtenerCiudades()}">
                                    <option value="${ciudad}"
                                            <c:if test="${ciudad.equals(trabajador.ciudad) && empty param.ciudad}">
                                                selected
                                            </c:if>

                                            <c:if test="${!empty ciudad && ciudad.equals(param.ciudad)}">
                                                selected
                                            </c:if>
                                            >
                                        ${ciudad}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">


                            <label for="salario">Salario mínimo</label>
                            0<input class="form-control" type="range" id="salario" name="salario" min="0" max="100"

                                    <c:if test="${!empty salario}"></c:if>
                                    value="${salario}"

                                    <c:if test="${empty salario}">
                                        value="0"    
                                    </c:if>
                                    >100
                        </div>

                        <div class="form-group">

                            <p>Seleccionar rango de días</p>

                            <label for="fechaInicio">Desde:</label>
                            <input class="form-control" type="date" id="fechaInicio" name="fechaInicio" min="<fmt:formatDate pattern="yyyy-MM-dd" value="${hoy}"></fmt:formatDate>"

                                <c:if test="${!empty fechaInicio}">
                                    value="${fechaInicio}"
                                </c:if>
                                ></div>

                        <div class="form-group">
                            <label for="fechaFin">Hasta:</label>

                            <input class="form-control" type="date" id="fechaFin" name="fechaFin" min="<fmt:formatDate pattern="yyyy-MM-dd" value="${hoy}"></fmt:formatDate>"

                                <c:if test="${!empty fechaFin}">
                                    value="${fechaFin}"
                                </c:if>
                                >
                        </div>

                        <div class="form-group">
                            <input style="color:white;" class="form-control btn bg-primary" type="submit" name="buscar" value="Buscar">    
                        </div>

                    </form>
                </div>



                <div class="col-md-9 ">


                    <div class="container">

                        <div class="row">
                            <div class="col-12">
                                Ofertas para ti...
                            </div> 
                            <c:if test="${empty buscar}">


                                <c:forEach var="oferta" items="${gestion.cargarUltimasCincoOfertas(trabajador.ciudad)}">


                                    <div class="col-12 rounded border border-primary p-3 mb-4">

                                        <h2 class="text-center">${oferta.empresa.nombre}</h2>
                                        <p>
                                            ${oferta.descripcion}
                                        </p>
                                        <span>${oferta.empresa.ciudad}</span><br>
                                        <span >Fecha de inicio: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaInicio}"/></span><br>
                                        <span >Fecha de fin: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaFin}"/></span><br>
                                        <span>Salario: ${oferta.salario}</span><br>
                                        <span>Vehiculos de la empresa: ${oferta.empresa.vehiculos.size()}</span><br>

                                        <c:if test="${oferta.empresa.vehiculos.size() > 0}">
                                            <button id="verVehiculos" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#vehiculosModal">
                                                Ver vehículos
                                            </button>

                                            <div class="modal fade" id="vehiculosModal" tabindex="-1" role="dialog" aria-labelledby="vehiculosModal" 
                                                 aria-hidden="true">

                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header bg-primary mb-3" style="color:white;">
                                                            <h1>${oferta.empresa.nombre}</h1></div>
                                                        <div class="modal-content p-3">
                                                            <c:forEach var="vehiculo" items="${oferta.empresa.vehiculos}">

                                                                <h4>Vehículo</h4>
                                                                <ul class="list-group" >

                                                                    <li class="list-group-item list-group-item">
                                                                        Tipo: ${vehiculo.tipo}
                                                                    </li>

                                                                    <li class="list-group-item list-group-item">
                                                                        <c:if test="${vehiculo.tipo.equals('Coche')}">
                                                                            Carnet necesario tipo B
                                                                        </c:if>

                                                                        <c:if test="${vehiculo.tipo.equals('Moto')}">
                                                                            Carnet necesario tipo AM
                                                                        </c:if>
                                                                    </li>

                                                                </ul>

                                                            </c:forEach>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Volver</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                        <br><span>Vacantes: ${oferta.vacantes}</span>
                                        <br><span>Inscritos: ${oferta.numeroInscritos}</span>

                                        <form action="ReenvioOferta" method="POST">
                                            <input type="hidden" name="id" value="${oferta.id}">
                                            <input class="btn bg-primary" style="float:right;color:white;" type="submit" name="inscripcion" value="Inscribirme en la oferta">
                                        </form>
                                    </div>


                                </c:forEach>

                            </c:if>



                            <c:if test="${!empty buscar}">



                                <c:forEach var="oferta" items="${ofertas}">

                                    <div class="col-12 rounded border border-primary p-3 mb-4">

                                        <h2 class="text-center">${oferta.empresa.nombre}</h2>
                                        <p>
                                            ${oferta.descripcion}
                                        </p>
                                        <span>${oferta.empresa.ciudad}</span><br>
                                        <span >Fecha de inicio: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaInicio}"/></span><br>
                                        <span >Fecha de fin: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaFin}"/></span><br>
                                        <span>Salario: ${oferta.salario}</span><br>
                                        <span>Vehiculos de la empresa: ${oferta.empresa.vehiculos.size()}</span><br>

                                        <c:if test="${oferta.empresa.vehiculos.size() > 0}">
                                            <button id="verVehiculos" type="button" class="btn" data-bs-toggle="modal" data-bs-target="#vehiculosModal">
                                                Ver vehículos
                                            </button>

                                            <div class="modal fade" id="vehiculosModal" tabindex="-1" role="dialog" aria-labelledby="vehiculosModal" 
                                                 aria-hidden="true">

                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header bg-primary mb-3" style="color:white;">
                                                            <h1>${oferta.empresa.nombre}</h1></div>
                                                        <div class="modal-content p-3">
                                                            <c:forEach var="vehiculo" items="${oferta.empresa.vehiculos}">

                                                                <h4>Vehículo</h4>
                                                                <ul class="list-group" >

                                                                    <li class="list-group-item list-group-item">
                                                                        Tipo: ${vehiculo.tipo}
                                                                    </li>

                                                                    <li class="list-group-item list-group-item">
                                                                        <c:if test="${vehiculo.tipo.equals('Coche')}">
                                                                            Carnet necesario tipo B
                                                                        </c:if>

                                                                        <c:if test="${vehiculo.tipo.equals('Moto')}">
                                                                            Carnet necesario tipo AM
                                                                        </c:if>
                                                                    </li>

                                                                </ul>

                                                            </c:forEach>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Volver</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                        <br><span>Vacantes: ${oferta.vacantes}</span>
                                        <br><span>Inscritos: ${oferta.numeroInscritos}</span>

                                        <form action="ReenvioOferta" method="POST">
                                            <input type="hidden" name="id" value="${oferta.id}">
                                            <input class="btn bg-primary" style="float:right;color:white;" type="submit" name="inscripcion" value="Inscribirme en la oferta">
                                        </form>
                                    </div>


                                </c:forEach>

                            </c:if>






                        </div>

                    </div>
                </div>

            </div>

        </div>


        <%--
                <form method="POST" action="BusquedaOfertaParam">

            <label for="ciudad">Ciudad</label>
            <select name="ciudad" id="ciudad">

                <option value="cualquiera" 

                        <c:if test="${ciudad.equals('cualquiera')}">
                            selected
                        </c:if>

                        >Cualquiera</option>
                <c:forEach var="ciudad" items="${gestion.obtenerCiudades()}">
                    <option value="${ciudad}"
                            <c:if test="${ciudad.equals(trabajador.ciudad) && empty param.ciudad}">
                                selected
                            </c:if>

                            <c:if test="${!empty ciudad && ciudad.equals(param.ciudad)}">
                                selected
                            </c:if>
                            >
                        ${ciudad}
                    </option>
                </c:forEach>
            </select>
            <br>


            <label for="salario">Salario mínimo</label>
            0<input type="range" id="salario" name="salario" min="0" max="100"

                   <c:if test="${!empty salario}"></c:if>
                   value="${salario}"
                   
                   <c:if test="${empty salario}">
                    value="0"    
                    </c:if>
                   >
                   
                    
            100
            <br><br>
            
            
            <label>Seleccionar rango de días</label>
            <br>
            
            <label for="fechaInicio">Desde:</label>
            <input type="date" id="fechaInicio" name="fechaInicio" min="<fmt:formatDate pattern="yyyy-MM-dd" value="${hoy}"></fmt:formatDate>"

                   <c:if test="${!empty fechaInicio}">
                       value="${fechaInicio}"
                   </c:if>
             >
            <br>
            <label for="fechaFin">Hasta:</label>
            <br>
            <input type="date" id="fechaFin" name="fechaFin" min="<fmt:formatDate pattern="yyyy-MM-dd" value="${hoy}"></fmt:formatDate>"

                   <c:if test="${!empty fechaFin}">
                       value="${fechaFin}"
                   </c:if>
             >
            <br><br>

            <input type="submit" name="buscar" value="Buscar">
        </form>

        --%>    









        <%--    

        <c:if test="${empty buscar}">
            
            

        <%-- Si la pagina no recibe el parametro buscar, carga las ultimas 5 ofertas del
             trabajador
        
        SIEMPRE SE CARGAN LAS OFERTAS QUE ESTÉN DISPONIBLES,
        ESTO QUIERE DECIR QUE ESTÉN EN RANGO DE FECHAS PARA QUE EL TRABAJAJDOR SE PUEDA INSCRIBIR.
        NO MOSTRAREMOS LAS OFERTAS QUE SUS DIAS DE TRABAJO YA HAYAN PASADO
        
        gestion.OfertaDisponible(oferta.fechaInicio, oferta.fechaFin)
             gestion.OfertaDisponible(oferta.fechaInicio, oferta.fechaFin)
        
        <table>
            <c:forEach var="oferta" items="${gestion.cargarUltimasCincoOfertas(trabajador.ciudad)}">
                
                
                   
                    <tr>
                    <td>Fecha de inicio: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaInicio}"/></td>
                </tr>

                    <tr>
                        <td>Fecha de fin: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaFin}"/></td>
                    </tr>

                    <tr>
                        <td>Vehiculos de la empresa: ${oferta.empresa.vehiculos.size()}</td>

                    </tr>

                        <c:if test="${oferta.empresa.vehiculos.size() > 0}">

                                <c:forEach var="vehiculo" items="${oferta.empresa.vehiculos}">

                                        <tr>
                                            <td>Tipo: ${vehiculo.tipo}</td>
                                        <c:if test="${vehiculo.tipo.equals('Coche')}">
                                                <td>Carnet necesario tipo B</td>
                                        </c:if>

                                        <c:if test="${vehiculo.tipo.equals('Moto')}">
                                            <td>Carnet necesario tipo AM</td>
                                        </c:if>
                                         </tr>

                                </c:forEach>
                        </c:if>

                    <tr>
                        <td>Salario: ${oferta.salario}</td>
                    </tr>

                    <tr>
                        <td>Vacantes: ${oferta.vacantes}</td>
                    </tr>

                    <tr>
                        <td>Inscritos: ${oferta.inscripciones.size()}</td>
                    </tr>

                    <tr>
                        <td>
                            <form action="ReenvioOferta" method="POST">
                                <input type="hidden" name="id" value="${oferta.id}">
                                <input type="submit" name="inscripcion" value="Inscribirme en la oferta">
                            </form>
                        </td>
                    </tr>
                    
      

                </c:forEach>
                </table>

                </c:if>

        --%>     

        <%-- EL USUARIO HA PULSADO EN BUSCAR--%>


        <c:import url="../EstiloMenu/piePagina.jsp"></c:import>

    </body>
</html>
