package sec02.ex01;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SetCookieValue
 */
@WebServlet("/set")
public class SetCookieValue extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Date d = new Date();
		Cookie c = new Cookie("CookieTest",URLEncoder.encode("JSP프로그래밍입니다.","utf-8"));
//		c.setMaxAge(24 * 60 * 60);
		c.setMaxAge(-1);//음수로 지정하면 세션쿠키,브라우저 메모리에 저장됨(원래 쿠키는 클라이언트에 파일로 저장됨)
		response.addCookie(c);
		out.print("현재시간:" + d);
		out.print("<br> 문자열을 Cookie에 지정합니다.");
		
	}

}
