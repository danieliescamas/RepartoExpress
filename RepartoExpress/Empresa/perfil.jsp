<%-- 
    Document   : perfil
    Created on : 16-may-2021, 14:27:40
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>

        <title>${empresa.nombre}</title>
    </head>
    <body>
        
        <c:import url="../Menu/menuEmpresa.jsp"></c:import>
        
        
            <div class="container mt-4">

                <div class="row">

                    <div class="col-12">

                        <h2 class="text-center">${empresa.nombre}, este es tu perfil</h2>

                </div>


                <div class="row mt-4">

                    <div class="col-12 col-md-8 offset-md-2">

                        <div class="container bg-white p-3" style="border-radius:10px;">


                            <div class="row">

                                <div class="col-3 col-md-3">

                                    <img style="width:100%;" src="../Imagenes/empresa.png" alt="img">

                                </div>

                                <div class="col-12 col-md-9">

                                    <p>${empresa.descripcion}</p>
                                    <p>CIF: ${empresa.cif}</p>
                                    <p>Telefono: ${empresa.telefono}</p>
                                    <p>Email: ${empresa.email}</p>
                                    
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
