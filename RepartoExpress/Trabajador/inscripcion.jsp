<%-- 
    Document   : inscripcion
    Created on : 09-may-2021, 18:14:19
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>
            <title>Nueva inscripción</title>
        </head>
        <body>

        <c:import url="../Menu/menuTrabajador.jsp"></c:import>


            <div class="container">


                <div class="row">

                    <div class="col-12 col-md-12 mt-4 mb-4">
                        <h2 class="text-center">Registro en una nueva oferta</h2>
                    </div>


                </div>

                <div class="row" >

                    <div class="col-12 col-md-8 p-3 offset-md-2 bg-white "style="border-radius: 10px;">

                        <h2 class="text-center">${oferta.empresa.nombre}</h2>
                        <p>${oferta.descripcion}</p>
                        <p>Fecha de inicio: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaInicio}"></fmt:formatDate></p>
                        <p>Fecha de fin: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaFin}"/></p>
                        <p>Número de vacantes: ${oferta.vacantes}</p>
                        <p>Numero de inscritos: ${oferta.inscripciones.size()}</p>
                        
                        <form action="Inscripcion" method="POST">
                            
                            <div class="form-group">
                                
                                <label class="form-check-label" for="vehiculo">Selecciona un vehículo:</h5>
                                <c:forEach var="vehiculo" items="${trabajador.vehiculos}">
                                
                                <div class="form-check">
                                   
                                    <input class="form-check-input" type="radio" name="vehiculo" value="${vehiculo.id}">
                                    <label class="form-check-label" for="vehiculo">${vehiculo.matricula} - ${vehiculo.tipo}</label>
                                </div>
                                
                                </c:forEach>
                                
                                
                                <div class="form-check">
                                   
                                    <input class="form-check-input" type="radio" name="vehiculo" value="vehiculoEmpresa">
                                    <label class="form-check-label" for="vehiculo">Vehiculo de empresa</label>
                                </div>
                                
                            </div>
                            
                            <div class="form-group">
                                <input class="form-control btn btn-primary" type="submit" value="Inscribirme">

                            </div>

                        <input type="hidden" name="oferta" value="${oferta.id}">
                    
                    </form>



                </div>

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
