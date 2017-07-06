package com.dreamEMS.service;

import java.io.File;
import java.util.List;

import com.dreamEMS.model.dto.PaginatedParam;
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
	boolean updatePrintFlag(List<String> orders);               
	List<Order> getAllOrder(PaginatedParam input);               
	List<Order> getAllPrintOrder(PaginatedParam input);
	int getTotCount();
	
	Order getOrder(String orderNo);               
	List<Order> getOrders(List<String> orderNoList);
	/**
	 * @param order
	 * @return
	 */
	boolean saveOrderNotSession(Order order);               
}
