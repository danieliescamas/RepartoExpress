<%-- 
    Document   : index
    Created on : 14-jun-2021, 16:09:05
    Author     : daniel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <c:import url="../EstiloMenu/estiloMenu.jsp" />
        <title>Login - Admin</title>
    </head>
    <body>
        
        
        
        <section class="container" style="margin-top: 3%;">

            <div class="row ">
                
                <div class="col-12 col-md-6 border p-3 offset-md-3">
                    <h2 class="text-center">Administración</h2>
                </div>
                
                <div class="col-12 col-md-4 border bg-light border-primary p-3 offset-md-4" style="border-radius:10px;">
                    
                <form action="LoginAdmin" metohd="POST">
            
            <div class="form-group">
                <label for="usuario">Usuario</label>
                <input class="form-control" name="usuario" type="text">
            </div>
                    <br>
            <div class="form-group">
                <label for="pass">
                    Contraseña
                </label>
                
                <input class="form-control" type="password" name="pass">
            </div><br>
            
            <div class="form-group">
                <input class="btn btn-dark form-control" type="submit" style="color:white;" value="Entrar">
            </div>
                
            
            
        </form>
        

                </div>

            </div>
            

        </section>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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
