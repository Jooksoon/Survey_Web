package model.member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import javax.naming.NamingException;

import DB.connection.DBConnection;

 
/* Data Access Object
 * ���̺� �� �Ѱ��� DAO�� �ۼ��Ѵ�.
 * 
 * JSP_MEMBER ���̺�� ������ DAO��
 * ȸ�� �����͸� ó���ϴ� Ŭ�����̴�.
 */
public class MemberDAO 
{
    private static MemberDAO instance;
    
    // �̱��� ����
    private MemberDAO(){}
    public static MemberDAO getInstance(){
        if(instance==null)
            instance=new MemberDAO();
        return instance;
    }
    
    // String -> Date�� �����ϴ� �޼���
    // ���ڿ��ε� ��������� Date�� �����ϱ� ���� �ʿ�
    // java.util.DateŬ�����δ� ����Ŭ�� Date���İ� ������ �� ����.
    // Oracle�� date���İ� �����Ǵ� java�� Date�� java.sql.Date Ŭ�����̴�.
    /*public Date stringToDate(MemberBean member)
    {
        String year = member.getBirthyy();
        String month = member.getBirthmm();
        String day = member.getBirthdd();
        
        Date birthday = Date.valueOf(year+"-"+month+"-"+day);
        
        return birthday;
        
    } */// end stringToDate()
    
    // ȸ�������� JSP_MEMBER ���̺� �����ϴ� �޼���
    public void insertMember(MemberBean member) throws SQLException
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Ŀ�ؼ��� �����´�.
            conn = DBConnection.getConnection();
            
            // �ڵ� Ŀ���� false�� �Ѵ�.
            conn.setAutoCommit(false);
            
            // ���� �����Ѵ�.
            // �������� ��� �ڵ����� ���õǰ� �ϱ� ���� sysdate�� ���
            StringBuffer sql = new StringBuffer();
            sql.append("insert into user(id, password, name, sex, birthday, phone_number, email) values");
            sql.append("(?, ?, ?, ?, ?, ?, ?)");        
            //stringToDate(member);
            /* 
             * StringBuffer�� ��� ���� �������� toString()�޼��带
             * �̿��ؾ� �Ѵ�.
             */
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getGender());
            pstmt.setString(5, member.getBirth());
            pstmt.setString(6, member.getPhone());
            pstmt.setString(7, member.getMail1()+"@"+member.getMail2());
            // ���� ����
            pstmt.executeUpdate();
            // �Ϸ�� Ŀ��
            conn.commit(); 
            
        } catch (ClassNotFoundException | NamingException | SQLException sqle) {
            // ������ �ѹ�
            conn.rollback(); 
            
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement�� �ݴ´�.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        } // end try~catch 
    } // end insertMember()
    
    /**
     * ���̵� �ߺ�üũ�� �Ѵ�.
     * @param id ���̵�
     * @return x : ���̵� �ߺ����� Ȯ�ΰ�
     */
    
    public int loginCheck(String id, String pw) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbPW = ""; // db���� ���� ��й�ȣ�� ���� ����
        int x = -1;
 
        try {
            // ���� - ���� �Էµ� ���̵�� DB���� ��й�ȣ�� ��ȸ�Ѵ�.
            StringBuffer query = new StringBuffer();
            query.append("SELECT password FROM user WHERE id=?");
 
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // �Է��� ���̵� �ش��ϴ� ��� �������
            {
                dbPW = rs.getString("password"); // ����� ������ �ִ´�.
 
                if (dbPW.equals(pw)) 
                    x = 1; // �Ѱܹ��� ����� ������ ��� ��. ������ ��������
                else                  
                    x = 0; // DB�� ��й�ȣ�� �Է¹��� ��й�ȣ �ٸ�, ��������
                
            } else {
                x = -1; // �ش� ���̵� ���� ���
            }
 
            return x;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end loginCheck()

    public boolean duplicateIdCheck(String id)
    {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        boolean x= false;
        
        try {
            // ����
            StringBuffer query = new StringBuffer();
            query.append("SELECT id FROM user WHERE id=?");
                        
            conn = DBConnection.getConnection();
            pstm = conn.prepareStatement(query.toString());
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            
            if(rs.next()) x= true; //�ش� ���̵� ����
            
            return x;
            
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstm != null ){ pstm.close(); pstm=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end duplicateIdCheck()


}