package test;


import java.io.IOException;

import java.io.InputStream;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.SQLException;

import java.text.DecimalFormat;

import javax.servlet.ServletException;

import javax.servlet.annotation.MultipartConfig;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Part;




import com.mysql.jdbc.Blob;

import com.mysql.jdbc.Connection;




/**

 * Servlet implementation class ScoreAdd

 */

@WebServlet("/ScoreAdd")

@MultipartConfig(maxFileSize = 16177216)

public class input extends HttpServlet {

	private static final long serialVersionUID = 1L;




	/**

	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)

	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String strIsbn;

		String strTitle;

		int nPrice;




		String strDBAddMessage = "등록 실패";




		DecimalFormat df = new DecimalFormat("###.##");

		

		request.setCharacterEncoding("EUC-KR");




		strIsbn = request.getParameter("isbn");

		strTitle = request.getParameter("title");

		Part partImage = request.getPart("image");

		InputStream is=partImage.getInputStream();

		String strImageName=partImage.getName();

		nPrice = Integer.parseInt(request.getParameter("price"));

		

		Connection conn = null;




		try {

			Class.forName("com.mysql.jdbc.Driver").newInstance();

		} catch (Exception ex) {

			System.out.println("mysql jdbc 드라이버 로드 에러");

		}




		try {

			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?" + "user=root&password=admin");




		} catch (SQLException ex) {

			System.out.println("SQLException: " + ex.getMessage());

			System.out.println("SQLState: " + ex.getSQLState());

			System.out.println("VendorError: " + ex.getErrorCode());

		}

		

		try {

			String strInsert = "INSERT INTO book(isbn, title, image, price) VALUES(?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(strInsert);

			ps.setString(1, strIsbn);

			ps.setString(2, strTitle);

			Blob blob = (Blob) conn.createBlob();

			ps.setBlob(3, is);

			ps.setInt(4, nPrice);


			ps.executeUpdate();

			
		} catch (SQLException ex) {

			System.out.println("SQLException: " + ex.getMessage());

		}

	}

}