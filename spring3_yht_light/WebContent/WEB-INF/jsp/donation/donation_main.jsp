<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>  
 
<html>
<head>
<%-- favicon --%>
<link rel="icon" href="images/foodicon.png" sizes="48x48">
<%-- header --%>
<jsp:include page="/WEB-INF/jsp/include/header.jsp" flush="false"/>
<link rel="stylesheet" href="css/donation_main.css">
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">

$(document).ready(function(){

	var IMP = window.IMP; // 생략가능
	IMP.init('imp42404001');  // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
   
});

</script>

<c:if test="${login.id == null }">
	<script type="text/javascript">
		 alert("로그인 해 주십시오");
		 location.href='login.do';
	 </script> 
</c:if> 

</head>
<body>

<div class="mainImg" align="center">
<h1 class="headtitle">Donation <%-- 총 후원액:
<c:if test="${not empty totalDonation }">\ ${totalDonation }&nbsp;원</c:if>
<c:if test="${empty totalDonation }">\0&nbsp;원</c:if> --%>
</h1>
</div>	

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<div id="info">
	<div class="container_c active">
		<div class="head">
			<p class="noto">Food Sharing Donation</p> <br>
		</div>
		<div class="body active">
			<form method="post" action="donationAf.do" id="doFrm" name="doFrm">
				<div class="insert">
					<div class="id">
						<b>아이디&nbsp;&nbsp;&nbsp;<input type="text"  name="id" id="id" value="${login.id }" readonly="readonly"></b>
						<hr>
					</div>
					<div class="name">
						<b>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" id="name" size="15"  value="${login.name }" readonly="readonly"></b>
						<hr>
					</div>
					<div class="phone">
						<b>연락처&nbsp;&nbsp;&nbsp;<input type="text"  name="phone" id="phone"  value="${login.phone }"  readonly="readonly"></b>
						<hr>		
					</div>
					<div class="donation">
						&nbsp;&nbsp;&nbsp;<input type="text" maxlength="5" name="donation" id="donation"  placeholder="후원금액을  입력해주세요">
						<hr>
					</div>
					<div class="donation">						
						
						<b>\&nbsp;&nbsp;&nbsp;<input type="text" maxlength="5" id="donation2" placeholder="10만원 미만 후원 가능" >원</b>
						<hr>
					</div>
				</div>
				<div align="center">
					<button type="button" class="btn_s_blue btn_150" onclick="payment()">
						후원하기
					</button>
					&nbsp;&nbsp;
					<button type="button" class="btn_s_gray btn_150" onclick="location.href='main.do'">
						메인화면
					</button>
				</div>
			</form>
		</div>		
	</div>
</div>

<div style="background-color: #F8D7DA; text-align: center; border: 2px solid #ECEDF0;">
<p style="margin-top: 20px; color: #A7574A;" >* 후원금은 서버 관리비와 Food Sharing을 위해서만 사용 됩니다 .</p>
</div>

<%-- footer --%>
 <jsp:include page="/WEB-INF/jsp/include/footer.jsp" flush="false"/>


<script type='text/javascript'>

function payment() {
	
	//alert("결제진입");
	var id = $("#id").val();
	var donation = $("#donation").val();
	var name = $("#name").val();
	var phone = $("#phone").val();
	//alert("id: " + id + " 후원금액: " + donation + " 연락처: " + phone );
	
	if(donation == ""){
		
		alert("후원 금액을 입력해주세요.");
		$("#donation").focus();
		
	}else {
		
	if(confirm(donation + "원을 후원하시겠습니까?") == true){  
		
			 IMP.request_pay({
			    pg : 'kakao', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : id + new Date().getTime(),
			    name : 'Food Sharing 도네이션',
			    amount : donation,
			   // buyer_email : 'iamport@siot.do',
			    buyer_name : name,
			    buyer_tel : phone,
			    //buyer_addr : '서울특별시 강남구 삼성동',
			    //buyer_postcode : '123-456',
			  //m_redirect_url : 'https://www.yourdomain.com/payments/complete'
				}, function(rsp) {
				    if ( rsp.success ) {
				    	
				        var msg = '후원이 완료되었습니다.';
				        msg += ' 고유ID : ' + rsp.imp_uid;
				        msg += ' 상점 거래ID : ' + rsp.merchant_uid;
				        msg += ' 후원 금액 : ' + rsp.paid_amount;
				        msg += ' 카드 승인번호 : ' + rsp.apply_num;
				        $("#doFrm").submit();
				        
				    } else {
				    	
				        var msg = '후원에 실패하였습니다.';
				        msg += ' 에러내용 : ' + rsp.error_msg;
				        
				    }
				    alert(msg);
				}); 
		}else {
			
			return false;
			
		}	 
	
	}
}

/* 후원액 second로 전달   */
$("#donation").keyup(function(){
	//alert("도네이션!");
	var donation = $(this).val();
	//alert(donation);
	
	if(donation == ""){
		$('#donation2').val("");
	}
	
	
	if($.isNumeric(donation)){
		
		$("#donation2").val(numberWithCommas(donation));
		
	} else{
		
		//alert("후원금액은 숫자를 입력해주세요");
		$('#donation').val("");
		return false;
		
	} 
	

});

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}





</script>



</body>
</html>