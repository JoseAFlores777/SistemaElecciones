

<%
    if (session.getAttribute("credencial") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>

<h1>entraste</h1>