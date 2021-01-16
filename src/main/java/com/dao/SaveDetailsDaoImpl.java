package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import org.springframework.stereotype.Repository;

import com.dto.QuesAnsw;

@Repository
public class SaveDetailsDaoImpl implements SaveDeatilsDaoInterface{

	public boolean saveDetailsDao(QuesAnsw ques) {
		Connection conn = null;
	    Statement stmt = null;
	    boolean result=true;
	      
	    try {
	      
	            Class.forName("com.mysql.jdbc.Driver");
	            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb?useSSL=false", "root", "root");
	            System.out.println("Connection is created");
	            stmt = (Statement) conn.createStatement();
	            
	            String query1 = "INSERT INTO QUESANS (QUESTIONS,ANSWER,ANSWERTYPE) " 
	            + "VALUES ('"+ques.getQuestion()+"','"+ques.getAnswer()+"','"+ques.getAnsType()+"')";
	            stmt.executeUpdate(query1);
	           
	            if(!(ques.getAnsType().trim().equalsIgnoreCase("Multiline text")
	            	||(ques.getSubAnsType().trim().equalsIgnoreCase("Multiline text")))){ 
	            	if(ques.getSubQuesFlag().equalsIgnoreCase("1")){
	            
	            String query2 = "INSERT INTO SUBQUESANS (FK_ID,SUBQUESTIONS,SUBQUESANSWER,SUBANSTYPE) " 
	            + "VALUES ((Select ID from QUESANS where ID = (Select MAX(ID) from QUESANS)),'"+ques.getSubQuestion()+"','"+ques.getSubAnswer()+"','"+ques.getSubAnsType()+"')";
	            stmt.executeUpdate(query2);
	            System.out.println("Info Saved in sub ques");
	            	}
	            }
	           
	            System.out.println("Info Saved");
	            if (stmt != null){
	                   conn.close();
	             }
	            if (conn != null){
	                   conn.close();
	             }
	         
	    }catch (Exception excep) {
	    	     result=false;
	             excep.printStackTrace();
	          } 
	    			return result;

	}
}
