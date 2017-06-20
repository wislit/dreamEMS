package com.dreamEMS.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import com.dreamEMS.model.dto.CustomUserDetails;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dreamEMS.model.dto.Msg;
import com.dreamEMS.model.entity.Book;
import com.dreamEMS.model.entity.EmsTotProcCmd;
import com.dreamEMS.model.entity.Order;
import com.dreamEMS.model.entity.TestTb;
import com.dreamEMS.service.ApiService;
import com.dreamEMS.service.OrderService;

import lombok.extern.apachecommons.CommonsLog;

/**
 * 접수
 * @author 
 */
@Controller
@CommonsLog
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private ApiService apiService;

    @Autowired
    private OrderService orderService;

    /*@Autowired
    public OrderController(ApiService apiService) { this.apiService = apiService; }*/




	@GetMapping("/home")
    public String home(Model model) {
		
		//https://www.mkyong.com/spring-security/get-current-logged-in-username-in-spring-security/
		return "tiles.order.orderHome";
    }
	
	@GetMapping("/list")
    public ResponseEntity<?> list() {
        Long userNo = this.getUserNo();
		List<Order> orderList = orderService.getAllOrder(userNo);
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(orderList);
    }
	
	@GetMapping("/printList")
    public ResponseEntity<?> printList() {
        Long userNo = this.getUserNo();
		List<Order> printOrderList = orderService.getAllPrintOrder(userNo);
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(printOrderList);
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
    public ResponseEntity<?> getOrderNo(@PathVariable String orderNo) {
    	Order order = orderService.getOrder(orderNo);
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(order);
    }

    @PostMapping
    public ResponseEntity<?> postOrder(@Valid @RequestBody Order order, Errors errors) {
    	
    	/*log.info(order);
    	log.info(new Date().toString());
    	Date d = new Date();
        
        String s = d.toString();
        log.info("현재날짜 : "+ s);
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        log.info("현재날짜 : "+ sdf.format(d));*/
       
        //If error, just return a 400 bad request, along with the error message
        /*if (errors.hasErrors()) {

			// get all errors
            result.setMsg(errors.getAllErrors()
				.stream()
				.map(x -> x.getDefaultMessage())
				.collect(Collectors.joining(",")));

            return ResponseEntity.badRequest().body(result);

        }*/
        if (errors.hasErrors()) {
            List<FieldError> errorList = errors.getFieldErrors();
            List<String> fieldList = new ArrayList<String>(); 
            for (FieldError e : errorList){
            	fieldList.add(e.getField());
            }
            
            return ResponseEntity.badRequest().body(fieldList);
            
            //field
            
            		//bindingResult.getFieldErrors();
            /*List<String> message = new ArrayList<>();
            error.setCode(-2);
            for (FieldError e : errors){
                message.add("@" + e.getField().toUpperCase() + ":" + e.getDefaultMessage());
            }
            error.setMessage("Update Failed");
            error.setCause(message.toString());
            return error;*/
        }
        
        //db
        orderService.saveOrder(order);

        return ResponseEntity.ok(Msg.SUCCESS);
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
    public ResponseEntity<?> deleteOrder(@PathVariable String orderNo) {
    	boolean rt =  orderService.deleteOrder(orderNo);
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(rt);
    }



    @GetMapping("/test")
    public ResponseEntity<?> test() {

        Map<String,Object> resultMap = new HashedMap();
//        List<Nation> nationList = apiService.getNationList(ApiConstant.PREMIUMCD_EMS);
//        List<EmsSearchNewEngZipCodeInfo> zipCodeInfoList = apiService.getEmsSearchNewEngZipCodeInfoList("이문로",5,1);
//        List<JuDo> juDoList = apiService.getJuDoList("CN");
//        List<SiDo> siDoList = apiService.getSiDoList("CN","BEIJING");
//        List<ZipCode> zipCodeList = apiService.getZipCodeList("CN","BEIJING","BEIJING");
//        EmsTotProcCmd emsTotProcCmd = apiService.getEmsTotProcCmd(ApiConstant.PREMIUMCD_EMS,"CN", 30000, "n", 0, "em");
//        String custno = apiService.getCustno();
//        String apprno = apiService.getApprno(custno);

        List<TestTb> tbList = orderService.getTestTbList();

//        resultMap.put("nationList",nationList);
//        resultMap.put("zipCodeInfoList",zipCodeInfoList);
//        resultMap.put("juDoList",juDoList);
//        resultMap.put("siDoList",siDoList);
//        resultMap.put("zipCodeList",zipCodeList);
//        resultMap.put("emsTotProcCmd",emsTotProcCmd);
//        resultMap.put("custno",custno);
//        resultMap.put("apprno",apprno);
        resultMap.put("tbList",tbList);

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(resultMap);
    }
    
    @ResponseBody
    @RequestMapping(value = "/excelUpload", method = RequestMethod.POST)
    public Object excelUploadAjax(MultipartHttpServletRequest request)  throws Exception{
        MultipartFile excelFile =request.getFile("excelFile");
        System.out.println("엑셀 파일 업로드 컨트롤러");
        if(excelFile==null || excelFile.isEmpty()){
            throw new RuntimeException("엑셀파일을 선택 해 주세요.");
        }
        
        File destFile = new File("D:\\"+excelFile.getOriginalFilename());
        try{
            excelFile.transferTo(destFile);
        }catch(IllegalStateException | IOException e){
            throw new RuntimeException(e.getMessage(),e);
        }
        
        List<Order> orders = orderService.excelUpload(destFile);
        
        //FileUtils.delete(destFile.getAbsolutePath());
        
        return orders;
        
        /*ModelAndView view = new ModelAndView();
        view.setViewName("");
        return view;*/
    }
    
    @ResponseBody
    @RequestMapping(value = "/validate/{property}")
    public Object validate(@PathVariable("property") String property, 
    					@RequestBody Order value)  throws Exception{
        
        Boolean isError = orderService.validateProperty(property, value);
        return isError;
    }
    
    @ResponseBody
    @RequestMapping(value = "/proc/{countryCd}/{totWeight}")
    public Object validate(@PathVariable("countryCd") String countryCd, 
    						@PathVariable("totWeight") int totWeight)  throws Exception{
        
    	EmsTotProcCmd emsTotProcCmd = apiService.getEmsTotProcCmd("31", countryCd, totWeight, "N", 0, "ee");
        		
        return emsTotProcCmd.getEmsTotProc();
    }



    private Long getUserNo(){
        CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        Long userNo = user.getNo(); //get logged in username
        if (user.getAuthorities().contains(new SimpleGrantedAuthority("ADMIN"))) {
            userNo = null;
        }
        return userNo;
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
