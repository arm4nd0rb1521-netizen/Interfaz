package conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    private static final String URL =
        "jdbc:mysql://localhost/myownshop?autoReconnect=true&useSSL=false";

    private static final String USER = "root";
    private static final String PASS = "ces160408";

    public static Connection getConexion() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASS
            );

        } catch(Exception e) {

            System.out.println(
                "Error de conexión: "
                + e.getMessage()
            );

        }

        return con;
    }
}