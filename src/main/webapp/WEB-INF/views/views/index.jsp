<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/components/taglib.jsp" %>
  			<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Hoá đơn</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						<form action="javascript:void(0)" method="get">
		                 	 <div class="input-group form">
		                       <input type="text" class="form-control" name="payment" id="payment" value="" placeholder="Nhập hình thức thanh toán" style="width: 35%; float: left">
		                       <input type="text" class="form-control" name="min" id="min" value="" placeholder="Nhập giá min" style="width: 20%; float: left; margin-left: 5px">
		                       <input type="text" class="form-control" name="max" id="max" value="" placeholder="Nhập giá max" style="width: 20%; float: left; margin-left: 5px">
		                       <span style="float: left; margin-left: 5px" class="input-group-btn">
		                         <button onclick="getInvoiceByPayment()" class="btn btn-primary" type="submit">Hiển thị</button>
		                       </span>
		                       <div style="clear: both"></div>
		                  	 </div>
	                  	</form>
					</div>
                	<div class="col-md-4">
	                	<form action="javascript:void(0)" method="get">
		                 	 <div class="input-group form">
		                       <input type="text" class="form-control" name="keyword" id="keyword" value="" placeholder="Nhập số lượng hoá đơn">
		                       <span class="input-group-btn">
		                         <button onclick="getNewInvoice()" class="btn btn-primary" type="submit">Hiển thị</button>
		                       </span>
		                  	 </div>
	                  	</form>
                  	</div>
				</div>
				<div class="row" style="margin-top: 10px">
					<div class="col-md-8">
						<form action="javascript:void(0)" method="get">
		                 	 <div class="input-group form">
		                       <input type="text" class="form-control" name="month" id="month" value="" placeholder="Nhập tháng" style="width: 30%; float: left">
		                       <input type="text" class="form-control" name="year" id="year" value="" placeholder="Nhập năm" style="width: 30%; float: left; margin-left: 5px">
		                       <input type="text" class="form-control" name="kqdem" id="kqdem" value="" placeholder="Kết quả" style="width: 15%; float: left; margin-left: 5px">
		                       <span style="float: left; margin-left: 5px" class="input-group-btn">
		                         <button onclick="countInvoiceByDate()" class="btn btn-primary" type="submit">Đếm</button>
		                       </span>
		                       <div style="clear: both"></div>
		                  	 </div>
	                  	</form>
					</div>
                	<div class="col-md-4">
                		<form action="javascript:void(0)" method="get">
		                 	 <div class="input-group form">
		                       <input type="text" class="form-control" name="total" id="total" value="" placeholder="Nhập hình thức thanh toán" style="width: 60%; float: left;">
		                       <input type="text" class="form-control" name="kqtotal" id="kqtotal" value="" placeholder="Kết quả" style="width: 40%; float: right">
		                       <span class="input-group-btn">
		                         <button onclick="getTotalInvoice()" class="btn btn-primary" type="submit">Tính</button>
		                       </span>
		                  	 </div>
	                  	</form>
                  	</div>
				</div>

				<div class="row">
  				<div class="panel-body">
  					<c:if test="${param.msg == 1}">
							<div class="alert alert-success" role="alert">
							    Cập nhật thông tin thành công
							</div>
						</c:if>
  					<table class="table table-striped table-bordered" id="example">
						<thead>
							<tr>
								<th width="5%">ID</th>
								<th>Tên hoá đơn</th>
								<th width="15%">Hình thức thanh toán</th>
								<th width="11%">Tổng tiền</th>
								<th width="14%">Ngày lập hoá đơn</th>
								<th width="8%">Chức năng</th>
							</tr>
						</thead>
						<tbody id="content"></tbody>
					</table>

					<nav class="text-center" aria-label="...">
					   <ul class="pagination">
						  <li><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
						  <li class="active"><a href="#">1</a></li>
						  <li><a href="#">2</a></li>
						  <li><a href="#">3</a></li>
						  <li><a href="#">4</a></li>
						  <li><a href="#">5</a></li>
						  <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
					   </ul>
					</nav>
  				</div>
  				</div>
  			</div>
  			
<script>
	fetch('http://localhost:8081/invoice/api/invoice').then(response => response.json()).then(data => {
		var kq = '';
	    for(let item of data){
	    	var urlUpdate = "http://localhost:8081/invoice/update?id="+item.id;
	        kq += '<tr class="odd gradeA">';
	        kq += '<td>'+item.id+'</td>';
	        kq += '<td>'+item.name+'</td>';
	        kq += '<td>'+item.payment+'</td>';
	        kq += '<td align="right">'+item.total+'đ</td>';
	        kq += '<td>'+item.created+'</td>';
	        kq += '<td class="center text-center">';
	        kq += '<a href="'+urlUpdate+'" title="" class="btn btn-primary" style="margin-right: 5px"><span class="glyphicon glyphicon-pencil"></span> Sửa</a>';
	        kq += '</td>';
	        kq += '</tr>';
	    }
	    $("#content").html(kq);
	});
	
	function getNewInvoice() {
		var n = $("#keyword").val();
		fetch('http://localhost:8081/invoice/api/invoice/'+n).then(response => response.json()).then(data => {
			var kq = '';
		    for(let item of data){
		    	var urlUpdate = "http://localhost:8081/invoice/update?id="+item.id;
		        kq += '<tr class="odd gradeA">';
		        kq += '<td>'+item.id+'</td>';
		        kq += '<td>'+item.name+'</td>';
		        kq += '<td>'+item.payment+'</td>';
		        kq += '<td align="right">'+item.total+'đ</td>';
		        kq += '<td>'+item.created+'</td>';
		        kq += '<td class="center text-center">';
		        kq += '<a href="'+urlUpdate+'" title="" class="btn btn-primary" style="margin-right: 5px"><span class="glyphicon glyphicon-pencil"></span> Sửa</a>';
		        kq += '</td>';
		        kq += '</tr>';
		    }
		    $("#content").html(kq);
		});
	}

	function getInvoiceByPayment() {
		var payment = $("#payment").val();
		var min = $("#min").val();
		var max = $("#max").val();
		fetch('http://localhost:8081/invoice/api/invoice/'+payment+'/'+min+'-'+max).then(response => response.json()).then(data => {
			var kq = '';
		    for(let item of data){
		    	var urlUpdate = "http://localhost:8081/invoice/update?id="+item.id;
		        kq += '<tr class="odd gradeA">';
		        kq += '<td>'+item.id+'</td>';
		        kq += '<td>'+item.name+'</td>';
		        kq += '<td>'+item.payment+'</td>';
		        kq += '<td align="right">'+item.total+'đ</td>';
		        kq += '<td>'+item.created+'</td>';
		        kq += '<td class="center text-center">';
		        kq += '<a href="'+urlUpdate+'" title="" class="btn btn-primary" style="margin-right: 5px"><span class="glyphicon glyphicon-pencil"></span> Sửa</a>';
		        kq += '</td>';
		        kq += '</tr>';
		    }
		    $("#content").html(kq);
		});
	}
	
	function countInvoiceByDate() {
		var month = $("#month").val();
		var year = $("#year").val();
		fetch('http://localhost:8081/invoice/api/invoice/count/'+month+'-'+year).then(response => response.json()).then(data => {
			$("#kqdem").val(data);
		});
	}
	
	function getTotalInvoice() {
		var total = $("#total").val();
		fetch('http://localhost:8081/invoice/api/invoice/total/'+total).then(response => response.json()).then(data => {
			$("#kqtotal").val(data);
		});
	}
</script>  			
  			
<script type="text/javascript">
	document.getElementById("invoice_management").className = "current";
</script>