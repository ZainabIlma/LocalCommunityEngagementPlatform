package com.net.DAO;

import java.sql.*;

import com.net.Bean.EventBean;
import com.net.Connect.*;

public class EventDAO {
	static Connection con=null;
	static PreparedStatement ps=null;
	static int status=0;
	static ResultSet rs=null;
	static Statement st=null;
	static String result=null;
	
	public static int AddEvent(EventBean bn) {
		 status=0;
		try {
			con=Connect.getConnection();
			String sql="insert into event_tb  (ename, edate, etime, eimage, edesc, eplace, eorg) values (?,?,?,?,?,?,?);";
			ps=con.prepareStatement(sql);
			ps.setString(1, bn.getEname());
			ps.setString(2, bn.getEdate());
			ps.setString(3, bn.getEtime());
			ps.setString(4, bn.getEimage());
			ps.setString(5, bn.getEdesc());
			ps.setString(6, bn.getEplace());
			ps.setString(7, bn.getEorg());


			status=ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return status;
	}
	
	public static ResultSet ViewEvent() {
		 
		try {
			con=Connect.getConnection();
			String sql="select * from  event_tb";
			st=con.createStatement();
			rs=st.executeQuery(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return rs;
	}
	
	
	
	public static ResultSet ShowEvent(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "select * from event_tb  where eid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        rs = ps.executeQuery();
	  } catch (Exception e) {
	            e.printStackTrace();
		}		
			return rs;		
		}

		public static int Update(EventBean bn) {	
		try {
			con = Connect.getConnection();
			String sql = "update event_tb set ename=?, edate=?, etime=?, eimage=?, edesc=?, eplace=?, eorg=? where eid=?";
			//, edate=?, etime=?, eimage=?, edesc=?, eplace=?, eorg=?
	        ps=con.prepareStatement(sql);
	        
			ps.setString(1, bn.getEname());
			ps.setString(2, bn.getEdate());
			ps.setString(3, bn.getEtime());
			ps.setString(4, bn.getEimage());
			ps.setString(5, bn.getEdesc());
			ps.setString(6, bn.getEplace());
			ps.setString(7, bn. getEorg());
			ps.setInt(8, bn.getEid());

	        status = ps.executeUpdate();
	       
	        
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }

		public static int Delete(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "delete from event_tb where eid=?;";
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
				String sql = "select count(eid) from event_tb;";
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
				String sql = "select ename from event_tb order by edate desc limit 1;";
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
				String sql = "select edate from event_tb order by edate desc limit 1;";
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
