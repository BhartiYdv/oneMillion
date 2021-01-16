<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add new call</title>
</head>

<body>

<style>

/* Style the header */
header {
 
  text-align: left;
  font-size: 15px;
  color: Blue;
  height:10%;
  width: 100%;

}

/* Style the footer */
footer {
  background-color: #777;
  padding: 10px;
  text-align: center;
  color: white;
  height: 10%;
  width: 100%;
  position: fixed;
  bottom: 0;
  left: 0;
}
</style>
<script>
//on click of add new ques save button - enable and add button -disable
//on click of cancel button vise-versa
$(document).ready(function(){
	
var subQuesFlag=0;
	  $("#addNewQues").click(function(){
		 
	    $("#question").show();
	    $("#ansType").show();
	    $("#addNewQues").prop('disabled', true);
	    $("#save").prop('disabled',"" );
	  });
	  $("#cancel").click(function(){
			  location.reload();
			});
		 /*  //hide all answers
		  $("#question").hide();
		  $("#ansType").hide();
		  $("#Multiple_choice_ans1").hide();
		  $("#Multiple_choice_ans2").hide();
	      $("#Multiple_choice_ans3").hide();
		  $("#Multiple_choice_ans4").hide();
		  $("#Multiple_choice_ans5").hide();
		  $("#Multiline_text_ans").hide();
		  $("#Multiline_text_ans").hide();
		  $("#single_choice_ans").hide();
		  $("#addNewQues").prop('disabled',"" ); // add qes enable
		  $("#save").prop('disabled',true ); // save disable */
	  
	  
	  // show text area based on primary ans type
	  $("#ansType").click(function(){
		 
		 //show sub question button
                 $("#Sub_Multiple_choice_ans1").hide();
				 $("#Sub_Multiple_choice_ans2").hide();
				 $("#Sub_Multiple_choice_ans3").hide();
				 $("#Sub_Multiple_choice_ans4").hide();
				 $("#Sub_Multiple_choice_ans5").hide();
				 $("#Sub_single_choice_ans").hide();
				 $("#Multiline_text_ans").hide();
				 $("#subQuestion").hide();
				 $("#subAnsType").hide();
				    $("#subQuesButton").prop('disabled', "");
		 
			 if($("#ansType").val() == "Multiline text"){
				 $("#Multiple_choice_ans1").hide();
				 $("#Multiple_choice_ans2").hide();
				 $("#Multiple_choice_ans3").hide();
				 $("#Multiple_choice_ans4").hide();
				 $("#Multiple_choice_ans5").hide();
				 $("#single_choice_ans").hide();
				 $("#Multiline_text_ans").show();
				 $("#subQuesButton").hide();
				 }
			 if($("#ansType").val() == "Single choice"){
				 $("#Multiple_choice_ans1").hide();
				 $("#Multiple_choice_ans2").hide();
				 $("#Multiple_choice_ans3").hide();
				 $("#Multiple_choice_ans4").hide();
				 $("#Multiple_choice_ans5").hide();
				 $("#Multiline_text_ans").hide();
				 $("#single_choice_ans").show();
				  $("#subQuesButton").show();
				 }
			 if($("#ansType").val() == "Multiple choice"){
				 $("#Multiline_text_ans").hide();
				 $("#single_choice_ans").hide();
				 $("#Multiple_choice_ans1").show();
				 $("#Multiple_choice_ans2").show();
				 $("#Multiple_choice_ans3").show();
				 $("#Multiple_choice_ans4").show();
				 $("#Multiple_choice_ans5").show();
				  $("#subQuesButton").show();
				 }
			 
	  });
	  
	  $("#save").click(function(){
		  $("#subQuesFlag").val(subQuesFlag);
		  if($("#ansType").val() == "Multiple choice"){
			  //concatinating multiple values in hiddedn field (,) seperated
			 
			  $("#Multiple_choice_ans_hidden").val($("#Multiple_choice_ans1").val()+","+$("#Multiple_choice_ans2").val()+","+
			  $("#Multiple_choice_ans3").val()+","+$("#Multiple_choice_ans4").val()+","+$("#Multiple_choice_ans5").val());
			
		  }
		  if($("#question").val()==""){
			  alert("Enter Question");return false;
		  }else if (subQuesFlag==1 && $("#subQuestion").val()==""){
			  alert("Enter Sub Question");return false;
	  }else{
			  $("#form").submit() ;
		  }
		 
	  });
	  
	  //show text area based on sub answer type
 			$("#subQuesButton").click(function(){
 				subQuesFlag=1;

 				$("#subQuestion").show();
 			    $("#subAnsType").show();
 			    $("#addNewQues").prop('disabled', true);
 			    $("#subQuesButton").prop('disabled', true);
 			    $("#save").prop('disabled',"" );
 			  });
	  
 			$("#subAnsType").click(function(){
			 if($("#subAnsType").val() == "Single choice"){
				 $("#Sub_Multiple_choice_ans1").hide();
				 $("#Sub_Multiple_choice_ans2").hide();
				 $("#Sub_Multiple_choice_ans3").hide();
				 $("#Sub_Multiple_choice_ans4").hide();
				 $("#Sub_Multiple_choice_ans5").hide();
				 $("#Sub_Multiline_text_ans").hide();
				 $("#Sub_single_choice_ans").show();
				 }
			 if($("#subAnsType").val() == "Multiple choice"){
				 $("#Sub_Multiline_text_ans").hide();
				 $("#Sub_single_choice_ans").hide();
				 $("#Sub_Multiple_choice_ans1").show();
				 $("#Sub_Multiple_choice_ans2").show();
				 $("#Sub_Multiple_choice_ans3").show();
				 $("#Sub_Multiple_choice_ans4").show();
				 $("#Sub_Multiple_choice_ans5").show();
				 }
			 if($("#subAnsType").val() == "Multiline text"){
				 $("#Sub_Multiple_choice_ans1").hide();
				 $("#Sub_Multiple_choice_ans2").hide();
				 $("#Sub_Multiple_choice_ans3").hide();
				 $("#Sub_Multiple_choice_ans4").hide();
				 $("#Sub_Multiple_choice_ans5").hide();
				 $("#Sub_single_choice_ans").hide();
				 $("#Sub_Multiline_text_ans").show();
				
				 }
	  });
	  
});

