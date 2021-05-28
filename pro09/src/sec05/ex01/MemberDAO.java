package sec05.ex01;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	private Connection con;
//	private Statement stmt;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public List<MemberVO> listMembers(){
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			con = dataFactory.getConnection();
			String query = "select * from t_member";
			pstmt = con.prepareStatement(query);
			System.out.println("PreparedStatement 생성 성공 : " + query);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");//java.sql.Date
				MemberVO vo = new MemberVO();
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setEmail(email);
				vo.setJoinDate(joinDate);
				list.add(vo);
				
			}
			rs.close();
			pstmt.close();
			con.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}

		return list;
	}
	
	public boolean isExist(MemberVO vo) {
		boolean result = false;
		String id = vo.getId();
		String pwd = vo.getPwd();
		try {
			con = dataFactory.getConnection();
			String query = "select decode(count(*),1,'true','false') as result from t_member";
			query+= " where id =? and pwd = ?";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			result = Boolean.parseBoolean(rs.getString("result"));
			System.out.println("result: " + result);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
