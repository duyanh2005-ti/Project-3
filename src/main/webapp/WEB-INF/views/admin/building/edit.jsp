<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingAPI" value="/admin/building" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm toà nhà</title>
</head>
<body>
	<div class="main-content" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>

					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
						</li>
					</ul>
					<!-- /.breadcrumb -->
				</div>

				<div class="page-content">
					<div class="page-header">
						<h1>
							Dashboard <small> <i
								class="ace-icon fa fa-angle-double-right"></i> Thêm và sửa toà
								nhà
							</small>
						</h1>
					</div>
					<!-- /.page-header -->

					<!-- bảng danh sách -->
					<div class="row"
						style="font-family: 'Times New Roman', Times, serif;">
						<form:form modelAttribute="buildingEdit" id="List-form"
							method="GET">
							<div class="col-xs-12">
								<form class="form-horizontal" id="form-edit">
									<di class=" form-group"> <label class="col-xs-3">Tên
										toà nhà</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="text" id="name" name="name">  -->
										<form:input class="form-control" path="name" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Quận</label>
									<div class="col-xs-2">
										<form:select class="form-control" path="district">
											<form:option value="">Chọn quận</form:option>
											<form:options items="${districts}"></form:options>
										</form:select>
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Phường</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="text" id="ward" name="ward"> -->
										<form:input path="ward" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Đường</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="text" id="street" name="street"> -->
										<form:input path="street" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Kết cấu</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="text" id="structure" name="structure"> -->
										<form:input path="structure" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Số tầng hầm</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="number" id="numberofbasement" name="numberofbasement"> -->
										<form:input path="numberOfBasement" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Diện tích sàn</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="number" id="floorarea" name="floorarea"> -->
										<form:input path="floorArea" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Hướng</label>
									<div class="col-xs-9">
										<form:input path="direction" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Hạng</label>
									<div class="col-xs-9">
 										<!-- <input class="form-control" type="text" id="level" name="level">  -->
										<form:input path="level" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Giá thuê</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="number" id="direction" name="direction"> -->
										<form:input path="rentPrice" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Mô tả giá</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="text" id="rentPriceDescription" name="rentPriceDescription"> -->
										<form:input path="rentPriceDescription" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Phí dịch vụ</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="number" id="serviceFee" name="serviceFee"> -->
										<form:input path="serviceFee" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Phí ôtô</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="number" id="carFee" name="carFee"> -->
										<form:input path="carFee" class="form-control" />
									</div>
									</di>
									<di class="form-group"> <label class="col-xs-3">Phí mô tả</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="text" id="rentPriceDescription" name="rentPriceDescription"> -->
										<form:input path="rentPriceDescription" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Phí ngoài giờ</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="number" id="overtimeFee" name="overtimeFee"> -->
										<form:input path="overtimeFee" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Tiền điện</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="number" id="electricityFee" name="electricityFee"> -->
										<form:input path="electricityFee" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Tiền nước</label>
									<div class="col-xs-9">
										<form:input path="waterFee" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Đặt cọc</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="number" id="deposit" name="deposit"> -->
										<form:input path="deposit" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Thanh toán</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="text" id="payment" name="payment"> -->
										<form:input path="payment" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Thời hạn thuê</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="number" id="rentTime" name="rentTime"> -->
										<form:input path="rentTime" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Thời hạn trang trí</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="number" id="decorationTime" name="decorationTime"> -->
										<form:input path="decorationTime" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Phí môi giới</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="number" id="brokerageFee" name="brokerageFee"> -->
										<form:input path="brokerageFee" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Tên quản lý</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="text" id="managerName" name="managerName"> -->
										<form:input path="managerName" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">SDT quản lý</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="number" id="managerPhone" name="managerPhone"> -->
										<form:input path="managerPhone" class="form-control" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Loại toà nhà</label>
									<div class="col-xs-6">
										<form:checkboxes items="${typeCodes}" path="typeCode" />
									</div>
									</di>
									<di class=" form-group"> <label class="col-xs-3">Ghi chú</label>
									<div class="col-xs-9">
										<!-- <input class="form-control" type="text" id="note" name="note"> -->
										<form:input path="note" class="form-control" />
									</div>
									</di>
									<di class="form-group"> <label class="col-xs-3"></label>
									<div class="col-xs-9">
										<c:if test="${not empty buildingEdit.id}">
											<button type="button" class="btn btn-primary"
												id="btnAddOrUpdateBuilding">Cập nhật</button>
										</c:if>
										<c:if test="${empty buildingEdit.id}">
											<button type="button" class="btn btn-primary"
												id="btnAddOrUpdateBuilding">Thêm toà nhà</button>
										</c:if>
										<button type="button" class="btn btn-primary" id="btnCancel">Huỷ
											thao tác</button>
									</div>
									</di>
									<form:hidden path="id" id="buildingId" />
								</form>
							</div>
						</form:form>

					</div>
				</div>
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<script>
		$('#btnAddOrUpdateBuilding').click(function() {
			var data = {};
			var typeCode = [];
			var formData = $('#List-form').serializeArray();
			console.log(formData);
			$.each(formData, function(i, v) {
				if (v.name != 'typeCode') {
					data["" + v.name + ""] = v.value;
				} else {
					typeCode.push(v.value);
				}
			});
			data['typeCode'] = typeCode;
			if(typeCode!=""){
				addOrUpateBuilding(data);
			}
			else{
				window.location.href ="<c:url value="admin/builing-list?typeCode=require"/>";
			}
			
			
		});
		function addOrUpateBuilding(data){
			var url="";
			if(!data.id || data.id.trim() === ""){ 
				url= "<c:url value='/admin/building-edit'/>"
			}
			else{
				url ="<c:url value='/admin/building-edit-'/>"+data.id
			} 
			$.ajax({
				type : "POST",
				/* lưu ý phải call đúng api */
				url : url,
				data : JSON.stringify(data),
				contentType : "application/json",
				dataType : "JSON",
				success : function(respond) {
					$("#h11").html("success");
				},
				error : function(respond) {
					console.log(respond);
				}
			});
		}
		$('#btnCancel').click(function(){
			window.location.href ="<c:url value='/admin/building-list'/>";
		})
	</script>
	<!-- /.main-content -->
</body>
</html>