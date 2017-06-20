package com.dreamEMS.service;

import java.io.File;
import java.util.List;

import com.dreamEMS.model.entity.Order;
import com.dreamEMS.model.entity.TestTb;

/**
 * Created by MINK on 2017-05-03.
 */
public interface OrderService {

    List<TestTb> getTestTbList();
	public List<Order> excelUpload(File destFile);
	boolean validateProperty(String property, Order value);
	boolean saveOrder(Order order);               
	boolean modifyOrder(Order order);               
	boolean deleteOrder(String orderNo);               
	List<Order> getAllOrder(Long userNo);
	List<Order> getAllPrintOrder(Long userNo);
	
	Order getOrder(String orderNo);               
}
