<%-- 
    Document   : verEmpresas
    Created on : 21-abr-2021, 11:16:07
    Author     : daniel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>Buscador de empresas</title>
        
        
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
                    url: "../Filtros/filtroVerEmpresas.jsp",
                    data: {nombre: nombre}
                    })
                        .done(function (listado) {
                            $("#listadoEmpresas").html(listado);
                        });
                    
                    
                    
                    
                    
                }else{
                    
                    //Ha seleccionado una ciudad, buscaremos solo la empresa en esa ciudad
                   $.ajax({
                    method: "POST",
                    url: "../Filtros/filtroVerEmpresas.jsp",
                    data: {nombre: nombre,
                           ciudad: ciudad}
                    })
                        .done(function (listado) {
                            $("#listadoEmpresas").html(listado);
                        });
                    
                }
                
            }
        </script>
        
        
        
    </head>
    <body>
        <c:import url="../Menu/menuTrabajador.jsp"></c:import>
        
        
        
        <div class="container mt-4">
            
            <div class="row">
                 
                <div class="col-12 text-center" style="font-weight: bold; font-size: 200%; color: #0275d8">
                    
                    <p>Buscador de empresas</p>
                    
                </div>
                
            </div>
            
        </div>
        
        
        
        <div class="container bg-white mt-2" style="border-radius: 10px">  
            
            <div class="row">
					
		<div class="col-12 offset-md-2 col-md-8 bg-white p-3" >
				
                    
                    <p>Introduce el nombre</p>
                    <input type="text" id="nombre" name="nombre" onkeyup="filtrar()">
                    <br><br>
                    <p>Seleccione una ciudad</p>
                    <select class="form-select" id="ciudad" name="ciudad">
                    <option value="cualquiera">Todas la ciudades</option>
                    <c:forEach var="ciudad" items="${gestion.obtenerCiudades()}">
            
                    <option value="${ciudad}"> ${ciudad}</option>
                
                    </c:forEach>
                    </select>
                </div>
               
						
            </div>
            
            
            <div id="listadoEmpresas" class="row">
                
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
