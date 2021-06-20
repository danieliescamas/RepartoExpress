<%-- 
    Document   : modificarPassword
    Created on : 14-abr-2021, 18:14:27
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>
            <title>Cambio password</title>
        </head>
        <body>

        <c:import url="../Menu/menuTrabajador.jsp"></c:import>



            <div class="container">


                <div class="row">

                    <div class="col-12 col-md-12 mt-4 mb-4">
                        <h2 class="text-center">${trabajador.nombre}, puedes cambiar tu contraseña...</h2>
                </div>


            </div>

                <div class="row" >

                <div class="col-12 col-md-8 p-3 offset-md-2 bg-white "style="border-radius: 10px;">

                    <form action="ModificarPasswordTrabajador" method="POST">

                        <div class="form-group">

                            <label>Introduce la contraseña actual</label>
                            <input class="form-control" type="password" name="actual" required>
                        </div>


                        <div class="form-group">
                            <label>Introduce la nueva contrasñea (Mínimo 5 caractéres - Máximo 15 caractéres)</label>
                            <input class="form-control" type="password" name="nueva">
                        </div>

                        <div class="form-group">
                            <label>Confirme la nueva contraseña</label>
                            <input class="form-control" type="password" name="confirmacion">    
                        </div>

                        <div class="form-group mt-4">

                            <input class="form-control btn btn-primary" type="submit" name="enviar" value="Confirmar cambios">

                        </div>


                    </form>

                </div>

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
