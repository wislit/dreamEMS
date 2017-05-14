package com.dreamEMS.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.dreamEMS.constant.ApiConstant;
import com.dreamEMS.model.dto.Errors;
import com.dreamEMS.model.entity.EmsSearchNewEngZipCodeInfo;
import com.dreamEMS.model.entity.EmsTotProcCmd;
import com.dreamEMS.model.entity.JuDo;
import com.dreamEMS.model.entity.Nation;
import com.dreamEMS.model.entity.Order;
import com.dreamEMS.model.entity.OrderResponse;
import com.dreamEMS.model.entity.SEED128;
import com.dreamEMS.model.entity.SiDo;
import com.dreamEMS.model.entity.ZipCode;
import com.dreamEMS.service.ApiService;
import com.dreamEMS.web.exception.APIException;
import com.dreamEMS.web.exception.DreamEMSException;

import lombok.extern.apachecommons.CommonsLog;

/**
 * Created by wislit on 2017. 4. 11..
 */
@CommonsLog
@Service
public class ApiServiceImpl implements ApiService {

    @Override
    public String callApi(String apiUrl, String method) {

        String xmlString = "";
        try{

            URL url = new URL(apiUrl);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod(method);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();

            xmlString = response.toString();

        }catch (Exception e){
            e.printStackTrace();
        }

        return xmlString;
    }

    @Override
    public String getEncryptData(String seedKey, String plainStr) {
        SEED128 seed = new SEED128();

        String encryptStr = "";                     //암호문

        if (!plainStr.equals("")) {
            byte[] pbUserKey = seedKey.getBytes();
            byte[] dataget = plainStr.getBytes();

            //평문 암호화
            encryptStr = seed.getEncryptData(seedKey, plainStr);

        }

        return encryptStr;
    }

    @Override
    public String getDecryptData(String seedKey, String encryptStr) {
        SEED128 seed = new SEED128();
        String plainStr = "";                       //평문

        if (!encryptStr.equals("")) {
            //암호문 복호화
            plainStr = seed.getDecryptData(seedKey, encryptStr);
        }
        return plainStr;
    }



    @Override
    public List<Nation> getNationList(String premiumCd) {

        List<Nation> nationList = new ArrayList<>();
        StringBuffer apiUrl = new StringBuffer();
        apiUrl.append("http://eship.epost.go.kr/api.RetrieveNationListRequest.ems?regkey=");
        apiUrl.append(ApiConstant.REGKEY);
        apiUrl.append("&premiumcd=");
        apiUrl.append(premiumCd!=null?premiumCd:ApiConstant.PREMIUMCD_EMS);

        try {
            String xmlStr = this.callApi(apiUrl.toString(),"GET");
            InputSource is = new InputSource(new StringReader(xmlStr));
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
            //최상위 노드 찾기
            Element element = doc.getDocumentElement();
            //원하는 태그 찾아오기
            NodeList items1 = element.getElementsByTagName("nationcd");
            NodeList items2 = element.getElementsByTagName("nationnm");
            NodeList items3 = element.getElementsByTagName("nationfn");
            NodeList items4 = element.getElementsByTagName("prcapplyareacd");
            //데이터 개수 찾아오기
            int n = items1.getLength();
            for (int i=0; i<n; i++){
                Nation nation = new Nation();
                /*
                Node item1 = items1.item(i);
                Node text1 = item1.getFirstChild();
                String itemValue1 = text1.getNodeValue();
                nation.setNationCd(itemValue1);
                */
                nation.setNationCd(items1.item(i).getFirstChild().getNodeValue());
                nation.setNationNm(items2.item(i).getFirstChild().getNodeValue());
                nation.setNationFn(items3.item(i).getFirstChild().getNodeValue());
                nation.setPrcApplyAreaCd(items4.item(i).getFirstChild().getNodeValue());

                nationList.add(nation);
            }

        } catch (Exception e){
            e.printStackTrace();
            throw new DreamEMSException(Errors.SERVER_INTERNAL_ERROR, "Error from [ ApiServiceImpl.getNationList ]");
        }

        return nationList;
    }

