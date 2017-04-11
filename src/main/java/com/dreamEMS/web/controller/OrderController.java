package com.dreamEMS.web.controller;

import com.dreamEMS.model.entity.Nation;
import com.dreamEMS.service.ApiService;
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

import com.dreamEMS.model.entity.Book;

import java.util.List;

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

        List<Nation> nationList = apiService.getNationList();

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(nationList);
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