</script>

<header>
  <h2>ALL NEW CALL</h2>
</header>


<form action="save" method="post" id="form">

<input type="text" name="question" placeholder="Enter Question" id="question" style="display: none;width: 350px;height: 20px" required>
&nbsp;
<select id = "ansType" name="ansType" style="display: none;height: 20px"> 
<option value ="Single choice"> Single choice </option>    
<option value ="Multiline text"> Multiline text </option>  
<option value ="Multiple choice"> Multiple choice </option>  
</select>  
<br>
<br>
<input type="text" name="answer" id="single_choice_ans" placeholder="Enter Answer here..."  style="display: none; width: 300px;height: 20px">


<textarea  name="answer" id="Multiline_text_ans" rows="4" cols="50" placeholder="Enter Answer here..." style="display: none">
</textarea>

<input type="hidden" name="answer"  id="Multiple_choice_ans_hidden">
<input type="text" name="answer1"  id="Multiple_choice_ans1" style="display: none;width: 250px;height: 20px"> <br><br>
<input type="text" name="answer2"  id="Multiple_choice_ans2" style="display: none;width: 250px;height: 20px"> <br><br>
<input type="text" name="answer3"  id="Multiple_choice_ans3" style="display: none;width: 250px;height: 20px" > <br><br>
<input type="text" name="answer4"  id="Multiple_choice_ans4" style="display: none;width: 250px;height: 20px"> <br><br>
<input type="text" name="answer5"  id="Multiple_choice_ans5" style="display: none;width: 250px;height: 20px"> <br>

<button id="subQuesButton" style="display: none;">Add Sub Question</button>


<!-- **********************Sub ques-ansqwer part*************************************** -->

<input type="text" name="subQuestion" placeholder="Enter Sub Question" id="subQuestion" style="display: none;width: 350px;height: 20px" required>
&nbsp;
<select id = "subAnsType" name="subAnsType" style="display: none;height: 20px"> 
<option value ="Single choice"> Single choice </option>    
<option value ="Multiline text"> Multiline text </option>  
<option value ="Multiple choice"> Multiple choice </option>  
</select>  
<br>
<br>
<input type="text" name="subAnswer" id="Sub_single_choice_ans" placeholder="Enter Answer here..."  style="display: none; width: 300px;height: 20px">


<textarea  name="subAnswer" id="Sub_Multiline_text_ans" rows="4" cols="50" placeholder="Enter Answer here..." style="display: none">
</textarea>

<input type="hidden" name="subAnswer"  id="Sub_Multiple_choice_ans_hidden">
<input type="text" name="subAnswer1"  id="Sub_Multiple_choice_ans1" style="display: none;width: 250px;height: 20px"> <br><br>
<input type="text" name="subAnswer2"  id="Sub_Multiple_choice_ans2" style="display: none;width: 250px;height: 20px"> <br><br>
<input type="text" name="subAnswer3"  id="Sub_Multiple_choice_ans3" style="display: none;width: 250px;height: 20px" > <br><br>
<input type="text" name="subAnswer4"  id="Sub_Multiple_choice_ans4" style="display: none;width: 250px;height: 20px"> <br><br>
<input type="text" name="subAnswer5"  id="Sub_Multiple_choice_ans5" style="display: none;width: 250px;height: 20px"> <br>

<input type="hidden" name="subQuesFlag" id="subQuesFlag">
<footer>
<button type="submit" value="Submit" disabled="disabled" id="save">SAVE</button>
</form>
  <button id="addNewQues">ADD NEW QUESTION</button>
 
  <button id="cancel">CANCEL</button>
  
</footer>

</body>
</html>