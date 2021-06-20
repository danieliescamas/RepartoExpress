<%-- 
    Document   : vehiculos
    Created on : 16-may-2021, 12:19:41
    Author     : daniel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>

        <title>Mis vehículos</title>
    </head>
    <body>
        <c:import url="../Menu/menuEmpresa.jsp"></c:import>
        
        
        
        <h2 class="text-center mt-4">
           Estos son tus vehículos... 
        </h2>
        
        <div class="container">
            
            <div class="row">
                
                <div class="col-12 col-md-8 mb-3 mt-3">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Nuevo vehículo 
                    </button>
                </div>
                
            </div>
                
                
            
        </div>

        <div class="container bg-white" style="border-radius: 10px;">





            <div id="listado" class="row">

                <c:forEach var="vehiculo" items="${empresa.vehiculos}">

                    <div class="col-12 col-md-8 offset-md-2 border border-primary mb-4 mt-4 p-3 bg-white">

                        <div class="container">

                            <div class="row">

                                <div class="col-3 col-md-2">

                                    <c:choose>

                                        <c:when test="${vehiculo.tipo eq 'Coche'}">
                                            <img src="../Imagenes/coche.png" style="width:100%; text-center" alt="imagenCoche">    
                                        </c:when>

                                        <c:when test="${vehiculo.tipo eq 'Moto'}">

                                            <img  src="../Imagenes/moto.png" style="width: 100%" alt="imagenMoto">

                                        </c:when>

                                    </c:choose>

                                </div>

                                <div class="col-12 col-md-6">


                                        <h3>Vehiculo</h3>
                                        <p>Matricula: ${vehiculo.matricula}</p>
                                        <p>Tipo de vehiculo: ${vehiculo.tipo}</p>

                                        <c:if test="${vehiculo.tipo.equals('Coche')}">
                                            <p>Carnet necesario para conducir el vehiculo: B</p>
                                        </c:if>

                                        <c:if test="${vehiculo.tipo.equals('Moto')}">
                                            <p>Carnet necesario para conducir el vehiculo: AM</p>
                                        </c:if>

                                        <form id="eliminar${vehiculo.id}" action="VehiculoEmpresa" method="GET">
                                            <input type="hidden" name="id" value="${vehiculo.id}">
                                            <input type="hidden" name="eliminar" value="true">
                                            <input class="btn btn-primary" type="button" onclick="enviarFormulario(${vehiculo.id})" name="confirmar" value="Eliminar vehiculo">
                                        </form>
                                  
                                </div>

                            </div>

                        </div>

                    </div>

                </c:forEach>

            </div>



        </div>		



<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo vehiculo</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          
          <form method="POST" action="VehiculoEmpresa">
                
                <div class="form-group mb-4">
                                        
                    <label for="matricula">Matricula:</label>
                    <input class="form-control" type="text" name="matricula" maxlength="7" required>

                </div>
                    
                <div class="form-group mb-4">
                    
                    <label for="tipo">Seleccione el tipo de vehiculo</label>
                    <select class="form-control" name="tipo">
                    <option value="Coche">Coche</option>
                    <option value="Moto">Moto</option>
                </select>

                
                </div>
                
                <div class="form-group">
                    
                <input class="form-control btn-primary" type="submit" name="nuevo" value="Registrar vehículo">
                </div>
                </form>
       

          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
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
        
        
        
        
        <%-- SCRIPT --%>
                <script>
                    
                    function nuevo(){
                        
                        var formulario = document.getElementById('nuevo');
                        
                        if(formulario.style.display == 'none'){
                            formulario.style.display = 'block';
                        }else{
                            formulario.style.display='none';
                        }
                        
                    }
                    
                    function enviarFormulario(id){
                        
                        Swal.fire({
                    title: '¿Seguro que quieres eliminar el vehículo??',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Sí, eliminar!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById("eliminar" + id).submit();
                       
                    }
                });
                    }
                </script>
                
                <c:import url="../EstiloMenu/piePagina.jsp"></c:import>
    </body>
</html>
