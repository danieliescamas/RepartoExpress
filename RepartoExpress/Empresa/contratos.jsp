<%-- 
    Document   : contratos
    Created on : 28-may-2021, 15:00:29
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>
        <title>Mis contratos</title>
    </head>
    <body>
        
        <c:import url="../Menu/menuEmpresa.jsp"></c:import>
        

            <div class="container mt-4">


                <div class="row">

                    <div class="col-12"style="font-weight: bold; font-size: 200%;">

                        <h1 class="text-center">Aquí tienes una lista de todos tus contratos...</h1>

                </div>

            </div>



            <div class="row">

                <div class="col-12 col-md-8 offset-md-2 columnas">

                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <c:forEach var="contrato" items="${gestion.ordenarContratos(empresa.contratos)}">

                            <div class="accordion-item bg-white">
                                <h2 class="accordion-header" id="flush-heading${contrato.id}">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${contrato.id}" aria-expanded="false" aria-controls="flush-collapse${contrato.id}">
                                        
                                         <fmt:formatDate pattern="dd-MM-yyyy" value="${contrato.fechaInicio}"/> - <fmt:formatDate pattern="dd-MM-yyyy" value="${contrato.fechaFin}"/>

                                    </button>
                                </h2>
                                <div id="flush-collapse${contrato.id}" class="accordion-collapse collapse" aria-labelledby="flush-heading${contrato.id}" data-bs-parent="#accordionFlushExample">
                                
                                <%-- Datos del contrato --%>
                                
                                <div class="container mt-3 bg-white">
                                    
                                    <div class="row">
                                        
                                        <div class="col-12 col-md-6 mt-2">
                                            
                                            <p>Empresa ${contrato.empresa.nombre}</p>
                                            <p>CIF: ${contrato.empresa.cif}</p>
                                            <p>Ciudad: ${contrato.empresa.ciudad}</p>
                                            <c:if test="${contrato.vehiculo.tipoPropietario eq 'Empresa'}">
                                                <p>Vehiculo: ${contrato.vehiculo.matricula}</p>
                                                <p>Tipo de vehículo: ${contrato.vehiculo.tipo}</p>
                                                <p>Propietario: ${contrato.vehiculo.tipoPropietario}</p>
                                            </c:if>
                                                <p>Salario: ${contrato.salario} &euro;</p>
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
                                        
                                    </div>
                                    
                                </div>
                                
                                </div>
                            </div>

                        </c:forEach>
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

        
        <c:import url="../EstiloMenu/piePagina.jsp"></c:import>
    </body>
</html>
