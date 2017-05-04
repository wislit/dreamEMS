package com.dreamEMS.model.entity;

import java.io.Serializable;

import javax.validation.constraints. NotNull;

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

    /**
    *	DreamEMS Templete 필수항목
    */
    @NotNull
    private String premiumCd;		//우편물구분(2)
    private String receiveName;		//수취인명(35)
    private String receiveTelNo;	//수취인 전체 전화번호(40)
    private String countryCd;		//도착국가코드(2)
    private String receiveZipCode;	//도착지 우편번호(20) *US만 필수 나머지 선택항목
    private String receiveAddr3;	//도착지 주소3(300 상세)
    private String totWeight;		//총중량(7)
    private String contents;		//내용품명(32)
    private String value;			//가격(15)
    
    
    
    /**
     *	DreamEMS Templete 선택항목
     */
    private String number;			//개수(7)
    private String hsCode;			//HS CODE(10)
    private String orderPrsnZipCd;	//주문자 우편번호(6)
    private String orderPrsnAddr2;	//주문자 주소2(140)
    private String orderPrsnNm;		//주문자명(40)
    private String orderPrsnTelNo;	//주문자 전체 전화번호(40)
    
    /**
     *	우체국 Templete 항목
     */
    private String custNo;			//고객번호(10)
    private String apprNo;			//계약승인번호(10)
    private String sender;			//발송인명(35)
    private String senderZipCode;	//발송인 우편번호(6)
    private String senderAddr1;		//발송인 주소1(60 상세)
    private String senderAddr2;		//발송인 주소2(140 기본)
    private String senderTelNo1;	//발송인 전화번호1(4)
    private String senderTelNo2;	//발송인 전화번호2(4)
    private String senderTelNo3;	//발송인 전화번호3(4)
    private String senderTelNo4;	//발송인 전화번호4(4)
    private String senderMobile1;	//발송인 이동통신1(4)
    private String senderMobile2;	//발송인 이동통신2(4)
    private String senderMobile3;	//발송인 이동통신3(4)
    private String senderMobile4;	//발송인 이동통신4(4)
    private String senderMail;		//발송인 이메일(40)
    private String sndMessage;		//배송 메세지(100)
    
    private String receiveAddr1;	//도착지 주소1(140 주/도)
    private String receiveAddr2;	//도착지 주소2(200 시/군)
    
    private String receiveTelNo1;	//수취인 전화번호1(4)
    private String receiveTelNo2;	//수취인 전화번호2(4)
    private String receiveTelNo3;	//수취인 전화번호3(4)
    private String receiveTelNo4;	//수취인 전화번호4(4)
    
    private String receiveMail;		//수취인 이메일(40)
    
    private String orderNo;			//업체측 주문번호(50) *UNIQUE KEY
    private String emEE;			//국제우편물종류코드(2)
    
    private String boYN;			//보험가입여부(1)
    private String boPrc;			//보험금(15)
    
    private String orderPrsnAddr1;	//주문자 주소1(60)
   
    private String orderPrsnTelNNo;	//주문자 전화번호1(4)
    private String orderPrsnTelFNo;	//주문자 전화번호2(4)
    private String orderPrsnTelMNo;	//주문자 전화번호3(4)
    private String orderPrsnTelLNo;	//주문자 전화번호4(4)
    
    private String orderPrsnHTelFNo;//주문자 이동통신1(4)
    private String orderPrsnHTelMNo;//주문자 이동통신2(4)
    private String orderPrsnHTelLNo;//주문자 이동통신3(4)
    private String orderPrsnHTelNo;	//주문자 전체 이동통신(40)
    private String orderPrsnEmailId;//주문자 이메일(40)
    private String weight;			//무게(10)
    private String orgin;			//생산지(20)
    private String emGubun;			//배송물구분(12)
    private String ecommerceYN;		//전자상거래여부(1)
    private String bizRegNo;		//사업자번호(10)
    private String exportSendPrsnNm;//수출화주 성명 또는 상호(35)
    private String exportSendPrsnAddr;//수출화주 주소(105)
    private String modelNo;			//모델명(100)
    private String xprtNo1;			//수출신고번호1(15)
    private String xprtNo2;			//수출신고번호2(15)
    private String xprtNo3;			//수출신고번호3(15)
    private String xprtNo4;			//수출신고번호4(15)
    private String recomporegipocd;	//추천우체국기호
    
    
    
    
    
    
}
