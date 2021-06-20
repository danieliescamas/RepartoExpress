<%-- 
    Document   : filtroVerEmpresas
    Created on : 21-abr-2021, 11:16:40
    Author     : daniel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<c:if test="${empty param.ciudad}">
    
    <%-- El trabajador no ha introducido ninguna ciudad, buscamos todas las empresas que contengan la cadena de caracteres introducida--%>
    
    <c:forEach var="empresa" items="${gestion.empresasNombre(param.nombre)}">
        
        <div class="col-12 col-md-8 offset-md-2 rounded border border-primary p-3 mb-4">
            <h2 class="text-center">${empresa.nombre}</h2>
            <p>${empresa.descripcion}</p>
            <p>${empresa.ciudad}</p>
            <p>Teléfono: ${empresa.telefono}</p>
            <p>Email: ${empresa.email}</p>
            <p>${empresa.nombre} tiene ${empresa.ofertas.size()} ofertas actuales</p>
            <div>
                <form action="ofertasEmpresa.jsp" method="POST">
                    <input type="hidden" name="id" value="${empresa.id}">
                    <input class="btn btn-primary" style="float:right;" type="submit" name="ver" value="Ver ofertas"> 
                </form>
            </div>
        </div>
    </c:forEach>
    
</c:if>
    
    
    

<c:if test="${!empty param.ciudad}">
    
    <%-- El trabajador ha introducido ninguna ciudad, buscamos todas las empresas con ese nombre--%>
    
    <c:forEach var="empresa" items="${gestion.empresasNombreCiudad(param.nombre, param.ciudad)}">
        
       
        <div class="col-12 col-md-8 offset-md-2 rounded border border-primary p-3 mb-4">
            <h2 class="text-center">${empresa.nombre}</h2>
            <p>${empresa.descripcion}</p>
            <p>${empresa.ciudad}</p>
            <p>Teléfono: ${empresa.telefono}</p>
            <p>Email: ${empresa.email}</p>
            <p>${empresa.nombre} tiene ${empresa.ofertas.size()} ofertas actuales</p>
            <div>
                <form action="ofertasEmpresa.jsp" method="POST">
                    <input type="hidden" name="id" value="${empresa.id}">
                    <input class="btn btn-primary" style="float:right;" type="submit" name="ver" value="Ver ofertas"> 
                </form>
            </div>
        </div>
    </c:forEach>
    
    
</c:if>    
    