<%-- 
    Document   : inscritosOferta
    Created on : 19-may-2021, 20:13:26
    Author     : daniel
--%>

<%@page import="Modelo.entidades.VehiculoParticular"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>
            <title>Inscritos</title>
        </head>
        <body>

        <c:import url="../Menu/menuEmpresa.jsp"></c:import>



            <div class="container mt-4">

                <div class="row">

                    <div class="col-12 text-center" style="font-weight: bold; font-size: 200%;">

                        <p>Gestión de la oferta...</p>

                    </div>

                </div>

            </div>


            <div class="container mt-4 bg-light p-4">


                <div class="row">


                    <div class="col-12 col-md-8 offset-md-2 rounded border border-primary p-3 mb-4 columnas">

                        <h3>
                        <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaInicio}"></fmt:formatDate>
                            -
                        <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaFin}"></fmt:formatDate>
                        </h3>

                        <p>${oferta.descripcion}</p>
                        <p>Salario: ${oferta.salario} &euro;</p>
                    <p>Vacantes: ${oferta.vacantes}</p>
                    <p>Inscritos: ${oferta.numeroInscritos}</p>
                    <p>Aceptados: ${oferta.numeroAceptados}</p>

                </div>

                <c:forEach var="trabajador" items="${trabajadores}">


                    <div class="col-12 col-md-8 offset-md-2 rounded border border-primary p-3 mb-4 columnas">

                        <div class="container">

                            <div class="row">

                                <div class="col-12 col-md-6">

                                    <p>${trabajador.nombre}</p>
                                    <p>Fecha de Nacimiento: <fmt:formatDate pattern="dd-MM-yyyy" value="${trabajador.fechaNacimiento}"/></p>
                                    <p>Ciudad: ${trabajador.ciudad}</p>
                                    <p>Tipo de carnet: ${trabajador.tipoCarnet}</p>
                                    <p>Descripcion: ${trabajador.descripcion}</p>
                                    <p>Vehiculo: <%
                            boolean particular = false;
                            VehiculoParticular vehiculo = null;

                        %>
                        <c:forEach var="vehiculo" items="${oferta.vehiculosParticular}">

                            <c:if test="${vehiculo.propietarioTrabajador eq (trabajador)}">
                                <% particular = true;%>
                            </c:if>

                        </c:forEach>

                        <%

                            if (particular) {

                        %>
                        <c:forEach var="vehiculo" items="${oferta.vehiculosParticular}">

                            <c:if test="${vehiculo.propietarioTrabajador eq (trabajador)}">
                                Particular:  ${vehiculo.tipo}
                            </c:if>

                        </c:forEach>

                        <% } else {

                        %>
                        Empresa
                        <%}%></p>
                                    <p>Valoración media:  <c:choose>
                            <c:when test="${trabajador.valoracion.size() > 0}">
                                ${trabajador.valoracionMedia()}
                            </c:when>

                            <c:when test="${trabajador.valoracion.size() == 0}">
                                No tienes valoraciones
                            </c:when>
                        </c:choose></p>


                                </div>



                                <div class="col-12 col-md-6">
                                    
                                    <form method="POST" action="GestionarSolicitud">
                                        <input type="hidden" name="idOferta" value="${oferta.id}">
                                        <input type="hidden" name="idTrabajador" value="${trabajador.id}">
                                        <input class="btn btn-primary" type="submit" value="Continuar seleccion" name="Aceptar">
                                    </form>
                                        <br>
                                    <form method="POST" action="GestionarSolicitud">
                                        <input type="hidden" name="idOferta" value="${oferta.id}">
                                        <input type="hidden" name="idTrabajador" value="${trabajador.id}">
                                        <input class="btn btn-danger" type="submit" value="Rechazar" name="Rechazar">
                                    </form>    
                                        
                                </div>

                            </div>

                        </div>

                    </div>

                </c:forEach>


            </div>

        </div>

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



                    <c:import url="../EstiloMenu/piePagina.jsp"></c:import>
    </body>
</html>
