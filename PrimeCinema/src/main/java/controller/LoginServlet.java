package controller;

import dao.SucursalDAO;
import dao.UsuarioDAO;
import dao.EmpleadoDAO;
import model.Sucursal;
import model.Usuario;
import model.Empleado;
import model.conexionDB;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String contraseña = request.getParameter("contraseña");

        Connection connection = null;

        try {
            // Crear instancia de conexionDB y obtener la conexión
            conexionDB db = new conexionDB();
            connection = db.getConnection();

            // Primero, verificar si es un Usuario (Cliente)
            Usuario usuario = usuarioDAO.autenticarUsuario(email, contraseña);

            if (usuario != null) {
                // Iniciar sesión con éxito como usuario
                response.sendRedirect("PaginaPrueba.jsp");
            } else {
                // Si no es un usuario, intentar validar como empleado
                EmpleadoDAO empleadoDAO = new EmpleadoDAO(connection);
                Empleado empleado = empleadoDAO.validarEmpleado(email, contraseña);

                if (empleado != null) {
                    // Obtener sucursales
                    SucursalDAO sucursalDAO = new SucursalDAO(connection); // Usando la misma conexión
                    List<Sucursal> sucursales = sucursalDAO.obtenerSucursales();
                    request.setAttribute("sucursales", sucursales);

                    // Redirigir a RegistroSucursal.jsp
                    request.getRequestDispatcher("RegistroSucursal.jsp").forward(request, response);
                } else {
                    // Si las credenciales son incorrectas
                    request.setAttribute("error", "Credenciales incorrectas");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error de conexión a la base de datos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } finally {
            try {
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
