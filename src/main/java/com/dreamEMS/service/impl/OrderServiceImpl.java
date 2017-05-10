package com.dreamEMS.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dreamEMS.model.entity.Order;
import com.dreamEMS.model.entity.TestTb;
import com.dreamEMS.repository.OrderRepository;
import com.dreamEMS.service.ApiService;
import com.dreamEMS.service.OrderService;
import com.dreamEMS.util.ExcelRead;
import com.dreamEMS.util.ExcelReadOption;

/**
 * Created by MINK on 2017-05-03.
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;
    //@Qualifier("localValidatorFactoryBean")
    @Autowired
    private Validator validator;
    @Autowired private ApiService apiservice;


    @Override
    public List<TestTb> getTestTbList() {
        return orderRepository.getTestTbList();
    }
    
    @Override
	public List<Order> excelUpload(File destFile) {
		ExcelReadOption excelReadOption = new ExcelReadOption();
        excelReadOption.setFilePath(destFile.getAbsolutePath());
        excelReadOption.setOutputColumns("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O");
        excelReadOption.setStartRow(4);
        
        
        List<Map<String, String>>excelContent = ExcelRead.read(excelReadOption);
        
        
        List<Order> orders = new ArrayList<Order>();
        
        for(Map<String, String> article: excelContent){
        	Order order = new Order();
        	order.setPremiumCd(article.get("A"));
        	order.setReceiveName(article.get("B"));
        	order.setReceiveTelNo(article.get("C"));
        	order.setCountryCd(article.get("D"));
        	order.setReceiveZipCode(article.get("E"));
        	order.setReceiveAddr3(article.get("F"));
        	order.setTotWeight(article.get("G"));
        	order.setContents(article.get("H"));
        	order.setValue(article.get("I"));
        	
        	order.setNumber(article.get("J"));
        	order.setHsCode(article.get("K"));
        	order.setOrderPrsnZipCd(article.get("L"));
        	order.setOrderPrsnAddr2(article.get("M"));
        	order.setOrderPrsnNm(article.get("N"));
        	order.setOrderPrsnTelNo(article.get("O"));
        	
        	Set<ConstraintViolation<Order>> violations = validator.validate(order);
            if (!violations.isEmpty())
            	violations.forEach(violation -> order.addError( violation.getPropertyPath().toString() ));
            //throw new ConstraintViolationException(violations);
         	orders.add(order);
        }
        
        //TODO : DB저장
        
        return orders;
	}

	@Override
	public boolean validateProperty(String property, Order value) {
		Set<ConstraintViolation<Order>> violations = validator.validateProperty(value, property);
		if (!violations.isEmpty())
			return true;
		
		return false;
	}

	@Override
	public boolean saveOrder(Order order) {
		String orderNo = new SimpleDateFormat( "yyyyMMddHHmmssSSS" ).format(System.currentTimeMillis());
		order.setOrderNo( orderNo );
		
		String custNo = apiservice.getCustno();
		order.setCustNo(custNo);
		order.setApprNo(apiservice.getApprno(custNo));
		
		return orderRepository.insertOrder(order) > 0;
	}

	@Override
	public boolean modifyOrder(Order order) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteOrder(Order order) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean getOrder(String orderNo) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
    
    
}
