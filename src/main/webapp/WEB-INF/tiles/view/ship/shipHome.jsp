<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<!-- start:main -->
<div class="container"><!-- footer.jsp에 container </div> 있음 마지막에 닫는태그 안써도됨 -->
<div id="main">
    
    <!-- start:breadcrumb -->
    <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
        <li class="active">발송</li>
    </ol>
    <!-- end:breadcrumb -->   

    <!-- start:page header -->    
     <div class="row">
        <div class="col-sm-12">
            <h3 class="page-header">
                	발송내역 조회
            </h3>
        </div>
    </div>
    <!-- end:page header -->
    
    <!-- start:content panel -->
    <div class="row">
      <div class="col-sm-12">
          <section class="panel">
              <div class="panel-body">
              	
              	<!-- start:search well -->
       			<div class="well well">
        			<form class="form-inline" role="form">
        				<div class="row">
	        				<div class="col-sm-6">
	        					<div class="form-group">
			                   		<button type="button" class="btn btn-default btn-sm">당일</button>
			                   		<button type="button" class="btn btn-default btn-sm">1주일</button>
			                   		<button type="button" class="btn btn-default btn-sm">1개월</button>
			                   		<button type="button" class="btn btn-default btn-sm">1년</button>
			                   </div>
		       					<div class="input-group input-group-sm col-sm-3">
		                           	<span class="input-group-addon input-group-addon-info"><i class="fa fa-calendar"></i></span>
		                            <input type="text" class="form-control input-sm"  id="dp1" >
		                       </div> 
		                       ~
		                       <div class="input-group input-group-sm col-sm-3">
		                              <span class="input-group-addon input-group-addon-info"><i class="fa fa-calendar"></i></span>
		                              <input type="text" class="form-control input-sm" id="dp2">
		                       </div>
		       				</div>
		       				<div class="col-sm-6">
		       					<div class="form-group">
		                       		<select class="form-control input-sm">
		                           		<option>EMS송장번호</option>
		                           		<option>픽업기사</option>
		                       		</select>
		                       	 	<input type="input" class="form-control input-sm" id="exampleInputEmail2">
		                       </div>
		       					<div class="form-group">
	                          		<button type="button" class="btn btn-info btn-sm">검색</button>
	                          		<a class="btn btn-success btn-sm" href="" role="button" ><i class="fa fa-download"></i> 발송내역 Excel 저장</a>
	                          	</div>
		       				</div>
        				</div>
                    </form>
             	</div>
             	<!-- end:search well -->
             	
             	<!-- start:table -->
                <div class="adv-table">
                    <table  class="display table table-hover table-condensed text-center" id="example">
                      <thead>
                      <tr>
                          <th class="text-center">날짜</th>
                          <th class="text-center">개수</th>
                          <th class="text-center">픽업기사</th>
                          <th class="text-center">우체국요금</th>
                          <th class="text-center">DreamEMS요금</th>
                      </tr>
                      </thead>
                      <tbody>
                      </tbody>
          			</table>
          			
          			<!-- subtable -->
          			<div style="display:none">    
					    <table id="detailsTable">
					        <thead> 
					            <tr>
					                <th class="text-center">no</th>
					                <th class="text-center">송장번호</th>
					                <th class="text-center">국가</th>
					                <th class="text-center">중량</th>
					                <th class="text-center">우체국요금</th>
					                <th class="text-center">DreamEMS요금</th>
					            </tr>
					        </thead>
					        <tbody></tbody>
					    </table>
					</div>  
					<!-- end:subtable  -->
                </div>
                <!-- end:table -->
                
              </div>
          </section>
      </div>
  </div>
</div>
<!-- end:main -->

