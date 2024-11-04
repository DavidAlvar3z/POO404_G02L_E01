package dao;

import model.Usuario;
import model.conexionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
    private final conexionDB conexionDB = new conexionDB();

    // Método para registrar un usuario
    public boolean registrarUsuario(Usuario usuario) {
        // Comprobar si el correo, teléfono o DUI ya existen
        if (esEmailExistente(usuario.getEmail())) {
            System.err.println("El email ya está en uso.");
            return false; // Email ya existente
        }
        if (esTelefonoExistente(usuario.getTelefono())) {
            System.err.println("El teléfono ya está en uso.");
            return false; // Teléfono ya existente
        }
        if (esDuiExistente(usuario.getDui())) {
            System.err.println("El DUI ya está en uso.");
            return false; // DUI ya existente
        }

        String sql = "INSERT INTO Usuarios (nombre, telefono, email, contraseña, dui) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = conexionDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usuario.getNombre());
            stmt.setString(2, usuario.getTelefono());
            stmt.setString(3, usuario.getEmail());
            stmt.setString(4, usuario.getContraseña());
            stmt.setString(5, usuario.getDui());
            stmt.executeUpdate();

            return true;
        } catch (SQLException e) {
            System.err.println("Error al registrar usuario: " + e.getMessage());
        }
        return false;
    }

    // Método para autenticar al usuario
    public Usuario autenticarUsuario(String email, String contraseña) {
        String sql = "SELECT * FROM Usuarios WHERE email = ? AND contraseña = ?";
        Usuario usuario = null;

        try (Connection conn = conexionDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, contraseña);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setEmail(rs.getString("email"));
                usuario.setContraseña(rs.getString("contraseña"));
            }
        } catch (SQLException e) {
            System.err.println("Error al autenticar usuario: " + e.getMessage());
        }
        return usuario;
    }

    // Verificar si el email ya existe
    private boolean esEmailExistente(String email) {
        String sql = "SELECT COUNT(*) FROM Usuarios WHERE email = ?";
        try (Connection conn = conexionDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Retorna true si existe
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al verificar email: " + e.getMessage());
        }
        return false;
    }

    // Verificar si el teléfono ya existe
    private boolean esTelefonoExistente(String telefono) {
        String sql = "SELECT COUNT(*) FROM Usuarios WHERE telefono = ?";
        try (Connection conn = conexionDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, telefono);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Retorna true si existe
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al verificar teléfono: " + e.getMessage());
        }
        return false;
    }

    // Verificar si el DUI ya existe
    private boolean esDuiExistente(String dui) {
        String sql = "SELECT COUNT(*) FROM Usuarios WHERE dui = ?";
        try (Connection conn = conexionDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, dui);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Retorna true si existe
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al verificar DUI: " + e.getMessage());
        }
        return false;
    }
}