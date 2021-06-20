<%-- 
    Document   : nuevaOferta
    Created on : 17-may-2021, 20:30:12
    Author     : daniel
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>
            <title>Nueva oferta</title>
        </head>
        <body>
        <c:import url="../Menu/menuEmpresa.jsp"></c:import>
        <c:set var="hoy" value="<%=new Date()%>"/>





        <div class="container mt-4">

            <div class="row">

                <div class="col-12 text-center" style="font-weight: bold; font-size: 200%;">

                    <p>Aquí puedes añadir una nueva oferta</p>

                </div>

            </div>

        </div>


        <div class="container mt-3 bg-light p-3">


            <div class="row mb-4">

                <div class="col-12 col-md-8 offset-md-2">



                    <form method="POST" action="NuevaOferta">
                        
                        <div class="form-group">
                            
                            
                        <label for="fechaInicio">Fecha de inicio:</label>
                        <input class="form-control" id="fechaInicio" name="fechaInicio" type="date" min="<fmt:formatDate pattern="yyyy-MM-dd" value="${hoy}"></fmt:formatDate>"><br>
                            
                        </div>
                        
                        <div class="form-group">
                            
                            
                            <label for="fechaFin">Fecha de fin</label>
                            <input class="form-control" name="fechaFin" id="fechaFin" type="date" min="<fmt:formatDate pattern="yyyy-MM-dd" value="${hoy}"></fmt:formatDate>"><br>
                        </div>
                        
                        <div class="form-group">
                            
                        <label for="salario">Salario</label>
                        <input class="form-control" type="number" name="salario" id="salario" min="0"><br>

                        </div>
                        
                        <div class="form-group">
                             <label for="vacantes">Vacantes</label>
                             <input class="form-control" name="vacantes" id="vacantes" type="number" min="1"><br>
                        </div>
                        
                        <div class="form-group">
                            
                        <label for="descripcion">Añade una descripción</label>
                        <textarea class="form-control" name="descripcion" id="descripcion" rows="4" cols="50">
                
                        </textarea>
                        </div>
                        
                        <div class="form-group">
                            <input class="form-control btn btn-primary mt-3" type="submit" name="enviar" value="Registrar Oferta">
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
