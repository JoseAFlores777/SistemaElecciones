<table id="example" class="display" style="width:100%">
    <thead>
        <tr>
            <th style="width:5%;">#</th>
            <th style="width:15%">DNI</th>
            <th style="width:35%;">Nombre</th>
            <th style="width:10%;">#Mesa</th>
            <th style="width:15%;">Estado de Votaci�n</th>

            <th class="d-none d-md-table-cell" style="width:10%">Estado</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>




    <c:forEach var="Magistrado" items="${Magistrados}" varStatus="status" >
        <tr>
            <td>${status.count}</td>
            <td>${Magistrado.getId_Persona()}</td>

            <td>
                <img src="${pageContext.request.contextPath}/Imagenes/${Magistrado.getFoto()}" width="48" height="48" class="rounded-circle mr-2" alt="Avatar"> ${Magistrado.primer_Nombre} ${Magistrado.segundo_Nombre} ${Magistrado.tercer_Nombre} ${Magistrado.primer_Apellido} ${Magistrado.segundo_Apellido}
            </td>


            <td>Mesa ${Magistrado.getId_Mesa()}</td>

        <c:if test="${Magistrado.getEstadoVoto_Des()=='Inhabilitado'}">
            <td><span class="badge bg-secondary" >${Magistrado.getEstadoVoto_Des()}</span></td>
        </c:if>
        <c:if test="${Magistrado.getEstadoVoto_Des()=='Habilitado'}">
            <td><span class="badge bg-primary" >${Magistrado.getEstadoVoto_Des()}</span></td>
        </c:if>
        <c:if test="${Magistrado.getEstadoVoto_Des()=='Ya Vot�'}">
            <td><span class="badge bg-success" >${Magistrado.getEstadoVoto_Des()}</span></td>
        </c:if>
        <c:if test="${Magistrado.getEstadoVoto_Des()=='No Vot�'}">
            <td><span class="badge bg-danger" >${Magistrado.getEstadoVoto_Des()}</span></td>
        </c:if>

        <c:if test="${Magistrado.getEstadoDes()=='Activo'}">
            <td class="d-none d-md-table-cell" ><span class="badge bg-success" >${Magistrado.getEstadoDes()}</span></td>
        </c:if>
        <c:if test="${Magistrado.getEstadoDes()=='Inactivo'}">
            <td class="d-none d-md-table-cell" ><span class="badge bg-secondary" >${Magistrado.getEstadoDes()}</span></td>
        </c:if>


        <td class="table-action">
            <a href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idPersona=${Magistrado.getId_Persona()}" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></a>
            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></a>
        </td>
        </tr>


    </c:forEach>




</tbody>
</table>