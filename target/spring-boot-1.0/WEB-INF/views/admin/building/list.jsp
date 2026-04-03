<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách toà nhà</title>
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
								class="ace-icon fa fa-angle-double-right"></i> Quản lý toà nhà
							</small>
						</h1>
					</div>
					<!-- /.page-header -->
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box ui-sortable-handle">
								<div class="widget-header">
									<h5 class="widget-title">Default Widget Box</h5>

									<div class="widget-toolbar">
										<a href="#" data-action="collapse"> <i
											class="ace-icon fa fa-chevron-up"></i>
										</a>
									</div>
								</div>

								<div class="widget-body"
									style="font-family: 'Times New Roman', Times, serif;">
									<div class="widget-main">
										<form:form id="listform" modelAttribute="modelSearch" action="${buildingListURL }" method="GET">
											<div class="row">
												<div class="form-goup">
													<div class="col-xs-12">
														<div class="col-xs-6">
															<label class="name">Tên toà nhà</label> 
															<%-- <input type="text" class="form-control" name="name" value="${modelSearch.name}"> --%>
															<form:input class="form-control" path="name"/>
														</div>
														<div class="col-xs-6">
															<label class="name">Diện tích sàn </label> 
															<%-- <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea }"> --%>
															<form:input class="form-control" path="floorArea"/>
														</div>
													</div>
													<div class="col-xs-12">
														<div class="col-xs-2">
															<label class="name">Quận hiện có</label> 
															<form:select class="form-control" path="district">
																<form:option value="">Chọn quận</form:option>
																<form:options items="${districts}"></form:options>
															</form:select>
														</div>
														<div class="col-xs-5">
															<label class="name">Phường</label> 
															<%-- <input type="text"class="form-control" name="ward" value="${modelSearch.ward }"> --%>
															<form:input class="form-control" path="ward"/>
														</div>
														<div class="col-xs-5">
															<label class="name">Đường</label> 
															<%-- <input type="text" class="form-control" name="street" value="${modelSearch.street }"> --%>
															<form:input class="form-control" path="street"/>
														</div>
													</div>
													<div class="col-xs-12">
														<div class="col-xs-4">
															<label class="name">Số tầng hầm </label> 
															<%-- <input type="text" class="form-control" name="numberOfBasement" value="${modelSearch.numberOfBasement }"> --%>
															<form:input class="form-control" path="numberOfBasement"/>
														</div>
														<div class="col-xs-4">
															<label class="name">Hướng</label> 
															<%-- <input type="text" class="form-control" name="direction" value="${modelSearch.direction }"> --%>
															<form:input class="form-control" path="direction"/>
														</div>
														<div class="col-xs-4">
															<label class="name">Hạng</label> 
															<%-- <input type="text" class="form-control" name="level" value="${modelSearch.level }"> --%>
															<form:input class="form-control" path="level"/>
														</div>
													</div>
													<div class="col-xs-12">
														<div class="col-xs-3">
															<label class="name">Diện tích từ</label> 
															<%-- <input type="number" class="form-control" name="areaFrom" value="${modelSearch.areaFrom}"> --%>
															<form:input class="form-control" path="areaFrom" />
														</div>
														<div class="col-xs-3">
															<label class="name">Diện tích đến</label> 
															<%-- <input type="number" class="form-control" name="areaTo" value="">--%>
															<form:input class="form-control" path="areaTo" />
														</div>
														<div class="col-xs-3">
															<label class="name">Giá thuê từ</label> 
															<%-- <input type="number" class="form-control" name="priceFrom" value="${modelSearch.priceFrom }">  --%>
															<form:input class="form-control"  path="rentPriceFrom" />
														</div>
														<div class="col-xs-3">
															<label class="name">Giá thuê đến</label> 
															<%-- <input type="number" class="form-control" name="priceTo" value="${modelSearch.priceTo}"> --%>
															<form:input class="form-control" path="rentPriceTo" />
														</div>
													</div>
													<div class="col-xs-12">
														<div class="col-xs-4">
															<label class="name">Tên quản lý</label>
															<%-- <input type="text" class="form-control" name="managerName" value="${modelSearch.managerName}"> --%>
															<form:input class="form-control" path="managerName" />
														</div>
														<div class="col-xs-4">
															<label class="name">Số điện thoại quản lý</label> 
															<%-- <input type="text" class="form-control" name="managerPhone" value="${modelSearch.managerPhone }"> --%>
															<form:input class="form-control" path="managerPhone" />
														</div>
														<div class="col-xs-4">
															<label class="name">Chọn nhân viên phụ trách</label> 
															<form:select path="staffId" class="form-control" >
																<form:option value="">Chọn nhân viên</form:option>
																<form:options items="${ListStaffs}"/>
															</form:select>
														</div>
													</div>
													<div class="col-xs-12">
														<div class="col-xs-6">
															<form:checkboxes items="${typeCodes}" path="typeCode"/>
														</div>
													</div>
													<div class="col-xs-12">
														<div class="col-xs-6">
															<button type="button" class="btn btn-primary"
																id="btnSearchBuilding">
																<svg xmlns="http://www.w3.org/2000/svg" width="16"
																	height="16" fill="currentColor" class="bi bi-search"
																	viewBox="0 0 16 16">
																<path
																		d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0">
																</path>
															</svg>
																Tìm kiếm
															</button>
														</div>
													</div>
												</div>
											</div>
										</form:form>

									</div>
								</div>
							</div>
							<div class="pull-right">

								<a href="${pageContext.request.contextPath}/admin/building-edit">
									<button type="button" class="btn btn-success"
										title="thêm và sửa toà nhà">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-building-add"
											viewBox="0 0 16 16">
										<path
												d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0">
										</path>
										<path
												d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z">
										</path>
										<path
												d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z">
										</path>
									</svg>
										ADD
									</button>
								</a>
								<button type="button" class="btn btn-danger" title="xoá toà nhà" id="btnDeleteBuilding">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-building-dash"
										viewBox="0 0 16 16">
										<path
											d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1">
										</path>
										<path
											d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z">
										</path>
										<path
											d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z">
										</path>
									</svg>
									Delete
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row"
					style="font-family: 'Times New Roman', Times, serif;">
					<div class="col-xs-12">
						<table id="tablelist"
							class="table table-striped table-bordered table-hover"
							style="margin: 2em 0 1.5em;">
							<thead>
								<tr>
									<th class="center"><label class="pos-rel"> <input
											type="checkbox" class="ace" value=""> <span class="lbl"></span>
									</label></th>
									<th>Tên toà nhà</th>
									<th>Địa chỉ</th>
									<th>Số tầng hầm</th>
									<th>Tên quản lý</th>
									<th>SDT quản lý</th>
									<th>Diện tích sàn</th>
									<th>Diện tích trống</th>
									<th>Diện tích thuê</th>
									<th>Phí môi giới</th>
									<th>Thao tác</th>
									<th></th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="item" items="${modelBuildingList}">
									<tr>
									<td class="center"><label class="pos-rel"> <input
											type="checkbox" class="ace" value="${item.id }"> <span class="lbl"></span>
									</label></td>

									<td>${item.name}</td>
									<td>${item.address}</td>
									<td>${item.numberOfBasement}</td>
									<td>${item.managerName}</td>
									<td>${item.managerPhone}</td>
									<td>${item.floorArea}</td>
									<td>${item.emptyArea}</td>
									<td>${item.rentArea}</td>
									<td>${item.brokerageFee }</td>

									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<button class="btn btn-xs btn-success" title="Giao toà nhà" onclick="assingmentBuiding(${item.id})">
												<i class="ace-icon glyphicon glyphicon-list"></i>
											</button>

											<a class="btn btn-xs btn-info" title="sửa toà nhà" href="${pageContext.request.contextPath}/admin/building-edit-${item.id}">
												<i class="ace-icon fa fa-pencil bigger-120"></i>
											</a>

											<button class="btn btn-xs btn-danger" onclick="deleteBuilding(${item.id})" title="xoá toà nhà">
												<i class="ace-icon fa fa-trash-o bigger-120"> </i>
											</button>
										</div>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.span -->
				</div>
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
	<div class="modal fade" id="assingmentBuildingModal" role="dialog"
		style="font-family: 'Times New Roman', Times, serif;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button typr="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Danh sách nhân viên</h4>
				</div>
				<div class="modal-body">
					<table id="staffList"
						class="table table-striped table-bordered table-hover"
						style="margin: 2em 0 1.5em;">
						<thead>
							<tr>
								<th class="center">Chọn</th>
								<th class="center">Tên nhân viên</th>
								
							</tr>
						</thead>

						<tbody>
					
						</tbody>
					</table>
					<input type="hidden" id="buildingId" name="building" value="">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="btnassingmentBuilding">Giao toà nhà</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		function assingmentBuiding(buildingId) {
			$('#assingmentBuildingModal').modal();
			loadStaff(buildingId);
			$('#buildingId').val(buildingId);
		}
		function loadStaff(buildingId){
			$.ajax({
				type : "GET",
				url : "${buildingAPI}/"+buildingId+"/staffs",
				contentType : "application/json",
				dataType : "JSON",
				success : function(response) {
					var row='';
					$.each(response.data,function(index,item){
						row+='<tr>';
						row+='<td class="text-center"><input type="checkbox"  value= '+item.staffId+' id ="checkbox_"'+item.staffId+' class="check-box-element" '+item.checked+'/></td>';
						row+='<td class="text-center">'+item.fullName+'</td>'
						row+='</tr>';
					});
					$('#staffList tbody').html(row);
					console.log("success");
				},
				error : function(response) {
					console.log("fail");
					window.location.href ="<c:url value="admin/builing-list?message=error"/>";
					console.log(response);
				}
			});
		}
		$('#btnassingmentBuilding').click(
				function(e) {
					e.preventDefault();
					var data = {};
					data['buildingId'] = $('#buildingId').val();
					var staffs = $('#staffList').find(
							'tbody input[type = checkbox]:checked').map(
							function() {
								return $(this).val();
							}).get();
					data['staffs'] = staffs;
					if(data['staffs'] !=''){
						assignment(data);
					}
					console.log("ok");
				});
		function assignment(data){
			$.ajax({
				type : "POST",
				url : "${buildingAPI}/assignment",
				data: JSON.stringify(data),
				contentType : "application/json",
				dataType : "JSON",
				success : function(response) {
					console.log("success");
				},
				error : function(response) {
					console.info("giao khoong thanh cong")
					window.location.href ="<c:url value="admin/builing-list?message=error"/>";
					console.log(response);
				}
			});
		}
		$('#btnSearchBuilding').click(function(e){
			e.preventDefault();
			$('#listform').submit();
		});
		function deleteBuilding(id){
			var buildingId =[id]
			deleteBuildings(buildingId);
		}
		$('#btnDeleteBuilding').click(
				function(e) {
					e.preventDefault();
					var data = {};
					/* data['buildingId'] = $('#buildingId').val(); */
					var buildingIds = $('#tablelist').find(
							'tbody input[type = checkbox]:checked').map(
							function() {
								return $(this).val();
							}).get();
					deleteBuildings(buildingIds);
				});
		
		function deleteBuildings(data){
			$.ajax({
				type : "Delete",
				url : "${buildingAPI}/"+data,
				data : JSON.stringify(data),
				contentType : "application/json",
				dataType : "JSON",
				success : function(response) {
					$("#h11").html("success");
				},
				error : function(response) {
					console.log(response);
				}
			});
		}
	</script>
</body>
</html>