package com.service;

import org.springframework.stereotype.Service;

import com.dao.SaveDetailsDaoImpl;
import com.dto.QuesAnsw;

@Service
public class SaveDetailsServiceImpl implements SaveDeatailsServiceInterface{

	public boolean saveDetailsService(QuesAnsw ques) {
		SaveDetailsDaoImpl dao=new SaveDetailsDaoImpl();
		boolean result=dao.saveDetailsDao(ques);
		
		return result;
	}

}
