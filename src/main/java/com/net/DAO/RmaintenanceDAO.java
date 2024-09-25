package com.net.DAO;

import java.sql.*;

import com.net.Bean.RmaintenanceBean;
import com.net.Connect.*;

public class RmaintenanceDAO {
	static Connection con=null;
	static PreparedStatement ps=null;
	static int status=0;
	static ResultSet rs=null;
	static Statement st=null;
	
	
	public static int Add(RmaintenanceBean bn) {
		 status=0;
		try {
			con=Connect.getConnection();
			String sql="insert into rmaintenance_tb  (rmdate, rmtime, rmservice, rmcontact) values (?,?,?,?);";
			ps=con.prepareStatement(sql);
			ps.setString(1, bn.getRmdate());
			ps.setString(2, bn.getRmtime());
			ps.setString(3, bn.getRmservice());
			ps.setString(4, bn.getRmcontact());

			status=ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return status;
	}
	
	public static ResultSet View() {
		 
		try {
			con=Connect.getConnection();
			String sql="select * from  rmaintenance_tb";
			st=con.createStatement();
			rs=st.executeQuery(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return rs;
	}
	
	
	
	public static ResultSet Show(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "select * from rmaintenance_tb  where rmid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        rs = ps.executeQuery();
	  } catch (Exception e) {
	            e.printStackTrace();
		}		
			return rs;		
		}

		public static int Update(RmaintenanceBean bn) {	
		try {
			con = Connect.getConnection();
			String sql = "update rmaintenance_tb set  rmdate=?, rmtime=?, rmservice=?, rmcontact=? where rmid=?";
			//, edate=?, etime=?, eimage=?, edesc=?, eplace=?, eorg=?
	        ps=con.prepareStatement(sql);
	        
			ps.setString(1, bn.getRmdate());
			ps.setString(2, bn.getRmtime());
			ps.setString(3, bn.getRmservice());
			ps.setString(4, bn.getRmcontact());
			
			ps.setInt(5, bn.getRmid());

	        status = ps.executeUpdate();
	       
	        
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }

		public static int Delete(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "delete from rmaintenance_tb where rmid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        status = ps.executeUpdate();
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }

}
