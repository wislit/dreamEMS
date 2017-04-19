package com.dreamEMS.service;

import com.dreamEMS.model.entity.*;

import java.util.List;

/**
 * Created by wislit on 2017. 4. 11..
 */
public interface ApiService {


    /**
     * API 호출
     * @param apiUrl
     * @param method : GET, POST, PUT, DELETE
     * @return xml String
     */
    String callApi(String apiUrl, String method);

    /**
     * 암호화
     * @param seedKey
     * @param plainStr : 평문
     * @return
     */
    String getEncryptData(String seedKey, String plainStr);

    /**
     * 복호화
     * @param seedKey
     * @param encryptStr : 암호문
     * @return
     */
    String getDecryptData(String seedKey, String encryptStr);


    /**
     * 1.발송 가능 국가 조회
     * @return
     */
    List<Nation> getNationList(String premiumCd);

    /**
     * 3.새우편번호 영문주소 조회
     * @param searchText : 검색어
     * @param countPerPage : 페이지당 조회건수
     * @param currentPage : 현재 페이지
     * @return
     */
    List<EmsSearchNewEngZipCodeInfo> getEmsSearchNewEngZipCodeInfoList(String searchText, int countPerPage, int currentPage);

    /**
     * 4.주도 코드 조회
     * @param nation
     * @return
     */
    List<JuDo> getJuDoList(String nation);

    /**
     * 5.시도 코드 조회
     * @param nation
     * @param stateFrom
     * @return
     */
    List<SiDo> getSiDoList(String nation, String stateFrom);

    /**
     * 6.우편번호 조회
     * @param nation
     * @param stateFrom
     * @param cityFrom
     * @return
     */
    List<ZipCode> getZipCodeList(String nation, String stateFrom, String cityFrom);

    /**
     * 7.배송예상비용 조회
     * @param premiumCd : 우편물 구분 코드
     * @param countryCd : 국가코드
     * @param totWeight : 총중량
     * @param boyn : 보험가입여부(y/n)
     * @param boprc : 보험금
     * @param em_ee : 우편물 종류 코드 (서류:ee, 비서류:em, K-Packet:re)
     * @return
     */
    EmsTotProcCmd getEmsTotProcCmd(String premiumCd, String countryCd, int totWeight, String boyn, int boprc, String em_ee);


    /******************************************************************************************************************/

    /**
     * 고객번호 조회
     * @return
     */
    String getCustno();

    /**
     * 계약승인번호 조회
     * @param custno
     * @return
     */
    String getApprno(String custno);


}