    @Override
    public List<EmsSearchNewEngZipCodeInfo> getEmsSearchNewEngZipCodeInfoList(String searchText, int countPerPage, int currentPage) {
        List<EmsSearchNewEngZipCodeInfo> zipCodeInfoList = new ArrayList<>();
        StringBuffer apiUrl = new StringBuffer();
        apiUrl.append("http://eship.epost.go.kr/api.EmsSearchNewEngZipCodeInfo.ems?regkey=");
        apiUrl.append(ApiConstant.REGKEY);
        apiUrl.append("&searchText=");
        apiUrl.append(searchText!=null?searchText:"");
        apiUrl.append("&countPerPage=");
        apiUrl.append(countPerPage);
        apiUrl.append("&currentPage=");
        apiUrl.append(currentPage);

        try {
            String xmlStr = this.callApi(apiUrl.toString(),"GET");
            InputSource is = new InputSource(new StringReader(xmlStr));
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
            //최상위 노드 찾기
            Element element = doc.getDocumentElement();
            //원하는 태그 찾아오기
            NodeList items1 = element.getElementsByTagName("zipcode");
            NodeList items2 = element.getElementsByTagName("addr");
            NodeList items3 = element.getElementsByTagName("engaddr");
            NodeList items4 = element.getElementsByTagName("totalCount");
            NodeList items5 = element.getElementsByTagName("totalPage");
            NodeList items6 = element.getElementsByTagName("countPerPage");
            NodeList items7 = element.getElementsByTagName("currentPage");
            //데이터 개수 찾아오기
            int n = items1.getLength();
            for (int i=0; i<n; i++){
                EmsSearchNewEngZipCodeInfo info = new EmsSearchNewEngZipCodeInfo();

                info.setZipCode(items1.item(i).getFirstChild().getNodeValue());
                info.setAddr(items2.item(i).getFirstChild().getNodeValue());
                info.setEngAddr(items3.item(i).getFirstChild().getNodeValue());

                info.setTotalCount(Integer.parseInt(items4.item(0).getFirstChild().getNodeValue()));
                info.setTotalPage(Integer.parseInt(items5.item(0).getFirstChild().getNodeValue()));
                info.setCountPerPage(Integer.parseInt(items6.item(0).getFirstChild().getNodeValue()));
                info.setCurrentPage(Integer.parseInt(items7.item(0).getFirstChild().getNodeValue()));
                zipCodeInfoList.add(info);
            }

        } catch (Exception e){
            e.printStackTrace();
            throw new DreamEMSException(Errors.SERVER_INTERNAL_ERROR, "Error from [ ApiServiceImpl.getEmsSearchNewEngZipCodeInfoList ]");
        }

        return zipCodeInfoList;
    }

    @Override
    public List<JuDo> getJuDoList(String nation) {
        List<JuDo> juDoList = new ArrayList<>();
        StringBuffer apiUrl = new StringBuffer();
        apiUrl.append("http://eship.epost.go.kr/api.RetrieveJuDoListRequest.ems?regkey=");
        apiUrl.append(ApiConstant.REGKEY);
        apiUrl.append("&Nation=");
        apiUrl.append(nation!=null?nation:"");

        try {
            String xmlStr = this.callApi(apiUrl.toString(),"GET");
            System.out.println(xmlStr);
            InputSource is = new InputSource(new StringReader(xmlStr));
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
            //최상위 노드 찾기
            Element element = doc.getDocumentElement();
            //원하는 태그 찾아오기
            NodeList items1 = element.getElementsByTagName("stateorprovincename");
            //데이터 개수 찾아오기
            int n = items1.getLength();
            for (int i=0; i<n; i++){
                JuDo judo = new JuDo();
                judo.setStateOrProvinceName(items1.item(i).getFirstChild().getNodeValue());
                juDoList.add(judo);
            }

        } catch (Exception e){
            e.printStackTrace();
            throw new DreamEMSException(Errors.SERVER_INTERNAL_ERROR, "Error from [ ApiServiceImpl.getJuDoList ]");
        }

        return juDoList;
    }

