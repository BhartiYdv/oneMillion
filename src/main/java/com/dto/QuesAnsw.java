package com.dto;

public class QuesAnsw {
	
	private int id;
	private String question;
	private String answer;
	private String ansType;
	private String subQuestion;
	private String subAnswer;
	private String subAnsType;
	private String subQuesFlag;
	
	public String getSubQuesFlag() {
		return subQuesFlag;
	}
	public void setSubQuesFlag(String subQuesFlag) {
		this.subQuesFlag = subQuesFlag;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAnsType() {
		return ansType;
	}
	public void setAnsType(String ansType) {
		this.ansType = ansType;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getSubQuestion() {
		return subQuestion;
	}
	public void setSubQuestion(String subQuestion) {
		this.subQuestion = subQuestion;
	}
	public String getSubAnswer() {
		return subAnswer;
	}
	public void setSubAnswer(String subAnswer) {
		this.subAnswer = subAnswer;
	}
	public String getSubAnsType() {
		return subAnsType;
	}
	public void setSubAnsType(String subAnsType) {
		this.subAnsType = subAnsType;
	}
	
	
	

}
