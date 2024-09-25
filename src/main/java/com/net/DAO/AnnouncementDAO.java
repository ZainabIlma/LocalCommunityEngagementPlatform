package com.net.DAO;

import java.sql.*;

import com.net.Bean.AnnouncementBean;
import com.net.Connect.*;

public class AnnouncementDAO {
	static Connection con=null;
	static PreparedStatement ps=null;
	static int status=0;
	static ResultSet rs=null;
	static Statement st=null;
	static String result=null;
	
	public static int AddAnnouncement(AnnouncementBean bn) {
		 status=0;
		try {
			con=Connect.getConnection();
			String sql="insert into announcement_tb  (atitle, adate, atime, acon, aauthor) values (?,?,?,?,?);";
			ps=con.prepareStatement(sql);
			ps.setString(1, bn.getAtitle());
			ps.setString(2, bn.getAdate());
			ps.setString(3, bn.getAtime());
			ps.setString(4, bn.getAcon());
			ps.setString(5, bn.getAauthor());


			status=ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return status;
	}
	
	public static ResultSet ViewAnnouncement() {
		 
		try {
			con=Connect.getConnection();
			String sql="select * from  announcement_tb order by adate desc";
			st=con.createStatement();
			rs=st.executeQuery(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return rs;
	}
	
	
	
	public static ResultSet ShowAnnoncement(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "select * from announcement_tb  where aid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        rs = ps.executeQuery();
	  } catch (Exception e) {
	            e.printStackTrace();
		}		
			return rs;		
		}

		public static int Update(AnnouncementBean bn) {	
		try {
			con = Connect.getConnection();
			String sql = "update announcement_tb set atitle=?, adate=?, atime=?, acon=?, aauthor=? where aid=?";
			
	        ps=con.prepareStatement(sql);
	 
			ps.setString(1, bn.getAtitle());
			ps.setString(2, bn.getAdate());
			ps.setString(3, bn.getAtime());
			ps.setString(4, bn.getAcon());
			ps.setString(5, bn.getAauthor());
			ps.setInt(6, bn.getAid());

	        status = ps.executeUpdate();
	       
	        
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }

		public static int Delete(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "delete from announcement_tb where aid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        status = ps.executeUpdate();
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }

		public static int count() {	
			try {
				con = Connect.getConnection();
				String sql = "select count(aid) from announcement_tb;";
		        st=con.createStatement();
		        rs=st.executeQuery(sql);
		       
		        if (rs.next()) { 
		            status = rs.getInt(1); 
		        }
		        
		      } catch (Exception e) {
		            e.printStackTrace();
		     }		
				return status;	
		  }

		public static String recent() {	
			try {
				con = Connect.getConnection();
				String sql = "select atitle from announcement_tb order by adate desc limit 1;";
		        st=con.createStatement();
		        rs=st.executeQuery(sql);
		       
		        if (rs.next()) { 
		            result = rs.getString(1); 
		        }
		        
		      } catch (Exception e) {
		            e.printStackTrace();
		     }		
				return result;	
		  }
		public static String recentcon() {	
			try {
				con = Connect.getConnection();
				String sql = "select substr(acon,1,50) from announcements_tb order by adate desc limit 1;";
		        st=con.createStatement();
		        rs=st.executeQuery(sql);
		       
		        if (rs.next()) { 
		            result = rs.getString(1); 
		        }
		        
		      } catch (Exception e) {
		            e.printStackTrace();
		     }		
				return result;	
		  }

}
