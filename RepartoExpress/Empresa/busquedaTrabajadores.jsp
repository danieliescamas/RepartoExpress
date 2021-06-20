<%-- 
    Document   : busquedaTrabajadores
    Created on : 28-may-2021, 23:18:33
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Búsqueda trabajadores</title>
        
        <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>
        
        
         <script>
            function filtrar() {
                
                var nombre = document.getElementById('nombre').value;
                var select = document.getElementById('ciudad');
                var ciudad = select.options[select.selectedIndex].value;
                
                
                if(ciudad === 'cualquiera'){
                    
                    //No ha seleccionado ninguna ciudad, por lo que se enviará solo el parametro nombre
                    // y se hará una búsqueda por nombre general
                     $.ajax({
                    method: "POST",
                    url: "../Filtros/filtroVerTrabajadores.jsp",
                    data: {nombre: nombre}
                    })
                        .done(function (listado) {
                            $("#listado").html(listado);
                        });
                    
                    
                    
                    
                    
                }else{
                    
                    //Ha seleccionado una ciudad, buscaremos solo la empresa en esa ciudad
                   $.ajax({
                    method: "POST",
                    url: "../Filtros/filtroVerTrabajadores.jsp",
                    data: {nombre: nombre,
                           ciudad: ciudad}
                    })
                        .done(function (listado) {
                            $("#listado").html(listado);
                        });
                    
                }
                
            }
            
            function misTrabajadores(){
                
                  $.ajax({
                    method: "POST",
                    url: "../Filtros/filtroVerTrabajadores.jsp",
                    data: {misTrabajadores: true}
                    })
                        .done(function (listado) {
                            $("#listado").html(listado);
                        });
                
            }
        </script>
    </head>
    <body>
       
        <c:import url="../Menu/menuEmpresa.jsp"></c:import>
        
        
        
        <div class="container mt-4 border">
            
            <div class="row">
                 
                <div class="col-12 text-center" style="font-weight: bold; font-size: 200%;">
                    
                    <p>Aquí puedes buscar el perfil de los trabajadores...</p>
                    
                </div>
                
            </div>
            
        </div>
        
        
        <div class="container mt-4 bg-light " style="border-radius: 10px;">
            
            
            <div class="row mb-4">
					
                <div class="col-12 col-md-8 offset-md-2 p-4" style="border-radius:10px;">
                        <div class="form-group">
                            
                            <label for="nombre">Nombre</label>
                            
                            <input class="form-control" type="text" id="nombre" name="nombre" onkeyup="filtrar()">
                            
                        </div>
                        
                        <div class="form-group">
                            
                            <label for="ciudad">Ciudad</label>
                            <select class="form-select" id="ciudad" name="ciudad">
                        <option value="cualquiera">Todas la ciudades</option>
        
                        <c:forEach var="ciudad" items="${gestion.obtenerCiudades()}">
            
                        <option value="${ciudad}"> ${ciudad}</option>
                
                        </c:forEach>
                        </select>
                        </div>
                        
                        <div class="form-group mt-3">
                            
                            <button name="boton" class="form-control btn btn-primary" onclick="misTrabajadores()">
                        Trabajadores que han trabajado en mi empresa
                        </button>
        
                
                        </div>
                        
        
                    </div>
						
            </div>
					
					
					
            <div id="listado" class="row">
					
					
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
