package com.dreamEMS.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dreamEMS.service.OrderService;
import com.dreamEMS.util.ExcelRead;
import com.dreamEMS.util.ExcelReadOption;

/**
 * @author Xiaoyue Xiao
 */
@Service
public class OrderServiceImpl implements OrderService {

	@Override
	public void excelUpload(File destFile) {
		ExcelReadOption excelReadOption = new ExcelReadOption();
        excelReadOption.setFilePath(destFile.getAbsolutePath());
        excelReadOption.setOutputColumns("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O");
        excelReadOption.setStartRow(4);
        
        
        List<Map<String, String>>excelContent = ExcelRead.read(excelReadOption);
        
        for(Map<String, String> article: excelContent){
            System.out.println(article.get("A"));
            System.out.println(article.get("B"));
            System.out.println(article.get("C"));
            System.out.println(article.get("D"));
            System.out.println(article.get("E"));
            System.out.println(article.get("F"));
		
        }
	}

}
