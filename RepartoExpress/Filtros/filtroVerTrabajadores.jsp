
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<c:choose>
   
    <c:when test="${not empty param.nombre && empty param.ciudad}">
        
        <c:forEach var="trabajador" items="${gestion.trabajadoresNombre(param.nombre)}">
            
            <div class="col-12 col-md-8 offset-md-2 border border-primary p-3 columnas">
				
               <h3 class="text-center">${trabajador.nombre}</h3>
                
                <p>${trabajador.descripcion}</p>
                <p>Ciudad: ${trabajador.ciudad}</p>
                <p>Tipo de carnet: ${trabajador.tipoCarnet}</p>
                <p>Valoracion: 
                
                 <c:choose>
                <c:when test="${trabajador.valoracion.size() > 0}">
                <td>${trabajador.valoracionMedia()}</td>
                </c:when>
                
                <c:when test="${trabajador.valoracion.size() == 0}">
                <td>No tiene valoraciones</td>
                </c:when>
                </c:choose></p>
                 <form method="POST" action="CargarTrabajador">

                 <input name="id" type="hidden" value="${trabajador.id}">
                 <input class="btn btn-primary" style="float:right;" type="submit" name="perfil" value="Ver perfil">
                </form>
                
            
                
            </div>
            
            
        </c:forEach>
        
    </c:when>
    
    <c:when test="${not empty param.nombre && not empty param.ciudad}">
        
        <c:forEach var="trabajador" items="${gestion.trabajadoresNombreCiudad(param.nombre, param.ciudad)}">
            
            <div class="col-12 col-md-8 offset-md-2 border border-primary p-3 columnas">
                
               
            
        <h3 class="text-center">${trabajador.nombre}</h3>
                
                <p>${trabajador.descripcion}</p>
                <p>Ciudad: ${trabajador.ciudad}</p>
                <p>Tipo de carnet: ${trabajador.tipoCarnet}</p>
                <p>Valoracion: 
                
                 <c:choose>
                <c:when test="${trabajador.valoracion.size() > 0}">
                <td>${trabajador.valoracionMedia()}</td>
                </c:when>
                
                <c:when test="${trabajador.valoracion.size() == 0}">
                <td>No tiene valoraciones</td>
                </c:when>
                </c:choose></p>
                 <form method="POST" action="CargarTrabajador">

                 <input name="id" type="hidden" value="${trabajador.id}">
                 <input class="btn btn-primary" style="float:right;" type="submit" name="perfil" value="Ver perfil">
                </form>
                
                
               
                
            </div>
            
            
            
            
            
            
        </c:forEach>
        
        
    </c:when>
    
    <c:when test="${not empty param.misTrabajadores}">
        
        <c:forEach var="trabajador" items="${gestion.misTrabajadores(empresa)}">
            
            <div class="col-12 col-md-8 offset-md-2 border border-primary p-3 columnas">
	
            
                <h3 class="text-center">${trabajador.nombre}</h3>
                
                <p>${trabajador.descripcion}</p>
                <p>Ciudad: ${trabajador.ciudad}</p>
                <p>Tipo de carnet: ${trabajador.tipoCarnet}</p>
                <p>Valoracion: 
                
                 <c:choose>
                <c:when test="${trabajador.valoracion.size() > 0}">
                <td>${trabajador.valoracionMedia()}</td>
                </c:when>
                
                <c:when test="${trabajador.valoracion.size() == 0}">
                <td>No tiene valoraciones</td>
                </c:when>
                </c:choose></p>
                 <form method="POST" action="CargarTrabajador">

                 <input name="id" type="hidden" value="${trabajador.id}">
                 <input class="btn btn-primary" style="float:right;" type="submit" name="perfil" value="Ver perfil">
                </form>
                
                
               
                
            </div>
            
            
        </c:forEach>
        
    </c:when>
</c:choose>