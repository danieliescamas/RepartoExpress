<%-- 
    Document   : modificarDatos
    Created on : 16-may-2021, 14:18:27
    Author     : daniel
--%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>

        <title>Modificar datos</title>
    </head>
    <body>
        <c:import url="../Menu/menuEmpresa.jsp"></c:import>



            <div class="container">


                <div class="row">

                    <div class="col-12 col-md-12 mt-4 mb-4">
                        <h2 class="text-center">Modificación de datos...</h2>
                    </div>


                </div>

                <div class="row" >

                    <div class="col-12 col-md-8 p-3 offset-md-2 bg-white "style="border-radius: 10px;">

                        <form action="ModificarDatosEmpresa" method="POST">
                            
                            <div class="form-group">
                                
                                
                            <label for="nombre">Nombre: </label>
                            <input class="form-control" type="text" name="nombre" value="${empresa.nombre}" readonly required>
                                
                            </div>
                            
                            
                            <div class="form-group">
                                
                                
                            <label for="dni">CIF: </label>
                            <input class="form-control" type="text" name="dni" value="${empresa.cif}" readonly required>

                            </div>
                            
                            
                            <div class="form-group">
                                
                            <label for="telefono">Teléfono: </label>
                            <input class="form-control" type="text" name="telefono" value="${empresa.telefono}" required maxlength="9">

                            </div>
                            
                            
                            <div class="form-group">
                                
                            <label for="descripcion">Descripcion:</label>
                            <textarea class="form-control" id="descripcion" name="descripcion" rows="4" cols="50">
                            ${empresa.descripcion}
                            </textarea>
                            </div>
                            
                            
                            <div class="form-group">
                                
                            <input class="form-control mt-4 btn btn-primary" type="submit" name="submit" value="Guardar datos">

                            </div>



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
