package com.net.DAO;

import java.sql.*;

import com.net.Bean.ReventhBean;
import com.net.Connect.*;

public class ReventhDAO {
	static Connection con=null;
	static PreparedStatement ps=null;
	static int status=0;
	static ResultSet rs=null;
	static Statement st=null;
	
	
	public static int Add(ReventhBean bn) {
		 status=0;
		try {
			con=Connect.getConnection();
			String sql="insert into reventh_tb  (rehdate, rehtime, rehprogram, rehcontact) values (?,?,?,?);";
			ps=con.prepareStatement(sql);
			ps.setString(1, bn.getRehdate());
			ps.setString(2, bn.getRehtime());
			ps.setString(3, bn.getRehprogram());
			ps.setString(4, bn.getRehcontact());

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
			String sql="select * from  reventh_tb";
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
			String sql = "select * from reventh_tb  where rehid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        rs = ps.executeQuery();
	  } catch (Exception e) {
	            e.printStackTrace();
		}		
			return rs;		
		}

		public static int Update(ReventhBean bn) {	
		try {
			con = Connect.getConnection();
			String sql = "update reventh_tb set  rehdate=?, rehtime=?, rehprogram=?, rehcontact=? where rehid=?";
			//, edate=?, etime=?, eimage=?, edesc=?, eplace=?, eorg=?
	        ps=con.prepareStatement(sql);
	        
			ps.setString(1, bn.getRehdate());
			ps.setString(2, bn.getRehtime());
			ps.setString(3, bn.getRehprogram());
			ps.setString(4, bn.getRehcontact());
			
			ps.setInt(5, bn.getRehid());

	        status = ps.executeUpdate();
	       
	        
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }

		public static int Delete(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "delete from reventh_tb where rehid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        status = ps.executeUpdate();
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }

}