<!-- start:javascript for this page -->
<script src="${pageContext.request.contextPath}/static/assets/advanced-datatable/media/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/data-tables/DT_bootstrap.js"></script>
<script type="text/javascript" charset="utf-8">
    
    	//http://jsfiddle.net/headwinds/zz3cH/ 참고
	    function fnFormatDetails(table_id, html) {
	        var sOut = "<table class=\"display table table-bordered\"  id=\"example_" + table_id + "\">";
	        sOut += html;
	        sOut += "</table>";
	        return sOut;
	    }	
    
	    var iTableCounter = 1;
	    var oTable;
	    var oInnerTable;
	    var detailsTableHtml;
    
    	$(document).ready(function() {
    		
    		// you would probably be using templates here
            detailsTableHtml = $("#detailsTable").html();
    		
            /* $('#example').dataTable( {
                "aaSorting": [[ 4, "desc" ]]
            } ); */
            
          //Initialse DataTables, with no sorting on the 'details' column
            var oTable = $('#example').dataTable({
                "bFilter" : false,
            	"bJQueryUI": true,
                "aaData": newRowData,
                "aoColumns": [
                    { "mDataProp": "race" },
                    { "mDataProp": "year" },
                    { "mDataProp": "total" },
                    { "mDataProp": "t4" },
                    { "mDataProp": "t5" }
                ],
                "oLanguage": {
    			    "sInfo": "_TOTAL_ entries"
    			},
                "aaSorting": [[1, 'asc']]
            });
            
            /* Add event listener for opening and closing details
             * Note that the indicator for showing which row is open is not controlled by DataTables,
             * rather it is done here
             */
             $('#example tbody td').on('click', function () {
                 var nTr = $(this).parents('tr')[0];
                 var nTds = this;
                 
                 if (oTable.fnIsOpen(nTr)) {
                     /* This row is already open - close it */
                     oTable.fnClose(nTr);
                 }
                 else {
                     /* Open this row */
                     var rowIndex = oTable.fnGetPosition( $(nTds).closest('tr')[0] ); 
     	            var detailsRowData = newRowData[rowIndex].details;
                    
                     oTable.fnOpen(nTr, fnFormatDetails(iTableCounter, detailsTableHtml), 'details');
                     oInnerTable = $("#example_" + iTableCounter).dataTable({
                         "bJQueryUI": true,
                         "bFilter": false,
                         "aaData": detailsRowData,
                         "bSort" : true, // disables sorting
                         "aoColumns": [
                         { "mDataProp": "pic" },
     	                { "mDataProp": "name" },
     	                { "mDataProp": "team" },
     	                { "mDataProp": "server" }
     	            ],
                         "bPaginate": false,
                         "oLanguage": {
     						"sInfo": "_TOTAL_ entries"
     			        }
                     });
                     iTableCounter = iTableCounter + 1;
                 }
             });
            
            
        } );
    	
    	
    	
////////////////////////////////////////////////////////////EXTERNAL DATA - Array of Objects 


    	// DETAILS ROW A 
    	var detailsRowAPlayer1 = { pic: "1", name: "2524123224123214123", team: "CN", server: "31,300g" };
    	var detailsRowAPlayer2 = { pic: "2", name: "2234235234235234224", team: "CN", server: "12,300g" };
    	var detailsRowAPlayer3 = { pic: "3", name: "2363423232424353434", team: "CN", server: "22,300g" };
    	                         
    	var detailsRowA = [ detailsRowAPlayer1, detailsRowAPlayer2, detailsRowAPlayer3 ];

    	// DETAILS ROW B 
    	var detailsRowBPlayer1 = { pic: "1", name: "2352342342354645343", team: "CN", server: "52,300g" };
    	                         
    	var detailsRowB = [ detailsRowBPlayer1 ];
    	                    
    	// DETAILS ROW C 
    	var detailsRowCPlayer1 = { pic: "1", name: "2532436242343255344", team: "CN", server: "12,300g" };
    	                         
    	var detailsRowC = [ detailsRowCPlayer1 ];

    	var rowA = { race: "2016-06-21", year: "34", total: "서정옥", t4: "2524323", t5: "2513", details: detailsRowA};
    	var rowB = { race: "2016-06-20", year: "25", total: "구본근", t4: "254234", t5: "245", details: detailsRowB};
    	var rowC = { race: "2016-06-19", year: "21", total: "한민규", t4: "323224", t5: "5135", details: detailsRowC};

    	var newRowData = [rowA, rowB, rowC] ;

    	////////////////////////////////////////////////////////////
    </script>

<!-- javascript for this page -->
<!-- bootstrap date picker -->

<script type="text/javascript">
 $(document).ready(function() {
 	$('#dp1,#dp2').datepicker({});

	var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
 });
 
 </script>
<!-- end:javascript for this page -->

</body>
</html>	