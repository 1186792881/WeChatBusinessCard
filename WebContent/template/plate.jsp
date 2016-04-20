<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<title>名片模版</title>
<%-- <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"> --%>
<link rel="stylesheet"
	href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
</head>
<body>

	<form class="form-horizontal" style="padding: 15px;" action="${url}"
		method="post">
		
		<div class="container ">
			<div class="row">
				<div class="col-sm-6" style="text-align:center;">

					<div>
						<img class="img-rounded" src="http://placehold.it/140x140" /> <label>
							<input name="template" type="radio" id="${model.id }">默认模版
						</label>
					</div>
					<br />

					<div>
						<img class="img-rounded" src="http://placehold.it/140x140" /> <label>
							<input name="template" type="radio" id="${model.id }">默认模版
						</label>
					</div>
					<br />

					<div>
						<img class="img-rounded" src="http://placehold.it/140x140" /> <label>
							<input name="template" type="radio" id="${model.id }">默认模版
						</label>
					</div>
					<br />

					<div>
						<img class="img-rounded" src="http://placehold.it/140x140" /> <label>
							<input name="template" type="radio" id="${model.id }">默认模版
						</label>
					</div>
					<br />
				</div>
			</div>
		</div>
	</form>
</body>
</html>