package model.question;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import javax.naming.NamingException;
import DB.connection.DBConnection;

public class QuestionDAO {
	private static QuestionDAO instance;

	// 싱글톤 패턴
	private QuestionDAO() {
	}

	public static QuestionDAO getInstance() {
		if (instance == null)
			instance = new QuestionDAO();
	return instance;
	}
	
	public int insertQuestion(Question question, int option_group_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();

			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("insert into question(title, option_group_id, type, multi_res, necessary, shuffle) values");
			sql.append("(?, ?, ?, ?, ?, ?)");
			
			String generatedColumns[] = { "question_id" };
			
			pstmt = conn.prepareStatement(sql.toString(), generatedColumns);
			pstmt.setString(1, question.getTitle());
			pstmt.setInt(2, option_group_id);
			pstmt.setString(3, question.getType());
			pstmt.setInt(4, question.getMulti_res());
			pstmt.setInt(5, question.getNecessary());
			pstmt.setInt(6, question.getShuffle());
				
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
	} // end insertOption()
	
	public int insertQuestion(Question question) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();

			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("insert into question(title, type, multi_res, necessary, shuffle) values");
			sql.append("(?, ?, ?, ?, ?)");
			
			String generatedColumns[] = { "question_id" };
			
			pstmt = conn.prepareStatement(sql.toString(), generatedColumns);
			pstmt.setString(1, question.getTitle());
			pstmt.setString(2, question.getType());
			pstmt.setInt(3, question.getMulti_res());
			pstmt.setInt(4, question.getNecessary());
			pstmt.setInt(5, question.getShuffle());
				
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
	} // end insertOption()
	
	public void Matrix(int main_q, int sub_q, int order) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();

			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("insert into matrix_rel values");
			sql.append("(?, ?, ?)");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, main_q);
			pstmt.setInt(2, sub_q);
			pstmt.setInt(3, order);
				
			pstmt.executeUpdate();
			
			conn.commit();
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
	} // end Matrix()
	 
	public void optionGrouping(int option, int optionGroup, int number) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();

			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("insert into option_grouping values");
			sql.append("(?, ?, ?)");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, optionGroup);
			pstmt.setInt(2, option);
			pstmt.setInt(3, number);
				
			pstmt.executeUpdate();
			
			conn.commit();
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
	} // end OptionGrouping()
	
	public int insertOptionGroup(int option_count) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();

			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("insert into option_group(num_of_option) values");
			sql.append("(?)");
			
			String generatedColumns[] = { "option_group_id" };
			
			pstmt = conn.prepareStatement(sql.toString(), generatedColumns);
			pstmt.setInt(1, option_count);
				
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
	} // end insertOptionGroup()
	
	public int insertOption(String option) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();

			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("insert into option(contents) values");
			sql.append("(?)");
			// stringToDate(member);
			/*
			 * StringBuffer에 담긴 값을 얻으려면 toString()메서드를 이용해야 한다.
			 */
			
			String generatedColumns[] = { "option_id" };
			
			pstmt = conn.prepareStatement(sql.toString(), generatedColumns);
			pstmt.setString(1, option);
				
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
	} // end insertOption()
}