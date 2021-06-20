<%-- 
    Document   : solicitudTrabajador
    Created on : 30-may-2021, 22:42:19
    Author     : daniel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="gestion" class="Gestion.Gestion"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <c:import url="EstiloMenu/estiloMenu.jsp"></c:import>
            <title>Registro trabajador</title>
        </head>
        <body>




            <nav class="container  text-center">

                <div class="row">
                    <div class="col mt-2">

                        <img style="width: 25%" class="rounded-circle" src="Imagenes/encabezado.jpg">
                    </div>
                </div>
            </nav>

            <section class="container bg-muted" style="margin-top: 3%;font-family: 'Lexend Mega', sans-serif;">
                <h1 class="text-center display-4">Registro de trabajador</h1>
            </section>

            <section class="container" style="margin-top: 3%;">

                <div class="row ">
                    <div class="col col-md-4 border bg-light border-primary p-3 offset-md-4" style="border-radius:10px;">

                        <form method="POST" action="NuevaSolicitud">
                            
                            <div class="form-group"> 
                            <label for="dni">DNI</label>
                            <input class="form-control" type="text" maxlength="9" name="dni" required>
                            </div>
                            
                            
                            <div class="form-group">
                                 
                            <label for="nombre">Nombre</label>
                            <input class="form-control" type="text" maxlength="50" name="nombre" required>
                            
                            </div>
                            
                            <div class="form-group">
                             <label for="fechaNacimiento">Fecha de nacimiento</label>
                             <input class="form-control" type="date" name="fechaNacimiento" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="telefono">Telefono</label>
                                <input class="form-control" type="text" maxlength="9" name="telefono" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input class="form-control" type="email" name="email">
                            </div>
                            
                            <div class="form-select">
                                <label for="ciudad">Ciudad</label>
                                <select class="form-control" name="ciudad" required>

                            <c:forEach var="ciudad" items="${gestion.obtenerCiudades()}">

                                <option value="${ciudad}">${ciudad}</option>

                            </c:forEach>

                        </select>
                            </div>
                            
                            <div class="form-select">
                                <label for="tipoCarnet"></label>
                                <select class="form-control" name="tipoCarnet" required>
                            <option value="AM">AM - Ciclomotor</option>
                            <option value="B">B - Coche
                        </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="descripcion">Descripcion</label>
                                <textarea class="form-control" name="descripcion" rows="4" cols="50"></textarea>
                            </div>
                            
                            <div class="form-group">
                                <label for="password">Contraseña</label>
                                <input class="form-control" type="password" name="pass" maxlength="15" minlength="5" required>
                            </div>
                            
                            <div class="form-group">
                                <label>Confirme la contraseña</label>
                                <input class="form-control" type="pass" name="confirmacionPass" maxlength="15" minlength="5" required>
                            </div>
                            
                            <div class="form-group">
                                <input class="form-control btn btn-primary" style="float:right;" type="submit" name="submit" value="Confirmar registro">
                            </div>
                            
                            
                        
                    </form>



                    <br>
                    <br>
                    <a href="login.jsp">Volver</a><br>


                </div>

            </div>

            <c:if test="${!empty error}">
                <div class="container-fluid mt-4">
                    <div class="col col-md-4 offset-md-4 text-center">
                        <div class="alert alert-danger">

                            <c:out value="${error}"></c:out>

                            </div>
                        </div>
                    </div>

            </c:if>

        </section>

        <c:import url="EstiloMenu/piePagina.jsp"></c:import>

    </body>
</html>
