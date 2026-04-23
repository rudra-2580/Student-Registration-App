package com.studentDataStore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudService {
	private static String url="jdbc:postgresql://localhost:5432/school";
	   private static String user="postgres";
	   private static String pw="Rudra@2580";
	   
	   static Connection con;
	   static {
		   try {
			Class.forName("org.postgresql.Driver");
			con=DriverManager.getConnection(url,user,pw);
		   } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		   } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	   }
	   
	   public int save(Student st)  {
		   int res=0;
		   try {
			   String sql="INSERT into student values(?,?,?)";
			PreparedStatement pstm=con.prepareStatement(sql);
			pstm.setInt(1, st.getId());
			pstm.setString(2,st.getName());
			pstm.setInt(3,st.getAge());
			
		   res=pstm.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
		   return res;
		   
	   }
	   
	   public List<Student> display() {
		   String sql="SELECT * from student";
		   List<Student> list=new ArrayList<Student>();
		   try {
			PreparedStatement pstm=con.prepareStatement(sql);
			ResultSet rs=pstm.executeQuery();
			
			while(rs.next()) {
				list.add(new Student(rs.getInt(1),rs.getString(2),rs.getInt(3)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
		   return list;
	   }
	   
	   public int update(String name,int age,int id) {
		   String sql="UPDATE student SET name=?,age=? where id=? ";
		   int res=0;
		   
		   try {
			PreparedStatement pstm=con.prepareStatement(sql);
			pstm.setString(1,name);
			pstm.setInt(2, age);
			pstm.setInt(3,id);
			
			res=pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
		   return res;
	   }
	   
	   public int delete(int id) {
		   String sql="DELETE from student where id=?";
		   int res=0;
		   try {
			PreparedStatement pstm=con.prepareStatement(sql);
			pstm.setInt(1, id);
			res=pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		   return res;
	   }
}