    @Override
    public List<SiDo> getSiDoList(String nation, String stateFrom) {
        List<SiDo> siDoList = new ArrayList<>();
        StringBuffer apiUrl = new StringBuffer();
        apiUrl.append("http://eship.epost.go.kr/api.RetrieveSiDoListRequest.ems?regkey=");
        apiUrl.append(ApiConstant.REGKEY);
        apiUrl.append("&Nation=");
        apiUrl.append(nation!=null?nation:"");
        apiUrl.append("&StateFrom=");
        apiUrl.append(stateFrom!=null?stateFrom:"");

        try {
            String xmlStr = this.callApi(apiUrl.toString(),"GET");
            System.out.println(xmlStr);
            InputSource is = new InputSource(new StringReader(xmlStr));
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
            //최상위 노드 찾기
            Element element = doc.getDocumentElement();
            //원하는 태그 찾아오기
            NodeList items1 = element.getElementsByTagName("cityname");
            //데이터 개수 찾아오기
            int n = items1.getLength();
            for (int i=0; i<n; i++){
                SiDo siDo = new SiDo();
                siDo.setCityName(items1.item(i).getFirstChild().getNodeValue());
                siDoList.add(siDo);
            }

        } catch (Exception e){
            e.printStackTrace();
            throw new DreamEMSException(Errors.SERVER_INTERNAL_ERROR, "Error from [ ApiServiceImpl.getSiDoList ]");
        }
        return siDoList;
    }

    @Override
    public List<ZipCode> getZipCodeList(String nation, String stateFrom, String cityFrom) {
        List<ZipCode> zipCodeList = new ArrayList<>();
        StringBuffer apiUrl = new StringBuffer();
        apiUrl.append("http://eship.epost.go.kr/api.RetrieveZipCodeListRequest.ems?regkey=");
        apiUrl.append(ApiConstant.REGKEY);
        apiUrl.append("&Nation=");
        apiUrl.append(nation!=null?nation:"");
        apiUrl.append("&StateFrom=");
        apiUrl.append(stateFrom!=null?stateFrom:"");
        apiUrl.append("&CityFrom=");
        apiUrl.append(cityFrom!=null?cityFrom:"");

        try {
            String xmlStr = this.callApi(apiUrl.toString(),"GET");
            System.out.println(xmlStr);
            InputSource is = new InputSource(new StringReader(xmlStr));
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
            //최상위 노드 찾기
            Element element = doc.getDocumentElement();
            //원하는 태그 찾아오기
            NodeList items1 = element.getElementsByTagName("countrycode");
            NodeList items2 = element.getElementsByTagName("stateorprovincename");
            NodeList items3 = element.getElementsByTagName("cityname");
            NodeList items4 = element.getElementsByTagName("postalcode");
            //데이터 개수 찾아오기
            int n = items1.getLength();
            for (int i=0; i<n; i++){
                ZipCode zipCode = new ZipCode();
                zipCode.setCountryCode(items1.item(i).getFirstChild().getNodeValue());
                zipCode.setStateOrProvinceName(items2.item(i).getFirstChild().getNodeValue());
                zipCode.setCityName(items3.item(i).getFirstChild().getNodeValue());
                zipCode.setPostalCode(items4.item(i).getFirstChild().getNodeValue());
                zipCodeList.add(zipCode);
            }

        } catch (Exception e){
            e.printStackTrace();
            throw new DreamEMSException(Errors.SERVER_INTERNAL_ERROR, "Error from [ ApiServiceImpl.getZipCodeList ]");
        }
        return zipCodeList;
    }

