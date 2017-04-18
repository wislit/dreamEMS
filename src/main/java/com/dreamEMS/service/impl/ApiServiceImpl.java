package com.dreamEMS.service.impl;

import com.dreamEMS.constant.ApiConstant;
import com.dreamEMS.model.dto.Errors;
import com.dreamEMS.model.entity.EmsSearchNewEngZipCodeInfo;
import com.dreamEMS.model.entity.Nation;
import com.dreamEMS.model.entity.SEED128;
import com.dreamEMS.service.ApiService;
import com.dreamEMS.web.exception.DreamEMSException;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilderFactory;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wislit on 2017. 4. 11..
 */
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
    public List<Nation> getNationList() {

        List<Nation> nationList = new ArrayList<>();
        String apiUrl = "http://eship.epost.go.kr/api.RetrieveNationListRequest.ems?regkey="+ApiConstant.REGKEY+"&premiumcd="+ApiConstant.PREMIUMCD;

        try {
            String xmlStr = this.callApi(apiUrl,"GET");
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
            throw new DreamEMSException(Errors.SERVER_INTERNAL_ERROR, "Error from [ apiService.getNationList ]");
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

                info.setZipcode(items1.item(i).getFirstChild().getNodeValue());
                info.setAddr(items2.item(i).getFirstChild().getNodeValue());
                info.setEngaddr(items3.item(i).getFirstChild().getNodeValue());

                info.setTotalCount(Integer.parseInt(items4.item(0).getFirstChild().getNodeValue()));
                info.setTotalPage(Integer.parseInt(items5.item(0).getFirstChild().getNodeValue()));
                info.setCountPerPage(Integer.parseInt(items6.item(0).getFirstChild().getNodeValue()));
                info.setCurrentPage(Integer.parseInt(items7.item(0).getFirstChild().getNodeValue()));

                zipCodeInfoList.add(info);
            }

        } catch (Exception e){
            e.printStackTrace();
            throw new DreamEMSException(Errors.SERVER_INTERNAL_ERROR, "Error from [ apiService.getNationList ]");
        }

        return zipCodeInfoList;
    }
}
