$(document).ready(function(){
	total_products = 0;
	var checknum = 0;
	
	$('input[name=price_cell]').each(function(){ 
		total_products += Number($(this).val());
	    checknum++;
	});
	shiping = checknum * 3000;
	$('#total_products').text(total_products + shiping);
	
	//쿠폰 적용text초기화
	$('input[type=radio]').each(function(){	
		var chnum = $(this).val();
		$('.cuname'+chnum).hide();
	});
	
	//쿠폰사용 윈도우 출력
	$('.btn_coupon').click(function () {  
		var cartno = $(this).attr('id');
	    $('#coupon_window'+cartno).show(); 
	    wrapWindowByMask();
	});
	//쿠폰 적용하기
	$('.btn_coupon_apply').click(function () {
		var cartno = $(this).attr('id').substring(1);
	    $('#coupon_window'+cartno).hide();
		$('#mask').hide();
		var total_sale =0;
		$('input[name=sale_cell]').each(function(){
			total_sale += Number($(this).val()) ;
		});
		total_sale += Number($('#cpoint').val()); 
		$('#total_sale').html(total_sale);
		//쿠폰 적용text초기화
		$('input[type=radio]').each(function(){	
			var chnum = $(this).val();
			$('.cuname'+chnum).hide();
		});
		//쿠폰(적용중)으로 text 바꾸기
		$('input[type=radio]').each(function(){	
			var chnum = $(this).val();	//chnum
			if($(this).is(':checked')){
				$('.cuname'+chnum).show();
			}
		});
		
		osum();
	});
	//쿠폰 체크 하기
	$('input[type=radio]').change(function(){
		var cartno = $(this).attr('name').substring(5);
		var chnum = $(this).val();
		if($(this).val()==0){	//쿠폰 적용안함 체크
			$('#'+cartno).css({'color':'#fff','background-color':'#3a5485'}).html('쿠폰사용');
			$('#input_chnum'+cartno).val(0);
			$('#setcuid'+cartno).val('0');
			$('#sale_cell'+cartno).val('0');
			$('#sale_price'+cartno).html('');
			$('#cart_price'+cartno).css({'text-decoration-line':'none','color':'black'});
		}else{	//쿠폰체크시
			var chk = 0;
			$('input[type=radio]').each(function(){	//다른제품에서 쿠폰사용여부 검사
				if($(this).is(':checked')){
					if($(this).val() == chnum){
						chk++;
					}
				}
			});
			if(chk==2){	//쿠폰 중복적용시
				alert('해당 쿠폰은 다른상품에 적용중입니다.');
				$('#input_chnum'+cartno).val(0);
				$('#setcuid'+cartno).val('0');
				$('#sale_cell'+cartno).val('0');
				$('#sale_price'+cartno).html('');
				$("input:radio[name='chnum"+cartno+"']:radio[value='0']").prop('checked', true);
				$('#'+cartno).css({'color':'#fff','background-color':'#3a5485'}).html('쿠폰사용');
			}else{	//쿠폰 적용
				$('#'+cartno).css({'color':'#3a5485','background-color':'#fff'}).html('쿠폰변경');
				var price_cell = $('#price_cell'+cartno).val();
				var sale = $('.coupon'+chnum).html()/100;
				$('#input_chnum'+cartno).val(chnum);
				$('#setcuid'+cartno).val( $('#cuid'+chnum).val());
				$('#sale_cell'+cartno).val(price_cell*sale);
				$('#sale_price'+cartno).html(price_cell*(1-sale) + '원');
				$('#cart_price'+cartno).css({'text-decoration-line':'line-through','color':'#a2a2a5'});
			}
		}
		osum();
	});
	//쿠폰사용 윈도우 닫기
	$('.exit_window').click(function () {
		var cartno = $(this).attr('id').substring(1);
	    $('#coupon_window'+cartno).hide();
		$('#mask').hide();
		$("input:radio[name='chnum"+cartno+"']:radio[value='0']").prop('checked', true);
		$('#'+cartno).css({'color':'#fff','background-color':'#3a5485'}).html('쿠폰사용');
		$('#input_chnum'+cartno).val(0);
		$('#setcuid'+cartno).val('0');
		$('#sale_cell'+cartno).val('0');
		$('#sale_price'+cartno).html('');
		$('#cart_price'+cartno).css({'text-decoration-line':'none','color':'black'});
		$('.btn_coupon_apply').trigger('click');
		osum();
	});
	
	//point 숫자 검사
	$('#cpoint').focusout(function() {
		var sum = $('#osum').html();
		var point_all = Math.floor($('#point_all').val()/10) * 10;
		if(point_all > sum){	//point가 총 결제금액보다 많을 경우->결제금액을 상한 point로 설정
			point_all = sum;
		}
		if( Number($(this).val()) >= point_all ){ //쓴 숫자가 point보다 클 경우
			$(this).val(point_all);
			$('#point_all').prop("checked", true);
		}else{
			$('#point_all').prop("checked", false);
			$(this).val(Math.floor($(this).val()/10) * 10);
		}
		$('.btn_coupon_apply').trigger('click');
		osum();
	});
	
	//포인트 전부 사용
	$('#point_all').change(function(){
		var sum = $('#osum').html();
		var point_all = Math.floor($('#point_all').val()/10) * 10;
		if(point_all > sum){	//point가 총 결제금액보다 많을 경우->결제금액을 상한 point로 설정
			point_all = sum;
		}
		if($(this).is(':checked')){
			$('#cpoint').val(point_all);
		}else{
			$('#cpoint').val(0);
		}
		$('.btn_coupon_apply').trigger('click');
		osum();
	});
	
	//주소 선택
	$('#option_addr').change(function(){
		var addrcode = $('select[name=addrlist]').val();
		$('input[name=opost]').val($('#opost'+addrcode).val());
		$('input[name=oaddr1]').val($('#oaddr1'+addrcode).val());
		$('input[name=oaddr2]').val($('#oaddr2'+addrcode).val());
	});
	
	osum();
	//창 실행시 기본 선택주소 출력
	var addrcode = $('select[name=addrlist]').val();
	$('input[name=opost]').val($('#opost'+addrcode).val());
	$('input[name=oaddr1]').val($('#oaddr1'+addrcode).val());
	$('input[name=oaddr2]').val($('#oaddr2'+addrcode).val());
});
//osum 계산 함수
function osum(){
	var osum = $('#total_products').html()-$('#total_sale').html();
	var gpoint = $('input[name=gpoint]').val();
	if(osum<0){	//osum이 -가 될경우 point 낮추기.
		var temp = osum * -1;
		osum = 0;
		$('#cpoint').val($('#cpoint').val()-temp);
		$('#total_sale').html($('#total_sale').html()-temp );
	}
	$('#osum').html(osum);
	$('input[name=osum]').val(osum);
	$('#plus_point').html( Math.floor(osum*gpoint/100) );
}

//쿠폰 모달 효과창 열기
function wrapWindowByMask(){
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  
    $('#mask').css({'width':maskWidth,'height':maskHeight});  
    $('#mask').show();      
}
