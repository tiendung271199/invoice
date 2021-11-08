<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/components/taglib.jsp" %>
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Cập nhật thông tin hoá đơn</div>
		</div>
		<div class="content-box-large box-with-header">
			<form action="javascript:void(0)" method="post">
				<div>
					<div class="row mb-10"></div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="name">Tên hoá đơn</label>
								<input type="text" id="name" name="name" value="" class="form-control" placeholder="Nhập tên hoá đơn">
							</div>

							<div class="form-group">
								<label for="name">Hình thức thanh toán</label>
								<input type="text" id="payment" name="payment" value="" class="form-control" placeholder="Nhập hình thức thanh toán">
							</div>

							<div class="form-group">
								<label for="total">Tổng tiền</label>
								<input type="text" id="total" name="total" value="" class="form-control" placeholder="Nhập tổng tiền">
							</div>
						</div>
						<div class="col-sm-6"></div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-12">
							<input type="submit" onclick="update()" value="Lưu" class="btn btn-success" />
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	var url = window.location.href;
	var id = new URL(url).searchParams.get("id");
	getData(id);
	
	function getData(id) {
		fetch('http://localhost:8081/invoice/api/invoicebyid/'+id).then(response => response.json()).then(data => {
			$("#name").val(data.name);
			$("#total").val(data.total);
			$("#payment").val(data.payment);
		});
	}

	function update() {
		var name = $("#name").val();
		var total = $("#total").val();
		var payment = $("#payment").val();
		let dataObject = {
			'id': id,
	        'name': name,
	        'total': total,
	        'payment': payment
	    };
		$.ajax({
			url: 'http://localhost:8081/api/invoice',
			type: 'PUT',
			cache: false,
			contentType : 'application/json',
			dataType: 'json',
			data: JSON.stringify(dataObject),
			success: function(data){
				window.location.assign("http://localhost:8081/invoice?msg=1");
			},
			error: function (e){
				console.log(e);
				alert('Có lỗi xảy ra!');
			}
		});
		return false;
	}
</script>

<script type="text/javascript">
	document.getElementById("invoice_management").className = "current";
</script>