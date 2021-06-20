<%-- 
    Document   : login
    Created on : 14-abr-2021, 10:52:43
    Author     : daniel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <c:import url="EstiloMenu/estiloMenu.jsp"></c:import>
        <title>Reparto Express </title>
    </head>
    <style>
        
        .registro:hover{
            
            color:white;
            background-color: #0275d8;
            border-radius: 10px;
            padding: 0.5%;
        }
    </style>
    <body>



        <nav class="container  text-center">

            <div class="row">
                <div class="col mt-2">

                    <img style="width: 25%" class="rounded-circle" src="Imagenes/encabezado.jpg">
                </div>
            </div>
        </nav>

        <section class="container bg-muted" style="margin-top: 3%;font-family: 'Lexend Mega', sans-serif;">
            <h1 class="text-center display-4">Bienvenido a Reparto Express</h1>
        </section>

        <section class="container" style="margin-top: 3%;">

            <div class="row ">
                <div class="col col-md-4 border bg-light border-primary p-3 offset-md-4" style="border-radius:10px;">
                    
                    <form method="POST" action="Login">
                        
                        <div class="form-group">
                            
                        <label for="identificacion">DNI / CIF</label>
                        <input class="form-control" id="identificacion" type="text" name="identificacion" required>
    
                        </div>
                        
                        <div class="form-group">
                            
                            
                        <label for="password">Contraseña</label>
                        <input class="form-control" id="password" name="password" type="password" required><br>

                        </div>
                        
                        <div class="form-check">
                            
                            
                        <input class="form-check-input" type="radio" id="trabajador" name="tipo" value="trabajador" required>
                        <label class="form-check-label" for="trabajador">Trabajador</label><br>

                            
                        </div>
                        
                        
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="empresa" name="tipo" value="empresa">
                            <label class="form-check-label" for="empresa">Empresa</label><br>
    
                        </div>
                        
                        
                        
                        <input class="btn btn-primary" style="float:right;" type="submit" id="iniciarSesion" value="Iniciar Sesion">


                    </form>
                    
                    <br>
                    <br>
                    <a class="registro" href="solicitudTrabajador.jsp">Registrarme como trabajador</a><br>
                    <a class="registro" href="solicitudEmpresa.jsp">Registrarme como empresa</a>
                    

                </div>

            </div>
            

        </section>
   
        
    <c:import url="EstiloMenu/piePagina.jsp"></c:import>

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
                text: 'Solicitud enviada, en un plazo de 48 horas recibirás el estado de la solicitud.'
                });
            </script>
        </c:if>


    </body>
</html>
