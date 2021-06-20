<%-- 
    Document   : inscripciones
    Created on : 12-may-2021, 20:18:12
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            #verVehiculos:hover{
                color:white;
                background-color: #0275d8;
            }
        </style>
        <title>Mis inscripciones</title>
        <script>
            
            function enCurso(){
                
                $.ajax({
                    
                    method: "POST",
                    url: "../Filtros/misInscripciones.jsp",
                    data: {disponible: "disponible"}
                    
                })
                    
                    .done(function(listado){
                        
                        $("#listado").html(listado);
                $("#respuesta").html("aquí se muestran tus inscripciones en curso...");
                        
                    });
                
            }
            
            function finalizadas(){
                
                $.ajax({
                    
                    method: "POST",
                    url: "../Filtros/misInscripciones.jsp",
                    data: {finalizadas: "finalizacas"}
                    
                })
                    
                    .done(function(listado){
                        
                        $("#listado").html(listado);
                        $("#respuesta").html("aquí se muestran tus inscripciones finalizadas...");
                        
                    });
                
            }
            
        </script>
        
    </head>
    <body>
        
        <c:import url="../Menu/menuTrabajador.jsp"></c:import>
       <div class="container mt-4">
            
            <div class="row">
                 
                <div class="col-12 text-center" style="font-weight: bold; font-size: 200%; color: #0275d8">
                    
                    <p>${trabajador.nombre}, <span id="respuesta"> aquí se muestran tus inscripciones...<span> </p>
                    
                </div>
                
            </div>
            
        </div>
        
        
        <div class="container mt-4 bg-light">
            
            
            <div class="row mb-4">
					
                    <div class="col-12 col-md-8 offset-md-2">
				
                         <h4 class="text-center">Selecciona una opcion</h4>
                        <button class="btn btn-primary mb-3 mt-3" style="width: 100%; color: white;" onclick="enCurso()">En curso</button>
                        <button class="btn btn-primary" style="width: 100%; color: white;" onclick="finalizadas()">Finalizadas</button>
                
                    </div>
						
            </div>
					
					
					
            <div id="listado" class="row">
					
					
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
