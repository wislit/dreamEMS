package com.dreamEMS.service;

import com.dreamEMS.model.entity.EmsSearchNewEngZipCodeInfo;
import com.dreamEMS.model.entity.Nation;

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
     * 발송 가능 국가 조회
     * @return
     */
    List<Nation> getNationList();

    /**
     * 새우편번호 영문주소 조회
     * @param searchText : 검색어
     * @param countPerPage : 페이지당 조회건수
     * @param currentPage : 현재 페이지
     * @return
     */
    List<EmsSearchNewEngZipCodeInfo> getEmsSearchNewEngZipCodeInfoList(String searchText, int countPerPage, int currentPage);
}
