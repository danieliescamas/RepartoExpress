<%-- 
    Document   : perfilTrabajador
    Created on : 29-may-2021, 12:26:27
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

        <title>${trabajador.nombre}</title>
    </head>
    <body>

        <c:import url="../Menu/menuEmpresa.jsp"></c:import>


            <div class="container mt-4">

                <div class="row">

                    <div class="col-12">

                        <h2 class="text-center">Perfil de ${trabajador.nombre}</h2>

                </div>


                <div class="row mt-4">

                    <div class="col-12 col-md-8 offset-md-2">

                        <div class="container bg-white p-3" style="border-radius:10px;">


                            <div class="row border border-primary p-3">

                                <div class="col-3 col-md-3">

                                    <img style="width:100%;" src="../Imagenes/trabajador.png" alt="img">

                                </div>

                                <div class="col-12 col-md-9">

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

                                    </p>

                                    <c:if test="${trabajador.valoracion.size()>0}">
                                        <p>
                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                Ver últimas valoraciones
                                            </button>
                                        </p>


                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Últimas valoraciones de ${trabajador.nombre}</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                       
                                                            <c:forEach var="valoracion" items="${gestion.ultimasValoraciones(trabajador)}">
                                                                
                                                                <p>Valoracion de ${valoracion.contrato.empresa.nombre}</p>
                                                                <p>Puntuacion: ${valoracion.puntuacion}</p>
                                                                <p>Descripcion: ${valoracion.descripcion}</p>

                                                                
                                                            </c:forEach>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Volver</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </c:if>


                                </div>


                            </div>



                            <c:if test="${!empty contratos}">
                                <div class="row mt-2 border border-primary  p-3">
                                    <%-- La empresa puede valorar contratos que ha tenido con el trabajador --%>

                                    <div class="col-12 mt-3">
                                        <h3 class="text-center">Valora a ${contrato.trabajador.nombre}</h3>
                                    </div>

                                    <c:forEach var="contrato" items="${contratos}">

                                        <div class="col-12 col-md-6 mt-2">

                                            <p>Empresa ${contrato.empresa.nombre}</p>
                                            <p>CIF: ${contrato.empresa.cif}</p>
                                            <p>Ciudad: ${contrato.empresa.ciudad}</p>
                                            <c:if test="${contrato.vehiculo.tipoPropietario eq 'Empresa'}">
                                                <p>Vehiculo: ${contrato.vehiculo.matricula}</p>
                                                <p>Tipo de vehículo: ${contrato.vehiculo.tipo}</p>
                                                <p>Propietario: ${contrato.vehiculo.tipoPropietario}</p>
                                            </c:if>
                                            <p>Salario: ${contrato.salario} ?</p>
                                        </div>

                                        <div class="col-12 col-md-6 mt-2">

                                            <p>Trabajador ${contrato.trabajador.nombre}</p>
                                            <p>DNI: ${contrato.trabajador.dni}</p>
                                            <p>Ciudad: ${contrato.trabajador.ciudad}</p>
                                            <p>Fecha de nacimiento: <fmt:formatDate pattern="dd-MM-yyyy" value="${contrato.trabajador.fechaNacimiento}"></fmt:formatDate></p>


                                            <c:if test="${contrato.vehiculo.tipoPropietario eq 'Particular'}">
                                                <p>Vehiculo: ${contrato.vehiculo.matricula}</p>
                                                <p>Tipo de vehículo: ${contrato.vehiculo.tipo}</p>
                                                <p>Propietario: ${contrato.vehiculo.tipoPropietario}</p>
                                            </c:if>
                                        </div>

                                        <div class="col-12 offset-md-2 col-md-8">

                                            <form method="POST" action="NuevaValoracion">

                                                <div class="form-group">
                                                    <label for="puntuacion">Puntuacion</label>
                                                    <input class="form-control" type="number" name="puntuacion" min="0" max="10" required>

                                                </div>
                                                <div class="form-group">
                                                    <label for="descripcion">
                                                        Descripción
                                                    </label>
                                                    <textarea class="form-control" name="descripcion" rows="4" cols="50"></textarea>
                                                </div>

                                                <div class="form-group">
                                                    <input style="float:right;" class="btn btn-primary" type="submit" name="enviar" value="Enviar Valoración">
                                                </div>

                                                <input type="hidden" name="idTrabajador" value="${trabajador.id}">
                                                <input type="hidden" name="idContrato" value="${contrato.id}">



                                            </form>
                                        </div>





                                    </c:forEach>

                                </div>

                            </c:if>






                        </div>


                    </div>


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


    </body>
</html>
