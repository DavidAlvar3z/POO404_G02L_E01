package controller;

import dao.EmpleadoDAO;
import model.Empleado;
import model.conexionDB;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/loginEmpleado")
public class EmpleadoLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String contraseña = request.getParameter("contraseña");

        Connection connection = null;

        try {
            // Crear instancia de conexionDB y obtener la conexión
            conexionDB db = new conexionDB();
            connection = db.getConnection();

            EmpleadoDAO empleadoDAO = new EmpleadoDAO(connection);
            Empleado empleado = empleadoDAO.validarEmpleado(email, contraseña);

            if (empleado != null) {
                // Iniciar sesión con éxito, guardar información en la sesión
                HttpSession session = request.getSession();
                session.setAttribute("empleado", empleado);
                response.sendRedirect("PaginaPrueba.jsp");
            } else {
                // Si las credenciales son incorrectas, redirigir al formulario de login
                request.setAttribute("error", "Credenciales incorrectas");
                request.getRequestDispatcher("login.jsp").forward(request, response);
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