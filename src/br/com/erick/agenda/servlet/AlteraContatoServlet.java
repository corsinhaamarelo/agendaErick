package br.com.erick.agenda.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.erick.agenda.bd.ContatoDao;
import br.com.erick.agenda.modelo.Contato;

@WebServlet("/alteraContato")
public class AlteraContatoServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		PrintWriter out = response.getWriter();
		// pegando os parâmetros do request
		Long id = Long.parseLong(request.getParameter("id"));
		String nome = request.getParameter("nome");
		String endereco = request.getParameter("endereco");
		String email = request.getParameter("email");
		String dataEmTexto = request.getParameter("dataNascimento");
		Calendar dataNascimento = null;
		// fazendo a conversão da data
		try {
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto);
			dataNascimento = Calendar.getInstance();
			dataNascimento.setTime(date);
		} catch (ParseException e) {
			out.println("Erro de conversão da data");
			return; // para a execução do método
		}
		// monta um objeto contato
		Contato contato = new Contato();
		contato.setId(id);
		contato.setNome(nome);
		contato.setEndereco(endereco);
		contato.setEmail(email);
		contato.setDataNascimento(dataNascimento);
		// salva o contato
		ContatoDao dao = new ContatoDao();
		dao.altera(contato);
		// imprime o nome do contato que foi adicionado
		out.println("<html>");
		out.println("<body>");
		out.println("Contato " + contato.getNome() + " alterado com sucesso");
		out.println("</body>");
		out.println("</html>");
	}
}