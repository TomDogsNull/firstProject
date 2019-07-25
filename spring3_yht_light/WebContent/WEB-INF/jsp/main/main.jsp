<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
.carousel-item {

  height: 600px;

}

html {
height: 100%;
}
body {
margin: 0;
height: 100%;
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Food sharing</title>




<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">

<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>


</head>
<body>

      <!-- carousel -->
   <div class="bd-example" style="margin-bottom: 1%;" align="center">
      <div id="carouselExampleCaptions" class="carousel slide"
         data-ride="carousel" data-interval="3000">
         <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="0"
               class="active"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
         </ol>
         <div class="carousel-inner">
            <div class="carousel-item active">
               <img src="images/bgi1.jpg" class="d-block w-100" alt="...">
               <div class="carousel-caption d-none d-md-block">
                  <h5 class="h5main" align="left">모여서</h5>
               </div>
            </div>
            <div class="carousel-item">
               <img src="images/bgi2.png" class="d-block w-100" alt="...">
               <div class="carousel-caption d-none d-md-block">
                  <h5  class="h5main" align="left">음식을</h5>
               </div>
            </div>
            <div class="carousel-item">
               <img src="images/bgi3.jpg" class="d-block w-100" alt="...">
               <div class="carousel-caption d-none d-md-block">
                  <h5 class="h5main" align="left">먹자</h5>
               </div>
            </div>
         </div>
         <a class="carousel-control-prev" href="#carouselExampleCaptions"
            role="button" data-slide="prev"> <span
            class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="sr-only">Previous</span>
         </a> <a class="carousel-control-next" href="#carouselExampleCaptions"
            role="button" data-slide="next"> <span
            class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="sr-only">Next</span>
         </a>
      </div>
   </div>


<div class="clear"></div>
<div class="space"></div>
<hr>

<%-- footer --%>
<div>
<jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>
</div>
</body>
</html>