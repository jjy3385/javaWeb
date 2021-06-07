package sec01.ex01;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public MemberDAO() {
		try {
			//톰캣에 커넥션풀 기능을 이용하여 이미 DB랑 연결해놓았음.
			//JDNI 기능으로 그 객체를 받아오고 있음
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public List<MemberBean> listMembers() {
		List<MemberBean> list = new ArrayList<MemberBean>();
		
		try {
			con = dataFactory.getConnection();
			String query = "select * from t_member order by joinDate desc";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				MemberBean vo = new MemberBean(id,pwd,name,email,joinDate);
				list.add(vo);
			}
			rs.close();
			pstmt.close();	//finally구문에서 하면 SQL예외가 발생할 수 있다고 나옴... 
			con.close();	//마찬가지
		}catch(Exception e) {
			e.printStackTrace();
		}
		/*
		 * finally { rs.close(); pstmt.close(); con.close(); }
		 */
		return list;
	}
	
	public void addMember(MemberBean memberBean) {
		try {
			con = dataFactory.getConnection();
			String id = memberBean.getId();
			String pwd = memberBean.getPwd();
			String name = memberBean.getName();
			String email = memberBean.getEmail();
			
			String query = "insert into t_member(id,pwd,name,email) ";
			query += "values(?,?,?,?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
