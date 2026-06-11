<%@page import="DAO.CategoriaDAO"%>
<%@page import="Modelo.Categoria" %>
<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8">

    <title>Actualizar Proveedor</title>

    <link rel="stylesheet" href="../CSS/gen_logistica.css"/>
    <link rel="stylesheet" href="../CSS/tablas.css"/>
    <link rel="stylesheet" href="../CSS/formularios _Actualizar.css"/>
    <link rel="stylesheet" href="../CSS/footerr.css"/>
    <link rel="stylesheet" href="../CSS/header.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="../miHeader.js"></script>
    <script src="../miFooter.js"></script>
</head>

    <body>
<crear-header></crear-header>        
        <%
            try {
                CategoriaDAO cdao = new CategoriaDAO();

                if(request.getParameter("actualizar") != null)  {
                    int id = Integer.parseInt(request.getParameter("id_actualizar"));

                    Categoria c =  cdao.buscarUno(id);
                    if(c != null) {

                        out.print("<h2>Categoria</h2>");
                        out.print("<table>");
                        out.print("<tr>");

                        out.print("<th>ID</th>");
                        out.print("<th>Nombre</th>");
                        out.print("<th>Descripcion</th>");

                        out.print("</tr>");

                        out.print("<tr>");

                        out.print("<td>"+id+"</td>");
                        out.print("<td>"+c.getNombre()+"</td>");
                        out.print("<td>"+c.getDescripcion()+"</td>");

                        out.print("</tr>");
                        out.print("</table>");
                        out.print("<br><br><br><br>");

                        out.print("<form class='formulario' action='CRUDCategoria.jsp' method='post'>");

                            out.print("<div class='campo'>");
                            out.print("<label>ID</label>");
                            out.print("<input type='text' name='idecin' value='"+id+"' readonly>");
                            out.print("</div>");

                            out.print("<div class='campo'>");
                            out.print("<label>Nombre</label>");
                            out.print("<input type='text' name='nombrecin' value='"+c.getNombre()+"'>");
                            out.print("</div>");

                            out.print("<div class='campo'>");
                            out.print("<label>Nombre</label>");
                            out.print("<input type='text' name='desc' value='"+c.getDescripcion()+"'>");
                            out.print("</div>");

                            out.print("<input type='submit' value='Actualizar' name='valida'>");

                            out.print("</form>");

                    }

                }
            } catch(Exception e) {
                %>
                <script>
                    alert('Ocurrio un error inesperado');
                    history.back();
                </script>
                <%
            }
        %>
 <div class="volver">

    <a href="../HTMLs/Proveedores.html">
        Regresar
    </a>

</div>

<crear-footer></crear-footer>
    </body>
</html>
