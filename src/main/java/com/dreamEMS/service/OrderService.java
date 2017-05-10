package com.dreamEMS.service;

import com.dreamEMS.model.entity.Order;
import com.dreamEMS.model.entity.TestTb;
import java.util.List;
import java.io.File;

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
	
}
