<%-- 
    Document   : perfil
    Created on : 14-abr-2021, 16:39:45
    Author     : daniel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>
            <title>Mi perfil</title>
        </head>
        <body>

        <c:import url="../Menu/menuTrabajador.jsp"></c:import>


            <div class="container mt-4">

                <div class="row">

                    <div class="col-12">

                        <h2 class="text-center">${trabajador.nombre}, este es tu perfil</h2>

                </div>


                <div class="row mt-4">

                    <div class="col-12 col-md-8 offset-md-2">

                        <div class="container bg-white p-3" style="border-radius:10px;">


                            <div class="row">

                                <div class="col-3 col-md-3">

                                    <img style="width:100%;" src="../Imagenes/trabajador.png" alt="img">

                                </div>

                                <div class="col-12 col-md-9">

                                    <p>${trabajador.descripcion}</p>
                                    <p>DNI: ${trabajador.dni}</p>
                                    <p>Fecha de nacimiento: <fmt:formatDate pattern="dd-MM-yyyy" value="${trabajador.fechaNacimiento}"/> </p>
                                    <p>Telefono: ${trabajador.telefono}</p>
                                    <p>Carnet: ${trabajador.tipoCarnet}</p>

                                    <p>Valoracion media:  
                                        <c:choose>
                                            <c:when test="${trabajador.valoracion.size() > 0}">
                                            ${trabajador.valoracionMedia()}
                                        </c:when>

                                        <c:when test="${trabajador.valoracion.size() == 0}">
                                            No tienes valoraciones
                                        </c:when>
                                    </c:choose>

                                    </p>
                                    
                                    <p>
                                        <a class="btn btn-primary" style="float:right;" href="modificarDatos.jsp">Modificar datos</a>
                                    </p>
                                </div>


                            </div>



                        </div>


                    </div>


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
