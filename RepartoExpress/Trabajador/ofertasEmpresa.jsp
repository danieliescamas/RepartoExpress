<%-- 
    Document   : ofertasEmpresa
    Created on : 21-abr-2021, 13:17:42
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
        <title>${gestion.cargarEmpresa(param.id).nombre}</title>
    </head>
    <body>
        
                <c:import url="../Menu/menuTrabajador.jsp"></c:import>

        
        <div class="container mt-4">
            
            <div class="row">
                 
                <div class="col-12 text-center" style="font-weight: bold; font-size: 200%;">
                    
                    <p>Aquí se muestran las ofertas de ${gestion.cargarEmpresa(param.id).nombre}...<span> </p>
                    
                </div>
                
            </div>
            
        </div>
        
        
        <div class="container mt-4 bg-light p-4">
            		
					
            <div class="row">
                
                <c:forEach var="oferta" items="${gestion.cargarEmpresa(param.id).ofertas}">

            <c:if test="${gestion.ofertaDisponible(oferta.fechaInicio)}">
                <div class="col-12 col-md-8 offset-md-2 rounded border border-primary p-3 mb-4 columnas">
                    

                        <h2 class="text-center">${oferta.empresa.nombre}</h2>
                        <p>
                            ${oferta.descripcion}
                        </p>
                        <p>${oferta.empresa.ciudad}</p>
                        <p>Fecha de inicio: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaInicio}"/></p>
                        <p>Fecha de fin: <fmt:formatDate pattern="dd-MM-yyyy" value="${oferta.fechaFin}"/></p>
                        <p>Salario: ${oferta.salario}</p>
                        <p>Vehiculos de la empresa: ${oferta.empresa.vehiculos.size()}</p>

                        <c:if test="${oferta.empresa.vehiculos.size() > 0}">
                            <button id="verVehiculos" type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#vehiculosModal">
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
                        <input class="btn btn-primary" style="float:right;" type="submit" name="inscripcion" value="Inscribirme en la oferta">
                        </form>


                </div>
            </c:if>

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
