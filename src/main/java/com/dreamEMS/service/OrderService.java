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
	boolean deleteOrder(Order order);               
	boolean getOrder(String orderNo);
	List<Order> getAllOrder();               
	List<Order> getAllPrintOrder();               
	
}
