package com.net.DAO;

import java.sql.*;

import com.net.Bean.NewsBean;
import com.net.Connect.*;

public class NewsDAO {
	static Connection con=null;
	static PreparedStatement ps=null;
	static int status=0;
	static ResultSet rs=null;
	static Statement st=null;
	static String result=null;
	
	public static int AddNews(NewsBean bn) {
		 status=0;
		try {
			con=Connect.getConnection();
			String sql="insert into news_tb  (ntitle, nimage, ncon, nauthor) values (?,?,?,?);";
			ps=con.prepareStatement(sql);
			ps.setString(1, bn.getNtitle());
			ps.setString(2, bn.getNimage());
			ps.setString(3, bn.getNcon());
			ps.setString(4, bn.getNauthor());


			status=ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return status;
	}
	
	public static ResultSet ViewNews() {
		 
		try {
			con=Connect.getConnection();
			String sql="select * from  news_tb order by ndate desc";
			st=con.createStatement();
			rs=st.executeQuery(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return rs;
	}
	
	
	
	public static ResultSet ShowNews(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "select * from news_tb  where nid=?;";
	        ps=con.prepareStatement(sql);
	        
	        ps.setInt(1, id);

	        rs = ps.executeQuery();
	  } catch (Exception e) {
	            e.printStackTrace();
		}		
			return rs;		
		}

		public static int Update(NewsBean bn) {	
		try {
			con = Connect.getConnection();
			String sql = "update news_tb set ntitle=?, nimage=?, ncon=?, nauthor=? where nid=?";
			
	        ps=con.prepareStatement(sql);
	 
			ps.setString(1, bn.getNtitle());
			ps.setString(2, bn.getNimage());
			ps.setString(3, bn.getNcon());
			ps.setString(4, bn.getNauthor());
			ps.setInt(5, bn.getNid());

	        status = ps.executeUpdate();
	       
	        
	      } catch (Exception e) {
	            e.printStackTrace();
	     }		
			return status;	
	  }

		public static int Delete(int id) {	
		try {
			con = Connect.getConnection();
			String sql = "delete from news_tb where nid=?;";
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
				String sql = "select count(nid) from news_tb;";
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
				String sql = "select ntitle from news_tb order by ndate desc limit 1;";
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
				String sql = "select substr(ncon,1,50) from news_tb order by ndate desc limit 1;";
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
