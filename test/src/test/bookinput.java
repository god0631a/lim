package test;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/bookinput")
@MultipartConfig(maxFileSize = 1677216)
public class bookinput extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		Connection conn = null;
		String strisbn;
		String strtitle;
		String strprice;
		String strpublisher;
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception ex) {
			System.out.println("mysql jdbc 드라이버 로드 에러");
		}

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/book_store?" + "user=root&password=admin");

		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}
		
		request.setCharacterEncoding("EUC-KR");

		strisbn = request.getParameter("isbn");
		strtitle = request.getParameter("title");
		Part partImage = request.getPart("image");
		InputStream is = partImage.getInputStream();
		strprice = request.getParameter("price");
		strpublisher = request.getParameter("publisher");
		String strdate = request.getParameter("datepicker1");
		
		
		
		DecimalFormat df = new DecimalFormat("###.##");
		
		String strInsert = "INSERT INTO book(isbn, title, image, price, publisher, publishdate) VALUES(?,?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(strInsert);
			
			Blob blob = conn.createBlob();
			ps.setString(1, strisbn);
			ps.setString(2, strtitle);
			ps.setBlob(3, is);
			ps.setString(4, strprice);
			ps.setString(5, strpublisher);
			ps.setString(6, strdate);
			
			ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect("bookadd.jsp");
	}

}