    @Override
    public EmsTotProcCmd getEmsTotProcCmd(String premiumCd, String countryCd, int totWeight, String boyn, int boprc, String em_ee) {
        EmsTotProcCmd emsTotProcCmd = new EmsTotProcCmd();
        List<ZipCode> zipCodeList = new ArrayList<>();
        StringBuffer apiUrl = new StringBuffer();
        apiUrl.append("http://eship.epost.go.kr/api.EmsTotProcCmd.ems?regkey=");
        apiUrl.append(ApiConstant.REGKEY);
        apiUrl.append("&premiumcd=");
        apiUrl.append(premiumCd!=null?premiumCd:ApiConstant.PREMIUMCD_EMS);
        apiUrl.append("&countrycd=");
        apiUrl.append(countryCd!=null?countryCd:"");
        apiUrl.append("&totweight=");
        apiUrl.append(totWeight);
        apiUrl.append("&boyn=");
        apiUrl.append(boyn!=null?boyn:"");
        apiUrl.append("&boprc=");
        apiUrl.append(boprc);
        apiUrl.append("&em_ee=");
        apiUrl.append(em_ee!=null?em_ee:"");

        try {
            String xmlStr = this.callApi(apiUrl.toString(),"GET");
            System.out.println(xmlStr);
            InputSource is = new InputSource(new StringReader(xmlStr));
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
            //최상위 노드 찾기
            Element element = doc.getDocumentElement();
            //원하는 태그 찾아오기
            NodeList items1 = element.getElementsByTagName("emsTotProc");
            emsTotProcCmd.setEmsTotProc(items1.item(0).getFirstChild().getNodeValue());

        } catch (Exception e){
            e.printStackTrace();
            throw new DreamEMSException(Errors.SERVER_INTERNAL_ERROR, "Error from [ ApiServiceImpl.getEmsTotProcCmd ]");
        }

        return emsTotProcCmd;
    }


    @Override
    public String getCustno() {
        String custno = "";
        String plainStr = "memberID="+ApiConstant.EPOST_ID;
        String regData = this.getEncryptData(ApiConstant.REGKEY,plainStr);

        StringBuffer apiUrl = new StringBuffer();
        apiUrl.append("http://eship.epost.go.kr/api.EmsIdCustnoInfo.ems?regkey=");
        apiUrl.append(ApiConstant.REGKEY);
        apiUrl.append("&regData=");
        apiUrl.append(regData);

        try {
            String xmlStr = this.callApi(apiUrl.toString(),"GET");
            System.out.println(xmlStr);
            InputSource is = new InputSource(new StringReader(xmlStr));
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
            //최상위 노드 찾기
            Element element = doc.getDocumentElement();
            //원하는 태그 찾아오기
            NodeList items1 = element.getElementsByTagName("custno");

            custno = items1.item(0).getFirstChild().getNodeValue();

        } catch (Exception e){
            e.printStackTrace();
            throw new DreamEMSException(Errors.SERVER_INTERNAL_ERROR, "Error from [ ApiServiceImpl.getEmsIdCustnoInfo ]");
        }

        return custno;
    }

    @Override
    public String getApprno(String custno) {
        String apprno = "";
        String plainStr = "custno="+custno;
        String regData = this.getEncryptData(ApiConstant.REGKEY,plainStr);

        StringBuffer apiUrl = new StringBuffer();
        apiUrl.append("http://eship.epost.go.kr/api.EmsPrcPayMethodList.ems?regkey=");
        apiUrl.append(ApiConstant.REGKEY);
        apiUrl.append("&regData=");
        apiUrl.append(regData);

        try {
            String xmlStr = this.callApi(apiUrl.toString(),"GET");
            System.out.println(xmlStr);
            InputSource is = new InputSource(new StringReader(xmlStr));
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
            //최상위 노드 찾기
            Element element = doc.getDocumentElement();
            //원하는 태그 찾아오기
            NodeList items1 = element.getElementsByTagName("apprno");

            apprno = items1.item(0).getFirstChild().getNodeValue();

        } catch (Exception e){
            e.printStackTrace();
            throw new DreamEMSException(Errors.SERVER_INTERNAL_ERROR, "Error from [ ApiServiceImpl.getEmsIdCustnoInfo ]");
        }

        return apprno;
    }

