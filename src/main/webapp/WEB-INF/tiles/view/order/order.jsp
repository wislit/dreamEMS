<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
        <!-- start:main -->
        <div class="container">
            <div id="main">
                <!-- start:breadcrumb -->
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">접수</a></li>
                    <li class="active">일반접수</li>
                </ol>
                <!-- end:breadcrumb -->   
                
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">
                            	일반접수
                        </h2>
                    </div>
                </div>
                
                
                 <div class="row">
                 	<div class="col-lg-12 col-md-12">
                        <div class="well well-sm text-center">
                            	총1개 | 접수가능한 송장 0개 <button type="button" class="btn btn-info btn-lg"><i class="fa fa-comment"></i> 일반접수</button>
                        </div>
                    </div>
                </div>
                
                 
                
                <div class="row">
                    <div class="col-lg-12 col-md-12"><!-- TODO : col-md-12 가 뭔지모름  -->
                        <div class="panel">
                            <div class="panel-body">
                            	<div class="row">
                                    <div class="col-md-3">
                                        <ul id="myTab" class="nav nav-pills nav-stacked">
                                            <li class="active">
                                            	<a href="#home3" data-toggle="tab">
	                                            	<div class="row">
	                                            		<div class="col-lg-10 col-md-10">
	                                            			AB32523242 
	                                            		</div>
	                                            		<div class="col-lg-2 col-md-2">
	                                            			<button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
	                                            		</div>
	                                            	</div>
                                            	</a>
                                            </li>
                                            <li class="text-center"><a href="#profile3" data-toggle="tab">추가 <i class="fa fa-plus"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-9">
                                        <div id="myTabContent" class="tab-content">
                                            <div class="tab-pane fade active in" id="home3">  
                                                <p></p>
                                                <p>Home<br>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. </p>
                                            </div>
                                            <div class="tab-pane fade" id="profile3">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

            </div>
        </div>
        <!-- end:main -->


    <!-- start:javascript for this page -->
    <script src="${pageContext.request.contextPath}/static/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/owl.carousel.js" ></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.customSelect.min.js" ></script>
    <script src="${pageContext.request.contextPath}/static/js/sparkline-chart.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/easy-pie-chart.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/count.js"></script>
    <script>
        //owl carousel
        $(document).ready(function() {
            $("#owl-demo").owlCarousel({
                navigation : true,
                slideSpeed : 300,
                paginationSpeed : 400,
                singleItem : true,
                autoPlay:true
            });
        });

        //custom select box

        $(function(){
            $('select.styled').customSelect();
        });

        if ($(".custom-bar-chart")) {
        $(".bar").each(function () {
            var i = $(this).find(".value").html();
            $(this).find(".value").html("");
            $(this).find(".value").animate({
                height: i
            }, 2000)
        })
    }
    </script>
    <!-- end:javascript for this page -->

</body>
</html>	