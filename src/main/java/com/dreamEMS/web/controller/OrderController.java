package com.dreamEMS.web.controller;

import com.dreamEMS.constant.ApiConstant;
import com.dreamEMS.model.entity.*;
import com.dreamEMS.service.ApiService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

/**
 * 접수
 * @author 
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    private ApiService apiService;

    @Autowired
    public OrderController(ApiService apiService) { this.apiService = apiService; }


	@GetMapping("/home")
    public String home() {
		return "tiles.order.orderHome";
    }
	@GetMapping
    public String order() {
		return "tiles.order.order";
    }
	@GetMapping("/excel")
    public String excel() {
		return "tiles.order.orderExcel";
    }

    @GetMapping("/{orderNo}")
    public ResponseEntity<?> getOrderNo(@PathVariable Long orderNo) {
		return null;
    	/*return bookService
                .getBookById(bookId)
                .map(ResponseEntity::ok)
                .orElseThrow(() -> new ResourceNotFoundException()
                        .setResourceName(ResourceNameConstant.BOOK)
                        .setId(bookId));*/
    }

    @PostMapping
    public ResponseEntity<?> postOrder(@RequestBody Book book) {
       /* bookService.saveBook(book);

        URI location = ServletUriComponentsBuilder
                .fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(book.getId())
                .toUri();

        return ResponseEntity
                .created(location)
                .body(book);
*/
    	return null;
    }
    
    @PutMapping("/{orderNo}")
    public ResponseEntity<?> putOrder(@PathVariable Long orderNo, @RequestBody Book book) {
        assertBookExist(orderNo);

        //bookService.modifyBookOnNameById(book.setId(bookId));

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(book);
    }

    @DeleteMapping("/{orderNo}")
    public ResponseEntity<?> deleteOrder(@PathVariable Long orderNo) {
        /*assertBookExist(bookId);

        bookService.deleteBookById(bookId);

        return ResponseEntity
                .noContent()
                .build();*/
    	return null;
    }



    @GetMapping("/test")
    public ResponseEntity<?> test() {

        Map<String,Object> resultMap = new HashedMap();
        List<Nation> nationList = apiService.getNationList(ApiConstant.PREMIUMCD_EMS);
        List<EmsSearchNewEngZipCodeInfo> zipCodeInfoList = apiService.getEmsSearchNewEngZipCodeInfoList("이문로",5,1);
        List<JuDo> juDoList = apiService.getJuDoList("CN");
        List<SiDo> siDoList = apiService.getSiDoList("CN","BEIJING");
        List<ZipCode> zipCodeList = apiService.getZipCodeList("CN","BEIJING","BEIJING");
        EmsTotProcCmd emsTotProcCmd = apiService.getEmsTotProcCmd(ApiConstant.PREMIUMCD_EMS,"CN", 30000, "n", 0, "em");

        resultMap.put("nationList",nationList);
        resultMap.put("zipCodeInfoList",zipCodeInfoList);
        resultMap.put("juDoList",juDoList);
        resultMap.put("siDoList",siDoList);
        resultMap.put("zipCodeList",zipCodeList);
        resultMap.put("emsTotProcCmd",emsTotProcCmd);

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(resultMap);
    }


    /********************************** HELPER METHOD **********************************/
    private void assertBookExist(Long orderNo) {
        /*bookService
                .getBookById(bookId)
                .orElseThrow(() -> new ResourceNotFoundException()
                        .setResourceName(ResourceNameConstant.BOOK)
                        .setId(bookId));*/
    }

}