    @Override 
    public OrderResponse receiptEms(String custno, String apprno, Order order) {
        OrderResponse orderResponse = null;
        String plainStr = this.getPlainStr2(custno,apprno,order);
        log.info(plainStr);
        String regData = this.getEncryptData(ApiConstant.REGKEY,plainStr);

        StringBuffer apiUrl = new StringBuffer();
        // TODO: 2017-04-23 라이브 적용시 url 변경
        //apiUrl.append("http://eship.epost.go.kr/api.EmsApplyInsertReceiveTempCmdNew.ems?regkey=");    //라이브 url
        apiUrl.append("http://eship.epost.go.kr/api.EmsApplyInsertReceiveTempCmdNewDEV.ems?key=");   //테스트 url
        apiUrl.append(ApiConstant.REGKEY);
        //apiUrl.append("6c1591025283e7f4");
        apiUrl.append("&regData=");
        apiUrl.append(regData);
        //apiUrl.append("d30c973e3e4b5eb75462423c0aa100bc0ea16fc031987");
        
        //.ems?key=test& regData=d30c973e3e4b5eb75462423c0aa100bc0ea16fc031987
        //http://eship.epost.go.kr/api.EmsApplyInsertReceiveTempCmdNew.ems?key=test& regData=d30c973e3e4b5eb75462423c0aa100bc0ea16fc031987
        
        try {
            String xmlStr = this.callApi(apiUrl.toString(),"GET");
            System.out.println(xmlStr);
            InputSource is = new InputSource(new StringReader(xmlStr));
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
            //최상위 노드 찾기
            Element element = doc.getDocumentElement();
            
            if( element.getElementsByTagName("error_code").getLength() > 0 ){
            	String errMsg = element.getElementsByTagName("message").item(0).getFirstChild().getNodeValue();
            	throw new APIException(errMsg);
            }else{
            	//원하는 태그 찾아오기
            	NodeList items1 = element.getElementsByTagName("reqno");
            	NodeList items2 = element.getElementsByTagName("receiveseq");
            	NodeList items3 = element.getElementsByTagName("regino");
            	NodeList items4 = element.getElementsByTagName("prerecevprc");
            	NodeList items5 = element.getElementsByTagName("prcpaymethcd");
            	NodeList items6 = element.getElementsByTagName("treatporegipocd");
            	NodeList items7 = element.getElementsByTagName("treatporegipoengnm");
            	NodeList items8 = element.getElementsByTagName("orderno");
            	
            	orderResponse = new OrderResponse();
            	orderResponse.setReqNo(items1.item(0).getFirstChild().getNodeValue());
            	orderResponse.setReceiveSeq(items2.item(0).getFirstChild().getNodeValue());
            	orderResponse.setRegiNo(items3.item(0).getFirstChild().getNodeValue());
            	orderResponse.setPreRecevPrc(items4.item(0).getFirstChild().getNodeValue());
            	orderResponse.setPrcPayMethCd(items5.item(0).getFirstChild().getNodeValue());
            	orderResponse.setTreatPoRegiPoCd(items6.item(0).getFirstChild().getNodeValue());
            	orderResponse.setTreatPoRegiPoEngNm(items7.item(0).getFirstChild().getNodeValue());
            	orderResponse.setOrderNo(items8.item(0).getFirstChild().getNodeValue());
            }
            

        } catch (Exception e){
            e.printStackTrace();
            throw new DreamEMSException(Errors.SERVER_INTERNAL_ERROR, "Error from [ ApiServiceImpl.getEmsIdCustnoInfo ]");
        }

        return orderResponse;
    }


    private String getPlainStrNotNull(String item, String value){
    	StringBuffer plainStr = new StringBuffer();
    	if ( value != null && !"".equals(value) ){
    		plainStr.append(item);
    		plainStr.append(value);
			return plainStr.toString();
		}
    	return "";
    }
    
