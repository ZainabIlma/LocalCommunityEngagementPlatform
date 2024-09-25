package com.net.DAO;

import java.sql.*;

import com.net.Bean.LocalbsnsBean;
import com.net.Connect.*;

public class LocalbsnsDAO {
	static Connection con=null;
	static PreparedStatement ps=null;
	static int status=0;
	static ResultSet rs=null;
	static Statement st=null;
	
	
	public static int AddLocalbsns(LocalbsnsBean bn) {
		 status=0;
		try {
			con=Connect.getConnection();
			String sql="insert into localbsns_tb  (ltitle, ldate, lloc, limage) values (?,?,?,?);";
			ps=con.prepareStatement(sql);
			ps.setString(1, bn.getLtitle());
			ps.setString(2, bn.getLdate());
			ps.setString(3, bn.getLloc());
			ps.setString(4, bn.getLimage());

			status=ps.executeUpdate();
			
			
		} catch (Exception e) { 
			e.printStackTrace();
			// TODO: handle exception
		}
		return status;
	}
	
	public static ResultSet ViewLocalbsns() {
		 
		try {
			con=Connect.getConnection();
			String sql="select * from  localbsns_tb";
			st=con.createStatement();
			rs=st.executeQuery(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return rs;
	}
	
	
	
	public static ResultSet ShowLocalbsns(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "select * from localbsns_tb  where lid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        rs = ps.executeQuery();
	  } catch (Exception e) {
	            e.printStackTrace();
		}		
			return rs;		
		}

		public static int Update(LocalbsnsBean bn) {	
		try {
			con = Connect.getConnection();
			String sql = "update localbsns_tb set ltitle=?, ldate=?, lloc=?, limage=? where lid=?";
			
	        ps=con.prepareStatement(sql);
	 
			ps.setString(1, bn.getLtitle());
			ps.setString(2, bn.getLdate());
			ps.setString(3, bn.getLloc());
			ps.setString(4, bn.getLimage());
			ps.setInt(5, bn.getLid());

	        status = ps.executeUpdate();
	       
	        
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }

		public static int Delete(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "delete from localbsns_tb where lid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        status = ps.executeUpdate();
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }
		public static ResultSet ShowBusnsSpotlight() {	
			try {
				con = Connect.getConnection();
				String sql = "select * from localbsns_tb  order by ldate;";
		        st=con.createStatement();
		        rs = st.executeQuery(sql);
		  } catch (Exception e) {
		            e.printStackTrace();
			}		
				return rs;		
			}	
		
}
