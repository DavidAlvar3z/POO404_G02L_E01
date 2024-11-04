package dao;

import model.Empleado;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmpleadoDAO {
    private Connection connection;

    public EmpleadoDAO(Connection connection) {
        this.connection = connection;
    }

    public Empleado validarEmpleado(String email, String contraseña) {
        Empleado empleado = null;
        String query = "SELECT * FROM Empleados WHERE email = ? AND contraseña = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, email);
            stmt.setString(2, contraseña);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                empleado = new Empleado(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("telefono"),
                        rs.getString("email"),
                        rs.getString("contraseña"),
                        rs.getString("rol"),
                        rs.getString("fecha_contratacion"),
                        rs.getString("dui")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return empleado;
    }
}