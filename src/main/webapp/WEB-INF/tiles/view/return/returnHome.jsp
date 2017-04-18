<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<!-- start:main -->
<div class="container"> <!-- footer.jsp에 container </div> 있음 마지막에 닫는태그 안써도됨 -->
<div id="main">

	<!-- start:breadcrumb -->
	<ol class="breadcrumb">
	    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
	    <li class="active">반송</li>
	</ol>
	<!-- end:breadcrumb -->   
	
	 <div class="row">
	    <div class="col-sm-12">
	        <h3 class="page-header">
	            	반송 물품 목록
	        </h3>
	    </div>
	</div>
	
		<div class="row">
	    <div class="col-sm-12">
	        <section class="panel">
	            <div class="panel-body">
	            
		            <div class="col-sm-12 alert alert-info alert-outline alert-dismissable">
		            	<div class="col-sm-9">
		            		MyEMS 담당 반송품 절차 :   ① 우체국 배달 → ② MyEMS 수령 → ③ 기사 배송중 → ④ 배달 완료
   							<br>(처리상태가 '우체국 배달'일 경우, 우체국을 통해 확인해 주시기 바랍니다.)
   						</div>
		            	<div class="col-sm-3">
		            		<div class="form-group">
				                	<div class="input-group">
			                            <input type="text" class="form-control" placeholder="송장번호 입력">
			                            <span class="input-group-btn">
			                                <button class="btn btn-primary" type="button">조회</button>
			                            </span>
			                        </div>
				                </div>
							</div>
		            	</div>
	            	<!-- <div class="col-sm-12 alert alert-danger alert-bordered alert-dismissable" style="margin-top: 20px">
                        <strong>항공 보안으로 반송된 경우 반송 택배비가 차감됩니다. (하단 중량별 택배비 참조)</strong>
                    </div> -->
                    <div style="padding: 15px 0; float: left;">
	                	<h4><span class="label label-danger">항공 보안으로 반송된 경우 반송 택배비가 차감됩니다. (하단 중량별 택배비 참조)</span></h4>
                	</div>
                
                  <table class="table table-bordered text-center">
                      <tbody>
                          <tr>
                              <td class="info">중량</td>
                              <td>~ 2,000g</td>
                              <td>2,000g ~ 5,000g</td>
                              <td>5,000g ~ 10,000g</td>
                              <td>10,000g ~ 20,000g</td>
                              <td>20,000g ~ </td>
                          </tr>
                          <tr>
                              <td class="info">택배비 차감액</td>
                              <td>3,500원</td>
                              <td>4,000원</td>
                              <td>5,500원</td>
                              <td>7,000원</td>
                              <td>8,500원</td>
                          </tr>
                      </tbody>
                  </table>
                  
                  <div class="adv-table" style="margin-top: 20px">
                      <table  class="display table table-hover table-condensed" id="example">
                        <thead>
                        <tr>
                            <th class="text-center">반송일</th>
                            <th class="text-center">송장번호</th>
                            <th class="text-center">국가</th>
                            <th class="text-center">중량(g)</th>
                            <th class="text-center">우체국요금</th>
                            <th class="text-center">DreamEMS요금</th>
                            <th class="text-center">차감액</th>
                            <th class="text-center">환불금액</th>
                            <th class="text-center">배송기사</th>
                            <th class="text-center">처리상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
           			</table>
                  </div>
	            </div>
	        </section>
	    </div>
	</div>
	
</div>
<!-- end:main -->


<!-- start:javascript for this page -->
<!-- end:javascript for this page -->

</body>
</html>	