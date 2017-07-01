package com.dreamEMS.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.dreamEMS.model.dto.CustomUserDetails;
import com.dreamEMS.model.entity.Order;
import com.dreamEMS.model.entity.OrderResponse;
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
    @Autowired private ApiService apiService;


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
        	//TODO : 프리미엄 구분 어떻게?
        	order.setPremiumCd("31");
        	order.setEmGubun(article.get("A"));
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
		order.setOrderDate(new Date());
		
		String custNo = apiService.getCustno();
		String apprNo = apiService.getApprno(custNo);
		order.setCustNo(custNo);
		order.setApprNo(apprNo);
		
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//발송인
		order.setSender(user.getSender());
		order.setSenderZipCode(user.getSenderZipCode());
		order.setSenderAddr1(user.getSenderAddr1());
		order.setSenderAddr2(user.getSenderAddr2());
		
        String telNo = user.getSenderTelNo();
        Matcher m = Pattern.compile("([\\d]{2,3})-([\\d]{3,4})-([\\d]{4})").matcher(telNo);
        if(m.find())
        {
        	order.setSenderTelNo1("82");
        	order.setSenderTelNo2(m.group(1));
        	order.setSenderTelNo3(m.group(2));
        	order.setSenderTelNo4(m.group(3));
        	order.setSenderMobile1("82");
        	order.setSenderMobile2(m.group(1));
        	order.setSenderMobile3(m.group(2));
        	order.setSenderMobile4(m.group(3));
        }

        
		OrderResponse response = apiService.receiptEms(custNo, apprNo, order);
		
		order.setReqNo(response.getReqNo());
		order.setReceiveSeq(response.getReceiveSeq());
		order.setRegiNo(response.getRegiNo());
		order.setPreRecevPrc(response.getPreRecevPrc());
		order.setPrcPayMethCd(response.getPrcPayMethCd());
		order.setTreatPoRegiPoCd(response.getTreatPoRegiPoCd());
		order.setTreatPoRegiPoEngNm(response.getTreatPoRegiPoEngNm());
		
		return  orderRepository.insertOrder(order) > 0;
	}

	@Override
	public boolean modifyOrder(Order order) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteOrder(String orderNo) {
		
		Long userNo = getUserNo();
		
		Order order = new Order();
		order.setOrderNo(orderNo);
		order.setUserNo(userNo);
		return orderRepository.deleteOrder(order) > 0 ;
	}

	@Override
	public List<Order> getAllOrder(DataTablesInput input) {
		Long userNo = getUserNo();
	    List<Order> orderList = orderRepository.selectAllOrder(input, userNo);
	    
		return orderList;
	}
	
	
	
	@Override
	public int getTotCount() {
		return orderRepository.selectTotalRecords();
	}

	@Override
	public List<Order> getAllPrintOrder(DataTablesInput input) {
		Long userNo = getUserNo();
	    List<Order> orderList = orderRepository.selectAllPrintOrder(input, userNo); 
		return orderList;
	}

	@Override
	public Order getOrder(String orderNo) {
		
		Long userNo = getUserNo();

		Order pOrder = new Order();
		pOrder.setOrderNo(orderNo);
		pOrder.setUserNo(userNo);
		
		Order order = orderRepository.selectOrder(pOrder); 
		return order;
	}
	
	private Long getUserNo(){
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    
		Long userNo = user.getNo(); //get logged in username
	    if (user.getAuthorities().contains(new SimpleGrantedAuthority("ADMIN"))) {
			userNo = null;
		}
	    return userNo;
	}

	@Override
	public List<Order> getOrders(List<String> orderNoList) {
		Long userNo = getUserNo();
		List<Order> orders = orderRepository.selectOrders(userNo , orderNoList); 
		return orders;
	}
	
	
	

	
	
	
    
    
}
