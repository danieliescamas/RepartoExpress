<%-- 
    Document   : notificaciones
    Created on : 28-may-2021, 15:56:00
    Author     : daniel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <c:import url="../EstiloMenu/estiloMenu.jsp"></c:import>
            <title>Notificaciones</title>
        </head>

        <body>

        <c:import url="../Menu/menuTrabajador.jsp"></c:import>


            <div class="container">


                <div class="row">

                    <div class="col-12 col-md-8 offset-md-2 mb-3 mt-3">

                        <h2 class="text-center">${trabajador.nombre}, aquí tienes tus notificaciones... </h2>
                    </button>

                </div>

            </div>



                    <div class="row bg-white p-4" style="border-radius:10px;">
                
                <div class="col-12 col-md-8 offset-md-2 columnas">
                <div class="accordion accordion-flush" id="accordionFlushExample">
                    <c:forEach var="notificacion" items="${gestion.notificacionesOrdenadas(trabajador.notificaciones)}">

                        <div class="accordion-item mb-3"

                             <c:choose>

                                 <c:when test="${notificacion.tipo eq 'Nuevo Contrato'}">
                                     style="background-color:  #a7ff5d;"
                                 </c:when>

                                 <c:when test="${notificacion.tipo eq 'Rechazo'}">
                                     style="background-color:  #fe6e6e;"
                                 </c:when>

                                 <c:otherwise>
                                     style="background-color:  #ffdf74;"
                                 </c:otherwise>
                             </c:choose>



                             >
                            <h2 class="accordion-header" id="flush-heading${notificacion.id}">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${notificacion.id}" aria-expanded="false" aria-controls="flush-collapse${notificacion.id}">
                                    ${notificacion.tipo}
                                </button>
                            </h2>
                            <div id="flush-collapse${notificacion.id}" class="accordion-collapse collapse" aria-labelledby="flush-heading${notificacion.id}" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    ${notificacion.descripcion}
                                </div>
                            </div>
                        </div>    

                    </c:forEach>
                </div>

            </div>
            </div>


        </div>		

                            <c:import url="../EstiloMenu/piePagina.jsp"></c:import>



        ${gestion.marcarLeidas(trabajador.notificaciones)}
    </body>
</html>
