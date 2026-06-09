<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.MovimientoStockDAO" %>
<%@page import="Modelo.MovimientoStock" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../CSS/tablas.css"/>

        <link rel="stylesheet" href="../CSS/gen_administracion.css"/>
        <link rel="stylesheet" href="../CSS/footerr.css"/>
        <link rel="stylesheet" href="../CSS/header.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <script src="../miHeader.js"></script>
        <script src="../miFooter.js"></script>
        <title>Historial</title>
    </head>
    <crear-header></crear-header>
    <body>
    
        <%
            out.print("<h1>Historial del sistema</h1>");
            MovimientoStockDAO msdao = new MovimientoStockDAO();
            List <MovimientoStock> movs = new ArrayList<>();

            if (request.getParameter("ver") ==  null) {
            %>
            <script>
                alert('Acceso inválido a la página');
            </script>
           
            <%
                }
                movs = msdao.buscarTodo();
                if (!movs.isEmpty()) {
            %>

            <script>
                alert('Mostrando historial');
            </script>

            <%
                    out.print("<table border='1'>");

                    out.print("<tr>");
                    out.print("<th>ID</th>");
                    out.print("<th>Cantidad</th>");
                    out.print("<th>Tipo</th>");
                    out.print("<th>Fecha</th>");
                    out.print("<th>ID producto</th>");
                    out.print("<th>ID usuario</th>");
                    out.print("</tr>");

                    for (MovimientoStock ms : movs) {
                        out.print("<tr>");
                        out.print("<td>"+ms.getIdMovimientoStock()+"</td>");
                        out.print("<td>"+ms.getCantidad()+"</td>");
                        out.print("<td>"+ms.getTipo()+"</td>");
                        out.print("<td>"+ms.getFecha()+"</td>");
                        out.print("<td>"+ms.getIdProducto()+"</td>");
                        out.print("<td>"+ms.getIdUsuario()+"</td>");
                        out.print("</tr>");
                    }

                    out.print("</table>");

                } else {
            %>

            <script>
                alert('No hay movimientos en la base de datos');
            </script>

            <%
                
            }
            %>
    
    </body>
    <crear-footer></crear-footer>
</html>
