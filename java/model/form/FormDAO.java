package model.form;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import DB.connection.DBConnection;
import model.form.Form;

public class FormDAO {
	private static FormDAO instance;

	// 싱글톤 패턴
	private FormDAO() {
	}

	public static FormDAO getInstance() {
		if (instance == null)
			instance = new FormDAO();
	return instance;
	}
	
	public int insertForm(Form form) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();

			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("insert into form(title, description) values");
			sql.append("(?, ?)");
			
			String generatedColumns[] = { "form_id" };
			
			pstmt = conn.prepareStatement(sql.toString(), generatedColumns);
			pstmt.setString(1, form.getTitle());
			pstmt.setString(2, form.getDescription());
			
				
			pstmt.executeUpdate();
			
			conn.commit();
			
			try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                return generatedKeys.getInt(1);
	            }
	            else {
	                throw new SQLException("Creating user failed, no ID obtained.");
	            }
	        }
		} catch (ClassNotFoundException | NamingException | SQLException sqle) {
			// 오류시 롤백
			conn.rollback();

			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		} // end try~catch
	} // end insertForm()
}
