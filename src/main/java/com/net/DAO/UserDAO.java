package com.net.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.net.Bean.UserBean;
import com.net.Connect.Connect;

public class UserDAO {
	static Connection con=null;
	static PreparedStatement ps=null;
	static int rowCount=0;
	static ResultSet r=null;
	
	public static int Register(UserBean ub) {
		try {
			con=Connect.getConnection();
			String sql="insert into UserLogin (uname,uemail,upass) values(?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, ub.getUname());
			ps.setString(2, ub.getUemail());
			ps.setString(3, ub.getUpass());
			
			rowCount=ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return rowCount;
		
	}
	public static int Login(UserBean ub) {
		rowCount=0;
		try {
			con=Connect.getConnection();
			String sql="SELECT * FROM UserLogin WHERE uemail = ? AND upass = ?;";
			ps=con.prepareStatement(sql);
			ps.setString(1, ub.getUemail());
			ps.setString(2, ub.getUpass());
			r =ps.executeQuery();
			if(r.next()) {
				rowCount= 1;
				
			}
			else rowCount= 0;
			
			
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return rowCount;
		
	}
	
	
}
