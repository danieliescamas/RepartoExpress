<%-- 
    Document   : misInscripciones
    Created on : 19-may-2021, 19:43:38
    Author     : daniel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:if test="${!empty param.disponible}">
    
    <c:forEach var="oferta" items="${gestion.ofertasDisponiblesTrabajador(trabajador.id)}">
       
                                        
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
                                         
                                      </div>
                                
                     
    </c:forEach>
    
    
</c:if>
    
    
    
<c:if test="${!empty param.finalizadas}">
        
    <c:forEach var="oferta" items="${gestion.ofertasFinalizadasTrabajador(trabajador.id)}">
       
                                        
                                        <div class="col-12 col-md-8 offset-md-2 rounded border border-primary p-3 mb-4 columnas">
                                            
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
                                         
                                      </div>
                                
                     
    </c:forEach>
    
    
</c:if>    
