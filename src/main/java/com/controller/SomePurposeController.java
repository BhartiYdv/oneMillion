package com.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.QuesAnsw;
import com.service.SaveDeatailsServiceInterface;

@Controller
public class SomePurposeController {
	
	@Autowired SaveDeatailsServiceInterface service;

	@RequestMapping("/addNewCall")
	public ModelAndView showMessage(){

		String message = "Welcome to Spring MVC!";
		
		ModelAndView mv = new ModelAndView("addNewCall");
		mv.addObject("message", message);
		mv.addObject("name", "Bharti");
		
		return mv;
	
	}
	
	
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public ModelAndView saveDeatails(@ModelAttribute("ques") QuesAnsw ques){
		System.out.println("flaggg value"+ques.getSubQuesFlag());
		
	if(ques.getAnsType()!=null && ques.getAnsType().trim().equalsIgnoreCase("Multiple choice")){ 
	//Splitting the multiple comma separated answers and removing blank values 
		String temp="";
		String[] tempArray=ques.getAnswer().split(",");
		List<String> list = new ArrayList<String>(Arrays.asList(tempArray));
	       System.out.println(list);
	       list.removeAll(Arrays.asList("", null));
	       System.out.println(list);
	       for(String s:list){
	   	    temp =temp+","+s;
	      }
	       ques.setAnswer(temp);
	}else{
		ques.setAnswer(ques.getAnswer().replace(",", ""));
	}
		
if(ques.getSubAnsType()!=null && ques.getSubAnsType().trim().equalsIgnoreCase("Multiple choice")){ 
		//Splitting the multiple comma separated answers and removing blank values 
			String temp="";
			String[] tempArray=ques.getSubAnswer().split(",");
			List<String> list = new ArrayList<String>(Arrays.asList(tempArray));
		       System.out.println(list);
		       list.removeAll(Arrays.asList("", null));
		       System.out.println(list);
		       for(String s:list){
		   	    temp =temp+","+s;
		      }
		       ques.setSubAnswer(temp);
		}else{
			ques.setSubAnswer(ques.getSubAnswer().replace(",", ""));
		}
	
	ModelAndView mv = new ModelAndView("addNewCall");
	boolean result =service.saveDetailsService(ques);

	mv.addObject("result", result);
	return mv;
	} 
}
