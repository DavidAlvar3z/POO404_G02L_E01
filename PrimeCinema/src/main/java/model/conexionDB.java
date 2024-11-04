package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexionDB {
    // URL de conexión con el puerto y el nombre de la base de datos
    private static final String DB_URL = "jdbc:mysql://localhost:3306/primecinema_";
    private static final String DB_USER = "root"; // Usuario de la base de datos
    private static final String DB_PASSWORD = ""; // Contraseña de la base de datos
    private Connection conn = null;

    // Método para obtener la conexión a la base de datos
    public Connection getConnection() {
        if (conn != null) {
            System.out.println("Ya existe una conexión activa.");
            return conn;
        }

        try {
            // Cargar el driver de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Conectar a la base de datos
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("Conexión a la base de datos establecida.");
        } catch (ClassNotFoundException e) {
            System.err.println("Error al cargar el driver: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Error en la conexión a la base de datos: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error inesperado: " + e.getMessage());
        }
        return conn; // Devuelve la conexión establecida o null si falla
    }

    // Método para cerrar la conexión a la base de datos
    public void closeConexionDB() {
        if (conn == null) {
            System.out.println("No hay conexión abierta para cerrar.");
            return;
        }

        try {
            if (!conn.isClosed()) {
                conn.close();
                System.out.println("Conexión a la base de datos cerrada.");
            }
        } catch (SQLException e) {
            System.err.println("Error al cerrar la conexión a la base de datos: " + e.getMessage());
        } finally {
            conn = null; // Asegurarse de que la conexión esté en null después de cerrarla
        }
    }
}
