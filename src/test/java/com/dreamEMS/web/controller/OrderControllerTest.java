/**
 * @author min gyeong
 * @since 2017. 5. 11.
 * @version 1.0
 */
package com.dreamEMS.web.controller;

import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;

import com.dreamEMS.Application;
import com.dreamEMS.model.entity.Order;
import com.dreamEMS.service.OrderService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author min gyeong
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Application.class)
@WebAppConfiguration
@AutoConfigureMockMvc
public class OrderControllerTest {

	@Autowired
    private MockMvc mockMvc;
	@Autowired private OrderService orderService;
	
	private String jsonStringFromObject(Object object) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(object);
    }
	
	@Test
	@WithMockUser(roles="ADMIN")
    public void test() throws Exception {
		/*long id = 1;
        Article article = articlesService.getArticle(id);
        String jsonString = this.jsonStringFromObject(article);
         mockMvc.perform(get("/api/articles/{id}", id))
                .andExpect(status().isOk())
                .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
                .andExpect(content().string(equalTo(jsonString)));
        */
		
/*		Article article = new Article();
        article.setTitle("testing create article");
        article.setContent("test content");

        Comment comment = new Comment();
        comment.setContent("test comment1");
        List<Comment> comments = new ArrayList<>();
        comments.add(comment);

        article.setComments(comments);

        String jsonString = this.jsonStringFromObject(article);

        MvcResult result = mockMvc.perform(post("/api/articles")
                .contentType(MediaType.APPLICATION_JSON)
                .content(jsonString))
                .andExpect(status().isOk())
                .andExpect(content().string(equalTo(jsonString))).andReturn();

        logger.info(result.getResponse().getContentAsString());*/
	}
	
	/**
	 * premiumCd = 31 일때 유효성 확인
	 * @throws Exception
	 */
	@Test
	@WithMockUser(roles="ADMIN")
    public void validateSuccess() throws Exception {
		
		this.mockMvc
				.perform(get("/order/validate").param("property", "premiumCd").param("premiumCd", "31"))
        		.andDo(print())
        		.andExpect(status().isOk())
        		.andExpect(content().string("false"));
    }
	
	/**
	 * premiumCd = 30 일때 유효성 확인
	 * @throws Exception
	 */
	@Test
	@WithMockUser(roles="ADMIN")
    public void validateError() throws Exception {
		this.mockMvc
		.perform(get("/order/validate").param("property", "premiumCd").param("premiumCd", "30"))
		.andDo(print())
		.andExpect(status().isOk())
		.andExpect(content().string("true"));
	}
	
	/**
	 * 접수 등록
	 * @throws Exception
	 */
	@Test
	@WithUserDetails(value = "test")
    public void postOrder() throws Exception {
		
		Order order = new Order();
		 order.setUserNo((long) 89);
		 order.setEmGubun("Merchandise");
		 order.setReceiveName("James Lee");
		 order.setReceiveTelNo("13172036918");
		 order.setCountryCd("CN");
		 order.setReceiveAddr3("St. temp 12");
		 order.setTotWeight("3000");
		 order.setContents("clocks");
		 order.setValue("100");
		 order.setSenderMail("sender@mail.com");
		 
		 order.setSender("Song Lee");
		 order.setSenderZipCode("402701");
		 order.setSenderAddr1("jaYng-dong 123");
		 order.setSenderAddr2("GwangJin, Seoul");
		 order.setSenderTelNo1("82");
		 order.setSenderTelNo2("2");
		 order.setSenderTelNo3("123");
		 order.setSenderTelNo4("4567");
		 order.setSenderMobile1("82");
		 order.setSenderMobile2("10");
		 order.setSenderMobile3("1234");
		 order.setSenderMobile4("4567");
		 order.setPremiumCd("31");
		 order.setEmEE("em");
		 

		 order.setReceiveMail("jlww@email.com");
		 /*
		 order.setReceiveZipCode("07803");
		 order.setReceiveAddr1("new jersey");
		 order.setReceiveAddr2("min hill");
		 order.setReceiveTelNo1("81"); 
		 order.setReceiveTelNo2("1245"); 
		 order.setReceiveTelNo3("4857"); 
		 order.setReceiveTelNo4("4563"); 
		 order.setNumber("1");
		 order.setWeight("2900");
		 order.setHsCode("9105100000");
		 order.setOrigin("KR");*/

	   	 order.setOrderDate(new Date());
	   	 
	   	 
	   	String jsonString = this.jsonStringFromObject(order);
		
		this.mockMvc
		.perform(post("/order")
				.contentType(MediaType.APPLICATION_JSON)
				.content(jsonString))
		.andDo(print())
		.andExpect(status().isOk())
		.andExpect(jsonPath("$.code", is(100)));
		//.andExpect(content(). string("true"));
	}
	
	/**
	 * ems(ADMIN) 일때 모든 접수정보를 가져옴
	 * @throws Exception
	 */
	@Test
	@WithUserDetails(value = "ems")
	public void adminHome() throws Exception {
		
        List<Order> article = orderService.getAllOrder();
        int count = article.size();

		this.mockMvc
		.perform(get("/order/list"))
		.andDo(print())
		.andExpect(status().isOk())
		.andExpect(model().attribute("orderList", hasSize(count)));
	}
	
	/**
	 * test(USER) 일때 해당 유저의 접수정보만 가져옴
	 * @throws Exception
	 */
	@Test
	@WithUserDetails(value = "test")
	public void userOrderList() throws Exception {
		
		List<Order> article = orderService.getAllOrder();
        int count = article.size();
        String jsonString = this.jsonStringFromObject(article);

		this.mockMvc
		.perform(get("/order/list"))
		.andDo(print())
		.andExpect(status().isOk())
		//.andExpect(model().attribute("orderList", hasSize(count)));
		.andExpect(content().json(jsonString));
		
	}
	
	/**
	 * test(USER) 일때 해당 유저의 접수정보만 가져옴
	 * @throws Exception
	 */
	@Test
	@WithUserDetails(value = "test")
	public void userprintOrderList() throws Exception {
		
		List<Order> article = orderService.getAllPrintOrder();
        int count = article.size();
        String jsonString = this.jsonStringFromObject(article);

		this.mockMvc
		.perform(get("/order/printList"))
		.andDo(print())
		.andExpect(status().isOk())
		//.andExpect(model().attribute("orderList", hasSize(count)));
		.andExpect(content().json(jsonString));
		
	}
	
	
	

}
