<%@page import="DAO.ProveedorDAO" %>
<%@page import="Modelo.Proveedor" %>
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
                ProveedorDAO pdao = new ProveedorDAO();

                if(request.getParameter("actualizar_prov") != null)  {
                    int id = Integer.parseInt(request.getParameter("id_actualizar"));

                    Proveedor p =  pdao.buscarUno(id);
                    if(p != null) {

                        out.print("<h2>Usuario</h2>");
                        out.print("<table>");
                        out.print("<tr>");

                        out.print("<th>ID</th>");
                        out.print("<th>Nombre</th>");
                        out.print("<th>Apellido</th>");
                        out.print("<th>Contraseña</th>");
                        out.print("<th>Rol</th>");
                        out.print("</tr>");

                        out.print("<tr>");

                        out.print("<td>"+id+"</td>");
                        out.print("<td>"+p.getNombre()+"</td>");
                        out.print("<td>"+p.getTelefono()+"</td>");
                        out.print("<td>"+p.getGrupo()+"</td>");

                        out.print("</tr>");
                        out.print("</table>");
                        out.print("<br><br><br><br>");

                        out.print("<form class='formulario' action='CRUDProveedores.jsp' method='post'>");

                            out.print("<div class='campo'>");
                            out.print("<label>ID</label>");
                            out.print("<input type='text' name='idecin' value='"+id+"' readonly>");
                            out.print("</div>");

                            out.print("<div class='campo'>");
                            out.print("<label>Nombre</label>");
                            out.print("<input type='text' name='nombrecin' value='"+p.getNombre()+"'>");
                            out.print("</div>");

                            out.print("<div class='campo'>");
                            out.print("<label>Telefono</label>");
                            out.print("<input type='text' name='telefonito' value='"+p.getTelefono()+"'>");
                            out.print("</div>");

                            out.print("<div class='campo'>");
                            out.print("<label>Grupo</label>");
                            out.print("<input type='text' name='grupito' value='"+p.getGrupo()+"'>");
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
