package com.dreamEMS.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.datatables.mapping.DataTablesInput;

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
	List<Order> getAllOrder(Map input, DataTablesInput paging);               
	List<Order> getAllPrintOrder(Map input, DataTablesInput paging);
	int getTotCount();
	
	Order getOrder(String orderNo);               
	List<Order> getOrders(List<String> orderNoList);               
}