    private String getPlainStr2(String custno, String apprno, Order order){
        StringBuffer plainStr = new StringBuffer();
        plainStr.append(getPlainStrNotNull("custno=", order.getCustNo()));
        plainStr.append(getPlainStrNotNull("&apprno=", order.getApprNo()));
        plainStr.append(getPlainStrNotNull("&sender=", order.getSender()));
        plainStr.append(getPlainStrNotNull("&senderzipcode=", order.getSenderZipCode()));
        plainStr.append(getPlainStrNotNull("&senderaddr1=", order.getSenderAddr1()));
        plainStr.append(getPlainStrNotNull("&senderaddr2=", order.getSenderAddr2()));
        plainStr.append(getPlainStrNotNull("&sendertelno1=", order.getSenderTelNo1()));
        plainStr.append(getPlainStrNotNull("&sendertelno2=", order.getSenderTelNo2()));
        plainStr.append(getPlainStrNotNull("&sendertelno3=", order.getSenderTelNo3()));
        plainStr.append(getPlainStrNotNull("&sendertelno4=", order.getSenderTelNo4()));
        plainStr.append(getPlainStrNotNull("&sendermobile1=", order.getSenderMobile1()));
        plainStr.append(getPlainStrNotNull("&sendermobile2=", order.getSenderMobile2()));
        plainStr.append(getPlainStrNotNull("&sendermobile3=", order.getSenderMobile3()));
        plainStr.append(getPlainStrNotNull("&sendermobile4=", order.getSenderMobile4()));
        plainStr.append(getPlainStrNotNull("&senderemail=", order.getSenderMail()));
        plainStr.append(getPlainStrNotNull("&snd_message=", order.getSndMessage()));
        plainStr.append(getPlainStrNotNull("&premiumcd=", order.getPremiumCd()));
        plainStr.append(getPlainStrNotNull("&receivename=", order.getReceiveName()));
        plainStr.append(getPlainStrNotNull("&receivezipcode=", order.getReceiveZipCode()));
        plainStr.append(getPlainStrNotNull("&receiveaddr1=", order.getReceiveAddr1()));
        plainStr.append(getPlainStrNotNull("&receiveaddr2=", order.getReceiveAddr2()));
        plainStr.append(getPlainStrNotNull("&receiveaddr3=", order.getReceiveAddr3()));
        plainStr.append(getPlainStrNotNull("&receivetelno1=", order.getReceiveTelNo1()));
        plainStr.append(getPlainStrNotNull("&receivetelno2=", order.getReceiveTelNo2()));
        plainStr.append(getPlainStrNotNull("&receivetelno3=", order.getReceiveTelNo3()));
        plainStr.append(getPlainStrNotNull("&receivetelno4=", order.getReceiveTelNo4()));
        plainStr.append(getPlainStrNotNull("&receivetelno=", order.getReceiveTelNo()));
        plainStr.append(getPlainStrNotNull("&receivemail=", order.getReceiveMail()));
        plainStr.append(getPlainStrNotNull("&countrycd=", order.getCountryCd()));
        plainStr.append(getPlainStrNotNull("&orderno=", order.getOrderNo()));
        plainStr.append(getPlainStrNotNull("&em_ee=", order.getEmEE()));
        plainStr.append(getPlainStrNotNull("&totweight=", order.getTotWeight()));
        plainStr.append(getPlainStrNotNull("&boyn=", order.getBoYN()));
        plainStr.append(getPlainStrNotNull("&boprc=", order.getBoPrc()));
        plainStr.append(getPlainStrNotNull("&orderprsnzipcd=", order.getOrderPrsnZipCd()));
        plainStr.append(getPlainStrNotNull("&orderprsnaddr1=", order.getOrderPrsnAddr1()));
        plainStr.append(getPlainStrNotNull("&contents=", order.getContents()));
        plainStr.append(getPlainStrNotNull("&number=", order.getNumber()));
        plainStr.append(getPlainStrNotNull("&weight=", order.getWeight()));
        plainStr.append(getPlainStrNotNull("&value=", order.getValue()));
        plainStr.append(getPlainStrNotNull("&hs_code=", order.getHsCode()));
        plainStr.append(getPlainStrNotNull("&origin=", order.getOrigin()));
        plainStr.append(getPlainStrNotNull("&EM_gubun=", order.getEmGubun()));
        
        /*plainStr.append(getPlainStrNotNull("&orderprsnaddr2=", order.getCustNo()));
        plainStr.append(getPlainStrNotNull("&orderprsnnm=", order.getCustNo()));
        plainStr.append(getPlainStrNotNull("&orderprsntelnno=", order.getCustNo()));
        plainStr.append(getPlainStrNotNull("&orderprsntelfno=", order.getCustNo()));
        plainStr.append(getPlainStrNotNull("&orderprsntelmno=", order.getCustNo()));
        plainStr.append(getPlainStrNotNull("&orderprsntellno=", order.getCustNo()));
        plainStr.append(getPlainStrNotNull("&orderprsntelno=", order.getCustNo()));
        plainStr.append(getPlainStrNotNull("&orderprsnhtelfno=", order.getCustNo()));
        plainStr.append(getPlainStrNotNull("&orderprsnhtelmno=", order.getCustNo()));
        plainStr.append(getPlainStrNotNull("&orderprsnhtellno=", order.getCustNo()));
        plainStr.append(getPlainStrNotNull("&orderprsnhtelno=", order.getCustNo()));
        plainStr.append(getPlainStrNotNull("&orderprsnemailid=", order.getCustNo()));*/
        return plainStr.toString();
    }

