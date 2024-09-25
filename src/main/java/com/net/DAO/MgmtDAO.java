package com.net.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.net.Bean.MgmtBean;
import com.net.Connect.Connect;

public class MgmtDAO {
	static Connection con=null;
	static PreparedStatement ps=null;
	static int rowCount=0;
	static ResultSet r=null;
	
	public static int Register(MgmtBean ub) {
		try {
			con=Connect.getConnection();
			String sql="insert into mgmtlogin (full_name,email,password) values(?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, ub.getMname());
			ps.setString(2, ub.getMemail());
			ps.setString(3, ub.getMpass());
			
			rowCount=ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return rowCount;
		
	}
	public static int Login(MgmtBean ub) {
		rowCount=0;
		try {
			con=Connect.getConnection();
			String sql="SELECT * FROM mgmtlogin WHERE email = ? AND password = ?;";
			ps=con.prepareStatement(sql);
			ps.setString(1, ub.getMemail());
			ps.setString(2, ub.getMpass());
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
