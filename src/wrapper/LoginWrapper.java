package wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class LoginWrapper extends HttpServletRequestWrapper {

	public LoginWrapper(HttpServletRequest request) {
		super(request);
	}
	@Override
	public String getParameter(String key) {
		String value = "";
		if (key != null && key.equals("pass")) {
			value =getSha512(super.getParameter("pass"));
		}else {
			value =super.getParameter(key);
		}
		return value;
	}
	
	private static String getSha512(String pass) {
		String encPass = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = pass.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			
			encPass = Base64.getEncoder().encodeToString(md.digest());
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return encPass;
	}
}

