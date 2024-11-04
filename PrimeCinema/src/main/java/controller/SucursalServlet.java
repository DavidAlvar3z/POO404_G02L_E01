package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Sucursal;
import model.conexionDB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/sucursal")
public class SucursalServlet extends HttpServlet {

    // Instancia de la clase conexionDB
    private conexionDB db = new conexionDB();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equals(action)) {
            List<Sucursal> sucursales = getSucursalesFromDB();
            request.setAttribute("sucursales", sucursales);
            request.getRequestDispatcher("RegistroSucursal.jsp").forward(request, response);
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Sucursal sucursal = findSucursalById(id);
            request.setAttribute("sucursal", sucursal);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            deleteSucursalFromDB(id);
            response.sendRedirect("sucursal?action=list"); // Redirige a la lista después de eliminar
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            // Crear nueva sucursal
            String nombreSucursal = request.getParameter("nombreSucursal");
            int idDireccion = Integer.parseInt(request.getParameter("idDireccion"));
            String telefono = request.getParameter("telefono");
            Sucursal nuevaSucursal = new Sucursal(0, nombreSucursal, idDireccion, telefono); // ID se genera en la DB
            addSucursalToDB(nuevaSucursal);
            response.sendRedirect("sucursal?action=list");

        } else if ("update".equals(action)) {
            // Actualizar sucursal existente
            int id = Integer.parseInt(request.getParameter("id"));
            String nombreSucursal = request.getParameter("nombreSucursal");
            int idDireccion = Integer.parseInt(request.getParameter("idDireccion"));
            String telefono = request.getParameter("telefono");
            Sucursal sucursal = new Sucursal(id, nombreSucursal, idDireccion, telefono);
            updateSucursalInDB(sucursal);
            response.sendRedirect("sucursal?action=list");

        } else if ("delete".equals(action)) {
            // Eliminar sucursal
            int id = Integer.parseInt(request.getParameter("id"));
            deleteSucursalFromDB(id);
            response.sendRedirect("sucursal?action=list"); // Redirigir para ver lista actualizada
        }
    }

    private List<Sucursal> getSucursalesFromDB() {
        List<Sucursal> sucursales = new ArrayList<>();
        String query = "SELECT * FROM Sucursales";

        try (Connection conn = db.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Sucursal sucursal = new Sucursal(
                        rs.getInt("id"),
                        rs.getString("nombre_sucursal"),
                        rs.getInt("id_direccion"),
                        rs.getString("telefono")
                );
                sucursales.add(sucursal);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sucursales;
    }

    private Sucursal findSucursalById(int id) {
        Sucursal sucursal = null;
        String query = "SELECT * FROM Sucursales WHERE id = " + id;

        try (Connection conn = db.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            if (rs.next()) {
                sucursal = new Sucursal(
                        rs.getInt("id"),
                        rs.getString("nombre_sucursal"),
                        rs.getInt("id_direccion"),
                        rs.getString("telefono")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sucursal;
    }

    private void addSucursalToDB(Sucursal sucursal) {
        String query = "INSERT INTO Sucursales (nombre_sucursal, id_direccion, telefono) VALUES (?, ?, ?)";

        try (Connection conn = db.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, sucursal.getNombreSucursal());
            stmt.setInt(2, sucursal.getIdDireccion());
            stmt.setString(3, sucursal.getTelefono());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateSucursalInDB(Sucursal sucursal) {
        String query = "UPDATE Sucursales SET nombre_sucursal = ?, id_direccion = ?, telefono = ? WHERE id = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, sucursal.getNombreSucursal());
            stmt.setInt(2, sucursal.getIdDireccion());
            stmt.setString(3, sucursal.getTelefono());
            stmt.setInt(4, sucursal.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteSucursalFromDB(int id) {
        String query = "DELETE FROM Sucursales WHERE id = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Filas afectadas por eliminación: " + rowsAffected);

            if (rowsAffected == 0) {
                System.out.println("No se encontró la sucursal con ID: " + id);
            } else {
                System.out.println("Sucursal con ID " + id + " eliminada correctamente.");
            }

        } catch (Exception e) {
            System.out.println("Error al intentar eliminar la sucursal con ID: " + id);
            e.printStackTrace();
        }
    }

    // Nuevo método deleteSucursal
    private void deleteSucursal(int id) {
        String query = "DELETE FROM Sucursales WHERE id = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Filas afectadas por eliminación: " + rowsAffected);

            if (rowsAffected == 0) {
                System.out.println("No se encontró la sucursal con ID: " + id);
            } else {
                System.out.println("Sucursal con ID " + id + " eliminada correctamente.");
            }

        } catch (Exception e) {
            System.out.println("Error al intentar eliminar la sucursal con ID: " + id);
            e.printStackTrace();
        }
    }
}