    private String getPlainStr(String custno, String apprno, Order order){
        StringBuffer plainStr = new StringBuffer();
        plainStr.append("custno=");
        plainStr.append(custno);
        plainStr.append("&apprno=");
        plainStr.append(apprno);
        plainStr.append("&sender=");
        plainStr.append(order.getSender());
        plainStr.append("&senderzipcode=");
        plainStr.append(order.getSenderZipCode());
        plainStr.append("&senderaddr1=");
        plainStr.append(order.getSenderAddr1());
        plainStr.append("&senderaddr2=");
        plainStr.append(order.getSenderAddr2());
        plainStr.append("&sendertelno1=");
        plainStr.append(order.getSenderTelNo1());
        plainStr.append("&sendertelno2=");
        plainStr.append(order.getSenderTelNo2());
        plainStr.append("&sendertelno3=");
        plainStr.append(order.getSenderTelNo3());
        plainStr.append("&sendertelno4=");
        plainStr.append(order.getSenderTelNo4());
        plainStr.append("&sendermobile1=");
        plainStr.append(order.getSenderMobile1());
        plainStr.append("&sendermobile2=");
        plainStr.append(order.getSenderMobile2());
        plainStr.append("&sendermobile3=");
        plainStr.append(order.getSenderMobile3());
        plainStr.append("&sendermobile4=");
        plainStr.append(order.getSenderMobile4());
        plainStr.append("&senderemail=");
        plainStr.append(order.getSenderMail());
        plainStr.append("&snd_message=");
        plainStr.append(order.getSndMessage());
        plainStr.append("&premiumcd=");
        plainStr.append(order.getPremiumCd());
        plainStr.append("&receivename=");
        plainStr.append(order.getReceiveName());
        plainStr.append("&receivezipcode=");
        plainStr.append(order.getReceiveZipCode());
        plainStr.append("&receiveaddr1=");
        plainStr.append(order.getReceiveAddr1());
        plainStr.append("&receiveaddr2=");
        plainStr.append(order.getReceiveAddr2());
        plainStr.append("&receiveaddr3=");
        plainStr.append(order.getReceiveAddr3());
        plainStr.append("&receivetelno1=");
        plainStr.append(order.getReceiveTelNo1());
        plainStr.append("&receivetelno2=");
        plainStr.append(order.getReceiveTelNo2());
        plainStr.append("&receivetelno3=");
        plainStr.append(order.getReceiveTelNo3());
        plainStr.append("&receivetelno4=");
        plainStr.append(order.getReceiveTelNo4());
        plainStr.append("&receivetelno=");
        plainStr.append(order.getReceiveTelNo());
        plainStr.append("&receivemail=");
        plainStr.append(order.getReceiveMail());
        plainStr.append("&countrycd=");
        plainStr.append(order.getCountryCd());
        plainStr.append("&orderno=");
        plainStr.append(order.getOrderNo());
        plainStr.append("&em_ee=");
        plainStr.append(order.getEmEE());
        plainStr.append("&totweight=");
        plainStr.append(order.getTotWeight());
        plainStr.append("&boyn=");
        plainStr.append(order.getBoYN());
        plainStr.append("&boprc=");
        plainStr.append(order.getBoPrc());
        plainStr.append("&orderprsnzipcd=");
        plainStr.append(order.getOrderPrsnZipCd());
        plainStr.append("&orderprsnaddr1=");
        plainStr.append(order.getOrderPrsnAddr1());
        plainStr.append("&orderprsnaddr2=");
        plainStr.append(order.getOrderPrsnAddr2());
        plainStr.append("&orderprsnnm=");
        plainStr.append(order.getOrderPrsnNm());
        plainStr.append("&orderprsntelnno=");
        plainStr.append(order.getOrderPrsnTelNNo());
        plainStr.append("&orderprsntelfno=");
        plainStr.append(order.getOrderPrsnTelFNo());
        plainStr.append("&orderprsntelmno=");
        plainStr.append(order.getOrderPrsnTelMNo());
        plainStr.append("&orderprsntellno=");
        plainStr.append(order.getOrderPrsnTelLNo());
        plainStr.append("&orderprsntelno=");
        plainStr.append(order.getOrderPrsnTelNo());
        plainStr.append("&orderprsnhtelfno=");
        plainStr.append(order.getOrderPrsnHTelFNo());
        plainStr.append("&orderprsnhtelmno=");
        plainStr.append(order.getOrderPrsnHTelMNo());
        plainStr.append("&orderprsnhtellno=");
        plainStr.append(order.getOrderPrsnHTelLNo());
        plainStr.append("&orderprsnhtelno=");
        plainStr.append(order.getOrderPrsnHTelNo());
        plainStr.append("&orderprsnemailid=");
        plainStr.append(order.getOrderPrsnEmailId());
        plainStr.append("&contents=");
        plainStr.append(order.getContents());
        plainStr.append("&number=");
        plainStr.append(order.getNumber());
        plainStr.append("&weight=");
        plainStr.append(order.getWeight());
        plainStr.append("&value=");
        plainStr.append(order.getValue());
        plainStr.append("&hs_code=");
        plainStr.append(order.getHsCode());
        plainStr.append("&origin=");
        plainStr.append(order.getOrigin());
        plainStr.append("&EM_gubun=");
        plainStr.append(order.getEmGubun());
        plainStr.append("&ecommerceyn=");
        plainStr.append(order.getEcommerceYN());
        plainStr.append("&bizregno=");
        plainStr.append(order.getBizRegNo());
        plainStr.append("&exportsendprsnnm=");
        plainStr.append(order.getExportSendPrsnNm());
        plainStr.append("&exportsendprsnaddr=");
        plainStr.append(order.getExportSendPrsnAddr());
        plainStr.append("&modelno=");
        plainStr.append(order.getModelNo());
        plainStr.append("&xprtno1=");
        plainStr.append(order.getXprtNo1());
        plainStr.append("&xprtno2=");
        plainStr.append(order.getXprtNo2());
        plainStr.append("&xprtno3=");
        plainStr.append(order.getXprtNo3());
        plainStr.append("&xprtno4=");
        plainStr.append(order.getXprtNo4());
        plainStr.append("&recomporegipocd=");
        plainStr.append(order.getRecomporegipocd());

        return plainStr.toString();
    }

}
