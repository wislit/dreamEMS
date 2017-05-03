package com.dreamEMS.service;

import com.dreamEMS.model.entity.TestTb;
import java.util.List;
import java.io.File;

/**
 * Created by MINK on 2017-05-03.
 */
public interface OrderService {

    List<TestTb> getTestTbList();
	public void excelUpload(File destFile);
}
