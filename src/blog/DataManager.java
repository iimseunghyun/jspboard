package blog;

import java.sql.*;

public class DataManager {
	Connection con = null;
	String url = "jdbc:mariadb://localhost:3306/blog";
	String dbuser = "root";
	String dbpass = "***";
	
	private Connection openConnection() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(url,dbuser,dbpass);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	private void closeConnection() {
		try {
			if (con != null)
				con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			con = null;
		}
	}

//	회원가입
	public int userRegister(UserInfo user) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO `user` VALUES(?,?,?)";
		int res = 0;
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,user.getId());
			pstmt.setString(2,user.getPass());
			pstmt.setString(3,user.getName());
			res = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
// 로그인
	public boolean isUser(String id, String pass) {
		PreparedStatement pstmt =null;
		String query = "SELECT * FROM `user` WHERE user_id=? and password=?";
		boolean res = false;
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			ResultSet rs = pstmt.executeQuery();
			res = rs.next();
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}

	//관리자 로그인
	public boolean isSuperuser(String id, String pass) {
		PreparedStatement pstmt =null;
		String query = "SELECT * FROM `superuser` WHERE superuser_id=? and password=?";
		boolean res = false;
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			ResultSet rs = pstmt.executeQuery();
			res = rs.next();
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
// 회원탈퇴
    public int removeUser(String id) {
        PreparedStatement pstmt = null;
        String query = "DELETE FROM `user` WHERE user_id=?";
        int res = 0;
        openConnection();
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id);
            res = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return res;
    }
	
// 회원 정보수정
    public int updateUser(UserInfo user) {
        PreparedStatement pstmt = null;
        String query = "UPDATE `user` SET password=?, username=? WHERE user_id=?";
        int res = 0;
        openConnection();
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getPass());
            pstmt.setString(2, user.getName());
            pstmt.setString(3, user.getId());
            res = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return res;
    }

	
// 회원정보 가져오기
    public UserInfo getUser(String id) {
    	PreparedStatement pstmt = null;
    	UserInfo user = new UserInfo();
    	String query = "SELECT * FROM `user` WHERE user_id=?";
    	openConnection();
    	try {
    		pstmt = con.prepareStatement(query);
    		pstmt.setString(1,id);
    		ResultSet rs = pstmt.executeQuery();
    		rs.next();
    		user.setId(rs.getString("user_id"));
    		user.setPass(rs.getString("password"));
    		user.setName(rs.getString("username"));
    		rs.close();
    	}catch (Exception e) {
    		e.printStackTrace();
    	}finally {
    		closeConnection();
    	}
    	return user;
    }
//
}
