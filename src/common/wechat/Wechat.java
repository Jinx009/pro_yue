package common.wechat;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;


public class Wechat extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");
		String echostr = request.getParameter("echostr");
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("xsw21qaz");
		list.add(timestamp);
		list.add(nonce);
		Collections.sort(list);
		
		ServletContext application = request.getSession().getServletContext();
		
		String s = list.get(0)+list.get(1)+list.get(2);
		String signature2 = DigestUtils.shaHex(s);
		
		/*application.setAttribute("signature", signature);
		application.setAttribute("signature2", signature2);
		application.setAttribute("timestamp", timestamp);
		application.setAttribute("nonce", nonce);
		application.setAttribute("echostr", echostr);*/
		
		
		if(signature.equals(signature2)){
			PrintWriter out = response.getWriter();
			out.println(echostr);
			out.close();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
	
	
}
