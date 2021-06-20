<%-- 
    Document   : nuevoContrato
    Created on : 23-may-2021, 21:10:01
    Author     : daniel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>
        <title>JSP Page</title>
    </head>
    <body>


        <c:import url="../Menu/menuEmpresa.jsp"></c:import>


            <div class="container mt-4">

                <div class="row">

                    <div class="col-12 text-center" style="font-weight: bold; font-size: 200%;">

                        <p>Nuevo contrato...</p>

                    </div>

                </div>

            </div>


            <div class="container mt-3 bg-light p-3">


                <div class="row mb-4">

                    <div class="col-12 col-md-8 offset-md-2 border border-primary mb-3">


                        <h2 class="text-center">${oferta.empresa.nombre}</h2>
                    <p>
                        ${oferta.descripcion}
                    </p>
                    <p>${oferta.empresa.ciudad}</p>
                    <p>Fecha de inicio: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaInicio}"/></p>
                    <p>Fecha de fin: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaFin}"/></p>
                    <p>Salario: ${oferta.salario}</p>

                </div>

                <div class="col-12 col-md-8 offset-md-2 border border-primary mb-3">


                    <h2 class="text-center">${trabajador.nombre}</h2>

                    <p>${trabajador.descripcion}</p>
                    <p>DNI: ${trabajador.dni}</p>
                    <p>Fecha de nacimiento: <fmt:formatDate pattern="dd-MM-yyyy" value="${trabajador.fechaNacimiento}"/> </p>
                    <p>Telefono: ${trabajador.telefono}</p>
                    <p>Carnet: ${trabajador.tipoCarnet}</p>

                    <p>Valoracion media:  
                        <c:choose>
                            <c:when test="${trabajador.valoracion.size() > 0}">
                                ${trabajador.valoracionMedia()}
                            </c:when>

                            <c:when test="${trabajador.valoracion.size() == 0}">
                                No tienes valoraciones
                            </c:when>
                        </c:choose>

                </div>

                <div class="col-12 col-md-8 offset-md-2">
                    
                      <form method="POST" action="NuevoContrato">

            <c:if test="${empty vehiculoParticular}">
                <h4>Es necesario que le asignes un vehiculo de tu empresa al trabajador.</h4>


                <c:choose>

                    <c:when test="${gestion.vehiculosDisponiblesTrabajador(oferta, trabajador)}">


                        <c:forEach var="vehiculo" items="${gestion.obtenerVehiculosDisponibles(oferta,trabajador)}">
                            <label for="vehiculo">${vehiculo.tipo} - ${vehiculo.matricula}</label>
                            <input type="radio" name="vehiculo" value="${vehiculo.id}">
                        </c:forEach>



                    </c:when>

                    <c:otherwise>


                        <h4>No tienes vehiculos disponibles para asignar a este trabajador.</h4>

                    </c:otherwise>

                </c:choose>

            </c:if>     



            <c:if test="${!empty vehiculoParticular}">

                <p>Vehiculo inscrito</p>
                <p>${vehiculoParticular.tipo}</p>
                <p>${vehiculoParticular.matricula}</p>
                <p>${vehiculoParticular.tipoPropietario}</p>
                <p></p>

                <input type="hidden" name="vehiculo" value="${vehiculoParticular.id}">
            </c:if>          

            <input type="hidden" name="idTrabajador" value="${trabajador.id}">
            <input type="hidden" name="idOferta" value="${oferta.id}"><br><br>
            <input class="btn btn-primary" type="submit" name="Confirmar" value="Contratar trabajador">


        </form>

                </div>

            </div>



        </div>
            
            <c:import url="../EstiloMenu/piePagina.jsp"></c:import>


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

    </body>
</html>
