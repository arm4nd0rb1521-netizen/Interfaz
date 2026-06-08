package DAO;

import Modelo.Proveedor;
import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProveedorDAO {
    
    public boolean insertar(Proveedor p) {
        Connection con = null;
        PreparedStatement ps = null;
        
        try {

            con = Conexion.getConexion();

            String sql =
                "INSERT INTO proveedor(nombre, telefono, grupo) " +
                "VALUES(?,?,?)";

            ps = con.prepareStatement(sql);

            ps.setString(1, p.getNombre());
            ps.setString(2, p.getTelefono());
            ps.setString(3, p.getGrupo());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try { if (ps != null) ps.close(); } catch(Exception e) {}
            try { if (con != null) con.close(); } catch(Exception e) {}
        }
    }
    
    public boolean eliminar(int id) {
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = Conexion.getConexion();
            
            String sql = "DELETE  FROM proveedor WHERE id_proveedor = ?";
            
            ps = con.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            return ps.executeUpdate() > 0;
            
        } catch(Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try { if (ps != null) ps.close(); } catch(Exception e) {}
            try { if (con != null) con.close(); } catch(Exception e) {}
        }
    }
    
    public Proveedor buscarUno(int id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Proveedor p = null;

        try {

            con = Conexion.getConexion();

            String sql = "SELECT * FROM proveedor WHERE id_proveedor = ?";
            
            ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            rs = ps.executeQuery();

            if(rs.next()) {

                p = new Proveedor();

                p.setIdProveedor(rs.getInt("id_proveedor"));
                p.setNombre(rs.getString("nombre"));
                p.setTelefono(rs.getString("telefono"));
                p.setGrupo(rs.getString("grupo"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { if (ps != null) ps.close(); } catch(Exception e) {}
            try { if (con != null) con.close(); } catch(Exception e) {}
            try { if (rs != null) rs.close(); } catch(Exception e) {}
        }

        return p;
    }
    
     public ArrayList<Proveedor> buscarTodo() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
         ArrayList<Proveedor> lista = new ArrayList<>();

        try {

            con = Conexion.getConexion();

            st = con.createStatement();

            rs = st.executeQuery("SELECT * FROM proveedor;");

            while(rs.next()) {

                Proveedor p =
                    new Proveedor();

                p.setIdProveedor(
                    rs.getInt("id_proveedor")
                );

                p.setNombre(
                    rs.getString("nombre")
                );

                p.setTelefono(
                    rs.getString("telefono")
                );

                p.setGrupo(
                    rs.getString("grupo")
                );

                lista.add(p);
            }

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try { if (con != null) con.close(); } catch(Exception e) {}
            try { if (st != null) st.close(); } catch(Exception e) {}
            try { if (rs != null) rs.close(); } catch(Exception e) {}
        }

        return lista;
    }
     
     public boolean actualizar(Proveedor p) {
        Connection con = null;
        PreparedStatement ps = null;
         
         try {

            con = Conexion.getConexion();

            String sql =
                "UPDATE proveedor  " +
                "SET nombre = ?, " +
                "telefono = ?, " +
                "grupo = ?  " +
                "WHERE id_proveedor = ?";

            ps = con.prepareStatement(sql);

            ps.setString(1, p.getNombre());
            ps.setString(2, p.getTelefono());
            ps.setString(3, p.getGrupo());
            ps.setInt(4, p.getIdProveedor());

            return ps.executeUpdate() > 0;
            
        } catch(Exception e) {

            e.printStackTrace();
            return false;
        } finally {
            try { if (ps != null) ps.close(); } catch(Exception e) {}
            try { if (con != null) con.close(); } catch(Exception e) {}
        }
    }
     
}
