package com.net.DAO;

import java.sql.*;

import com.net.Bean.ReplyBean;
import com.net.Connect.*;

public class ReplyDAO {
	static Connection con=null;
	static PreparedStatement ps=null;
	static int status=0;
	static ResultSet rs=null;
	static Statement st=null;
	static String result=null;
	
	public static int AddReply(ReplyBean bn) {
		 status=0;
		try {
			con=Connect.getConnection();
			String sql="insert into threadreply_tb  (tid, trauthor, trcon, trimage) values (?,?,?,?);";
			ps=con.prepareStatement(sql);
			ps.setInt(1, bn.getTid());
			ps.setString(2, bn.getTrauthor());
			ps.setString(3, bn.getTrcon());
			ps.setString(4, bn.getTrimage());


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
			String sql="select * from  threadreply_tb order by trrimestamp desc";
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
			String sql = "select * from threadreply_tb  where tid=? order by trtimestamp desc;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        rs = ps.executeQuery();
	  } catch (Exception e) {
	            e.printStackTrace();
		}		
			return rs;		
		}


		public static int Delete(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "delete from threadreply_tb where trid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        status = ps.executeUpdate();
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }

		public static int count(int id) {	
			try {
				con = Connect.getConnection();
				String sql = "select count(trid) from threadreply_tb where tid=?;";
				ps=con.prepareStatement(sql);
		        ps.setInt(1, id);
		        rs=ps.executeQuery(sql);
		       
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
		public static String getReplyText(int id) {	
			try {
				con = Connect.getConnection();
				String sql = "select trcon from threadreply_tb where tid=?;";
		        ps=con.prepareStatement(sql);
		        ps.setInt(1, id);
		        rs=ps.executeQuery(sql);
		        if (rs.next()) { 
		            result = rs.getString("trcon"); 
		        }
		        
		      } catch (Exception e) {
		            e.printStackTrace();
		     }		
				return result;	
		}
		public static String getReplyTime(int id) {	
			try {
				con = Connect.getConnection();
				String sql = "select trcon from threadreply_tb where tid=?;";
		        ps=con.prepareStatement(sql);
		        ps.setInt(1, id);
		        rs=ps.executeQuery(sql);
		        if (rs.next()) { 
		            result = rs.getString("trcon"); 
		        }
		        
		      } catch (Exception e) {
		            e.printStackTrace();
		     }		
				return result;	
		}
}
