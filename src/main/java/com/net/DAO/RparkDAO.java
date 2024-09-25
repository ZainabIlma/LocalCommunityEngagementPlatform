package com.net.DAO;

import java.sql.*;

import com.net.Bean.RparkBean;
import com.net.Connect.*;

public class RparkDAO {
	static Connection con=null;
	static PreparedStatement ps=null;
	static int status=0;
	static ResultSet rs=null;
	static Statement st=null;
	
	
	public static int Add(RparkBean bn) {
		 status=0;
		try {
			con=Connect.getConnection();
			String sql="insert into rpark_tb  (rpdate, rptime, rpnum, rpcontact) values (?,?,?,?);";
			ps=con.prepareStatement(sql);
			ps.setString(1, bn.getRpdate());
			ps.setString(2, bn.getRptime());
			ps.setInt(3, bn.getRpnum());
			ps.setString(4, bn.getRpcontact());

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
			String sql="select * from  rpark_tb";
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
			String sql = "select * from rpark_tb  where rpid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        rs = ps.executeQuery();
	  } catch (Exception e) {
	            e.printStackTrace();
		}		
			return rs;		
		}

		public static int Update(RparkBean bn) {	
		try {
			con = Connect.getConnection();
			String sql = "update rpark_tb set  rpdate=?, rptime=?, rpnum=?, rpcontact=? where rpid=?";
			//, edate=?, etime=?, eimage=?, edesc=?, eplace=?, eorg=?
	        ps=con.prepareStatement(sql);
	        
			ps.setString(1, bn.getRpdate());
			ps.setString(2, bn.getRptime());
			ps.setInt(3, bn.getRpnum());
			ps.setString(4, bn.getRpcontact());
			
			ps.setInt(5, bn.getRpid());

	        status = ps.executeUpdate();
	       
	        
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }

		public static int Delete(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "delete from rpark_tb where rpid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        status = ps.executeUpdate();
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }

}
