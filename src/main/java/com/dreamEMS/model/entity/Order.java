package com.dreamEMS.model.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

/** 사용자 클래스
 * @author min gyeong
 */
@Accessors(chain = true)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Order implements Serializable {

    private static final long serialVersionUID = 7698862379923111158L;

    
    private Map<String, Boolean> errorList = new HashMap<String, Boolean>();
    /**
    *	DreamEMS Templete 필수항목
    */
    
    private Long userNo;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss" , timezone ="GMT+9")
    private Date orderDate;			//접수일
    private String postCharge;
    private String emsCharge;
    @NotNull
    @Pattern(regexp = "(31|32)")
    private String premiumCd;		//우편물구분(2) 31:EMS 32:프리미엄
    @NotNull
    @Pattern(regexp = "[\\p{Alnum}\\p{IsHan}\\.\\,\\_\\-\\/\\s]{1,35}")
    private String receiveName;		//수취인명(35)
    @NotNull
    @Pattern(regexp = "[\\d]{1,40}")
    private String receiveTelNo;	//수취인 전체 전화번호(40)
    @NotNull
    @Pattern(regexp = "[A-Z][A-Z]")
    private String countryCd;		//도착국가코드(2)
    @Pattern(regexp = "[\\d\\-]{0,20}")
    private String receiveZipCode;	//도착지 우편번호(20) *US만 필수 나머지 선택항목
    @NotNull
    @Pattern(regexp = "([\\p{Alnum}\\.\\,\\_\\-\\/\\s]{1,300}|[\\p{IsHan}\\d\\.\\,\\_\\-\\/\\s]{1,140})")
    private String receiveAddr3;	//도착지 주소3(300 상세)
    @NotNull
    @Pattern(regexp = "[\\d]{1,7}")
    private String totWeight;		//총중량(7)
    @NotNull
    @Pattern(regexp = "[\\p{Alpha}\\.\\,\\_\\-\\/\\s\\;]{1,32}")
    private String contents;		//내용품명(32)
    @NotNull
    @Pattern(regexp = "[\\d\\;]{1,7}")
    private String value;			//가격(15)
    
    
    /**
     *	DreamEMS Templete 선택항목
     */
    @Pattern(regexp = "[\\d\\;]{0,7}")
    private String number;			//개수(7)
    @Pattern(regexp = "[\\d\\;]{0,10}")
    private String hsCode;			//HS CODE(10)
    @Pattern(regexp = "[\\d]{5}")
    private String orderPrsnZipCd;	//주문자 우편번호(6)
    @Pattern(regexp = "([\\p{Alnum}\\.\\,\\_\\-\\/\\s]{1,140})")
    private String orderPrsnAddr2;	//주문자 주소2(140)
    @Pattern(regexp = "[\\p{Alnum}\\.\\,\\_\\-\\/\\s]{1,35}")
    private String orderPrsnNm;		//주문자명(40)
    @Pattern(regexp = "[\\d]{1,40}")
    private String orderPrsnTelNo;	//주문자 전체 전화번호(40)
    
    /**
     * 추가적으로..
     */
    @Pattern(regexp = "[\\p{Alpha}\\.\\,\\_\\-\\/\\s]{1,32}")
    private String contents1;		//내용품명(32)
    @Pattern(regexp = "[\\d]{1,7}")
    private String value1;			//가격(15)
    @Pattern(regexp = "[\\d]{0,7}")
    private String number1;			//개수(7)
    @Pattern(regexp = "[\\d\\;]{0,10}")
    private String weight1;			//무게(10)
    @Pattern(regexp = "[\\d]{0,10}")
    private String hsCode1;			//HS CODE(10)
    @Pattern(regexp = "[\\p{Alpha}\\.\\,\\_\\-\\/\\s]{0,32}")
    private String contents2;		//내용품명(32)
    @Pattern(regexp = "[\\d]{1,7}")
    private String value2;			//가격(15)
    @Pattern(regexp = "[\\d]{0,7}")
    private String number2;			//개수(7)
    @Pattern(regexp = "[\\d\\;]{0,10}")
    private String weight2;			//무게(10)
    @Pattern(regexp = "[\\d]{0,10}")
    private String hsCode2;			//HS CODE(10)
    @Pattern(regexp = "[\\p{Alpha}\\.\\,\\_\\-\\/\\s]{0,32}")
    private String contents3;		//내용품명(32)
    @Pattern(regexp = "[\\d]{1,7}")
    private String value3;			//가격(15)
    @Pattern(regexp = "[\\d]{0,7}")
    private String number3;			//개수(7)
    @Pattern(regexp = "[\\d\\;]{0,10}")
    private String weight3;			//무게(10)
    @Pattern(regexp = "[\\d]{0,10}")
    private String hsCode3;			//HS CODE(10)
    @Pattern(regexp = "[\\p{Alpha}\\.\\,\\_\\-\\/\\s]{0,32}")
    private String contents4;		//내용품명(32)
    @Pattern(regexp = "[\\d]{1,7}")
    private String value4;			//가격(15)
    @Pattern(regexp = "[\\d]{0,7}")
    private String number4;			//개수(7)
    @Pattern(regexp = "[\\d\\;]{0,10}")
    private String weight4;			//무게(10)
    @Pattern(regexp = "[\\d]{0,10}")
    private String hsCode4;			//HS CODE(10)
    
    
    /**
     *	우체국 Templete 항목
     */
    @Pattern(regexp = "([\\p{Alnum}]{1,50})")
    private String orderNo;			//업체측 주문번호(50) *UNIQUE KEY
    /*@Email
    @Pattern(regexp = "[\\p{Alnum}\\.\\@\\<\\>\\-\\_]{1,40}")*/
    private String senderMail = "sender@mail.com";		//발송인 이메일(40)
    /*@Email
    @Pattern(regexp = "[\\p{Alnum}\\.\\@\\<\\>\\-\\_]{1,40}")*/
    private String receiveMail = "receiver@mail.com";		//수취인 이메일(40)
    
    
    @Pattern(regexp = "[\\d]{10}")
    private String custNo;			//고객번호(10)
    @Pattern(regexp = "[\\p{Alnum}]{10}")
    private String apprNo;			//계약승인번호(10)
    @Pattern(regexp = "[\\p{Alnum}\\.\\,\\_\\-\\/\\s]{1,35}")
    private String sender;			//발송인명(35)
    @Pattern(regexp = "[\\d]{5,6}")
    private String senderZipCode;	//발송인 우편번호(6)
    @Pattern(regexp = "([\\p{Alnum}\\p{IsHangul}\\.\\,\\_\\-\\/\\s]{1,60})")
    private String senderAddr1;		//발송인 주소1(60 상세)
    @Pattern(regexp = "([\\p{Alnum}\\p{IsHangul}\\.\\,\\_\\-\\/\\s]{1,140})")
    private String senderAddr2;		//발송인 주소2(140 기본)
    @Pattern(regexp = "[\\d]{1,4}")
    private String senderTelNo1;	//발송인 전화번호1(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String senderTelNo2;	//발송인 전화번호2(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String senderTelNo3;	//발송인 전화번호3(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String senderTelNo4;	//발송인 전화번호4(4)
    private String senderTelNo;		//발송인 전화번호
    @Pattern(regexp = "[\\d]{1,4}")
    private String senderMobile1;	//발송인 이동통신1(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String senderMobile2;	//발송인 이동통신2(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String senderMobile3;	//발송인 이동통신3(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String senderMobile4;	//발송인 이동통신4(4)
    
    @Pattern(regexp = "[\\p{Alnum}\\.\\,\\_\\-\\/\\s]{0,100}")
    private String sndMessage;		//배송 메세지(100)
    
    @Pattern(regexp = "([\\p{Alnum}\\.\\,\\_\\-\\/\\s]{1,140}|[\\p{IsHan}\\d\\.\\,\\_\\-\\/\\s]{1,140})")
    private String receiveAddr1;	//도착지 주소1(140 주/도)
    @Pattern(regexp = "([\\p{Alnum}\\.\\,\\_\\-\\/\\s]{1,200}|[\\p{IsHan}\\d\\.\\,\\_\\-\\/\\s]{1,200})")
    private String receiveAddr2;	//도착지 주소2(200 시/군)
    
    @Pattern(regexp = "[\\d]{1,4}")
    private String receiveTelNo1;	//수취인 전화번호1(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String receiveTelNo2;	//수취인 전화번호2(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String receiveTelNo3;	//수취인 전화번호3(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String receiveTelNo4;	//수취인 전화번호4(4)
    
    @Pattern(regexp = "(ee|em)")
    private String emEE;			//국제우편물종류코드(2) ee:서류 em:비서류
    @Pattern(regexp = "(Y|N)")
    private String boYN = "N";			//보험가입여부(1)
    @Pattern(regexp = "[\\d]{1,15}")
    private String boPrc;			//보험금(15)
    
    @Pattern(regexp = "([\\p{Alnum}\\.\\,\\_\\-\\/\\s]{1,60})")
    private String orderPrsnAddr1;	//주문자 주소1(60)
   
    @Pattern(regexp = "[\\d]{1,4}")
    private String orderPrsnTelNNo;	//주문자 전화번호1(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String orderPrsnTelFNo;	//주문자 전화번호2(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String orderPrsnTelMNo;	//주문자 전화번호3(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String orderPrsnTelLNo;	//주문자 전화번호4(4)
    
    @Pattern(regexp = "[\\d]{1,4}")
    private String orderPrsnHTelFNo;//주문자 이동통신1(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String orderPrsnHTelMNo;//주문자 이동통신2(4)
    @Pattern(regexp = "[\\d]{1,4}")
    private String orderPrsnHTelLNo;//주문자 이동통신3(4)
    @Pattern(regexp = "[\\d\\-]{1,40}")
    private String orderPrsnHTelNo;	//주문자 전체 이동통신(40)
    @Email
    @Pattern(regexp = "[\\p{Alnum}\\.\\@\\<\\>\\-\\_]{1,40}")
    private String orderPrsnEmailId;//주문자 이메일(40)
    
    @Pattern(regexp = "[\\d\\;]{0,10}")
    private String weight;			//무게(10)
    @Pattern(regexp = "[A-Z\\;]{0,20}")
    private String origin;			//생산지(20)
    @Pattern(regexp = "[\\p{Alpha}\\;]{1,40}")
    private String emGubun;			//배송물구분(12)
    @Pattern(regexp = "(Y|N)")
    private String ecommerceYN;		//전자상거래여부(1)
    @Pattern(regexp = "[\\d\\;]{10}")
    private String bizRegNo;		//사업자번호(10)
    @Pattern(regexp = "[\\p{Alnum}\\.\\,\\_\\-\\/\\s]{1,35}")
    private String exportSendPrsnNm;//수출화주 성명 또는 상호(35)
    @Pattern(regexp = "([\\p{Alnum}\\p{IsHangul}\\.\\,\\_\\-\\/\\s]{1,105})")
    private String exportSendPrsnAddr;//수출화주 주소(105)
    @Pattern(regexp = "([\\p{Alnum}\\p{IsHangul}\\.\\,\\_\\-\\/\\s\\;]{0,100})")
    private String modelNo;			//모델명(100)
    @Pattern(regexp = "([\\p{Alnum}]{0,15})")
    private String xprtNo1;			//수출신고번호1(15)
    @Pattern(regexp = "([\\p{Alnum}]{0,15})")
    private String xprtNo2;			//수출신고번호2(15)
    @Pattern(regexp = "([\\p{Alnum}]{0,15})")
    private String xprtNo3;			//수출신고번호3(15)
    @Pattern(regexp = "([\\p{Alnum}]{0,15})")
    private String xprtNo4;			//수출신고번호4(15)
    @Pattern(regexp = "[\\d\\;]{0,5}")
    private String recomporegipocd;	//추천우체국기호    
    
    private String countryName;		//도착국가명
    
    
    /**
     	우체국 등록시 리턴받는 항목
     */
    private String reqNo;                   // 접수번호
    private String receiveSeq;              // 주문번호
    private String regiNo;                  // 송장번호
    private String preRecevPrc;             // 우편요금
    private String prcPayMethCd;            // 요금납부방법 - 현금(10)/후납(12)
    private String treatPoRegiPoCd;         // 우편용국기호
    private String treatPoRegiPoEngNm;      // 우체국영문명
   
    public void addError(String err) {
		this.errorList.put(err, true);
	}
    
    private boolean printFlag = false;  // 송장출력 유무

    private boolean sendFlag = false;   // 발송처리 유무
    
    public void setContents(String content){
    	content = content.replaceAll("\\;{1,3}$" , "");
    	this.contents = content;
    }
    
    public void setValue(String value){
    	value = value.replaceAll("\\;{1,3}$" , "");
    	this.value = value;
    }
    
    public void setNumber(String number){
    	
    	if( number != null){
    		number = number.replaceAll("\\;{1,3}$" , "");
    		this.number = number;
    	}
    }
    
    public void setHsCode(String hsCode){
    	
    	if( hsCode != null){
    		hsCode = hsCode.replaceAll("\\;{1,3}$" , "");
    		this.hsCode = hsCode;
    	}
    }
    
    
}
