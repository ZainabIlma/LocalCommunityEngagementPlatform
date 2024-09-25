package com.net.DAO;

import java.sql.*;

import com.net.Bean.ThreadBean;
import com.net.Connect.*;

public class ThreadDAO {
	static Connection con=null;
	static PreparedStatement ps=null;
	static int status=0;
	static ResultSet rs=null;
	static Statement st=null;
	static String result=null;
	
	public static int AddThread(ThreadBean bn) {
		 status=0;
		try {
			con=Connect.getConnection();
			String sql="insert into thread_tb  (ttitle, tauthor, timage) values (?,?,?);";
			ps=con.prepareStatement(sql);
			ps.setString(1, bn.getTtitle());
			ps.setString(2, bn.getTauthor());
			ps.setString(3, bn.getTimage());



			status=ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return status;
	}
	
	public static ResultSet ViewThreads() {
		 
		try {
			con=Connect.getConnection();
			String sql="select * from  thread_tb order by ttimestamp desc";
			st=con.createStatement();
			rs=st.executeQuery(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return rs;
	}
	
	
	
	public static ResultSet ShowThread(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "select * from replies_tb  where tid=? order by rtimestamp;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        rs = ps.executeQuery();
	  } catch (Exception e) {
	            e.printStackTrace();
		}		
			return rs;		
		}

		public static int Update(ThreadBean bn) {	
		try {
			con = Connect.getConnection();
			String sql = "update news_tb set ntitle=?, nimage=?, ncon=?, nauthor=? where nid=?";
			
	        ps=con.prepareStatement(sql);
	 
//			ps.setString(1, bn.getNtitle());
//			ps.setString(2, bn.getNimage());
//			ps.setString(3, bn.getNcon());
//			ps.setString(4, bn.getNauthor());
//			ps.setInt(5, bn.getNid());

	        status = ps.executeUpdate();
	       
	        
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }

		public static int Delete(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "delete from thread_tb where tid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        status = ps.executeUpdate();
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }
		public static int countReplies(int id) {	
			try {
				con = Connect.getConnection();
				String sql = "select count(rid) from replies_tb where tid=?;";
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
		public static int count() {	
			try {
				con = Connect.getConnection();
				String sql = "select count(tid) from thread_tb;";
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
				String sql = "select ttitle from thread_tb order by ttimestamp desc limit 1;";
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
				String sql = "select tauthor from thread_tb order by ttimestamp desc limit 1;";
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
		public static String getThreadtitle(int id) {	
			try {
				con = Connect.getConnection();
				String sql = "select ttitle from thread_tb where tid=?;";
		        ps=con.prepareStatement(sql);
		        ps.setInt(1, id);
		        rs=ps.executeQuery(sql);
		        System.out.print("title is asked for:"+id );
		        if (rs.next()) { 
		            result = rs.getString("ttitle"); 
		        }
		        
		      } catch (Exception e) {
		            e.printStackTrace();
		     }		
				return result;	
		  }

}
