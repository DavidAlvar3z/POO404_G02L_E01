package controller;

import dao.UsuarioDAO;
import model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {
    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");
        String contraseña = request.getParameter("contraseña");
        String dui = request.getParameter("dui");

        Usuario usuario = new Usuario(nombre, telefono, email, contraseña, dui);
        boolean registrado = usuarioDAO.registrarUsuario(usuario);

        if (registrado) {
            response.sendRedirect("login.jsp?success=true");
        } else {
            String errorMessage = "El correo, teléfono o DUI ya están en uso.";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        }
    }
}