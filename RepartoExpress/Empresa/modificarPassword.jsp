<%-- 
    Document   : modificarPassword
    Created on : 16-may-2021, 11:51:20
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>

        <title>Modificar pass</title>
    </head>
    <body>
        
        <c:import url="../Menu/menuEmpresa.jsp"></c:import>
        
        
        
                    <div class="container">


                <div class="row">

                    <div class="col-12 col-md-12 mt-4 mb-4">
                        <h2 class="text-center">Aqu� puedes cambiar tu contrase�a...</h2>
                </div>


            </div>

                <div class="row" >

                <div class="col-12 col-md-8 p-3 offset-md-2 bg-white "style="border-radius: 10px;">

                    <form action="ModificarPasswordEmpresa" method="POST">

                        <div class="form-group">

                            <label>Introduce la contrase�a actual</label>
                            <input class="form-control" type="password" name="actual" required>
                        </div>


                        <div class="form-group">
                            <label>Introduce la nueva contras�ea (M�nimo 5 caract�res - M�ximo 15 caract�res)</label>
                            <input class="form-control" type="password" name="nueva">
                        </div>

                        <div class="form-group">
                            <label>Confirme la nueva contrase�a</label>
                            <input class="form-control" type="password" name="confirmacion">    
                        </div>

                        <div class="form-group mt-4">

                            <input class="form-control btn btn-primary" type="submit" name="enviar" value="Confirmar cambios">

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
