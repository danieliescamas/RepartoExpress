<%-- 
    Document   : ofertas
    Created on : 16-may-2021, 17:58:04
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Inicio ${empresa.nombre}</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>

        <script>
            
            function disponibles(){
                
                $.ajax({
                    
                    method: "POST",
                    url: "../Filtros/filtroOfertasEmpresa.jsp",
                    data: {disponible: "disponible"}
                    
                })
                    
                    .done(function(listado){
                        
                        $("#listadoOfertas").html(listado);
                        
                    });
                
            }
            
            function finalizadas(){
                
                $.ajax({
                    
                    method: "POST",
                    url: "../Filtros/filtroOfertasEmpresa.jsp",
                    data: {finalizadas: true}
                    
                })
                    
                    .done(function(listado){
                        
                        $("#listadoOfertas").html(listado);
                        
                    });
                
            }
            
        </script>
        
        
        
    </head>
    <body>
        <c:import url="../Menu/menuEmpresa.jsp"></c:import>
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

            
            
            <div class="container mt-4">
            
            <div class="row">
                 
                <div class="col-12 text-center" style="font-weight: bold; font-size: 200%;">
                    
                    <p>Aquí se muestran tus ofertas...<span> </p>
                    
                </div>
                
            </div>
            
        </div>
        
        
        <div class="container mt-4 bg-light">
            
            
            <div class="row mb-4">
					
                    <div class="col-12 col-md-8 offset-md-2 p-3">
				
                         <h4 class="text-center">Selecciona una opcion</h4>
                        <button class="btn btn-primary mb-3 mt-3" style="width: 100%; color: white;" onclick="disponibles()">Ofertas disponibles</button>
                        <button class="btn btn-primary" style="width: 100%; color: white;" onclick="finalizadas()">Ofertas finalizadas</button>
                
                    </div>
						
            </div>
					
					
					
            <div id="listadoOfertas" class="row">
					
					
            </div>
					
        </div>
       
        <c:import url="../EstiloMenu/piePagina.jsp"></c:import>
    </body>
</html>
