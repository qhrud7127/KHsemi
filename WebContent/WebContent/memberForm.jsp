<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function win01(idform) {
		if (idform.id.value == "") {
			return;
		}
		if (idform.id.value == " ") {
			return;
		}
		window.open("idcheck.mb?id=" + idform.id.value, "win01",
				"width=250 height=250");
	}
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">

<title>회원가입</title>
</head>
<body>
	<div class="container">
	<div class="col-lg-4"></div>		
		<div class="col-lg-4">
		<div class="jumbotron" style="padding-top: 20px;">
		<form action="./memberRegister.mb" method="post">
		<h3 style="text-align: center;">회원가입</h3>
	    	<div class="form-group" style="padding-top: 5px;">			
				 
				<input type="button" value="아이디중복확인" onclick="win01(this.form)" style="float: right; margin-bottom: 3px;">
				<label for="아이디">아이디</label>
				<input type="text" class="form-control" name="ID" maxlength="20" autofocus="autofocus" required="required" placeholder="아이디입력">
			</div>		
			<div class="form-group">
				<label for="비밀번호">비밀번호</label>
				<input type="password" class="form-control" name="PW" maxlength="20" placeholder="비밀번호입력">
			</div>
			<div class="form-group">
				<label for="이름">이름</label> 
				<input type="text" class="form-control" name="NAME" maxlength="20" placeholder="이름입력">
			</div>
			<div class="form-group">	
				<label for="주소">주소</label> 
				<input type="text" class="form-control" name="ADDR" maxlength="20" placeholder="주소입력">
			</div>
			<div class="form-group">	
				<label for="핸드폰번호">핸드폰번호</label> 
				<input type="text" class="form-control" name="TEL" maxlength="20" placeholder="숫자만입력(ex.01012345678)">
			</div>
			<div class="form-group">	
				<label for="직업">직업</label> 
				<select name="STYPE" class="form-control">
					<option value="1">학생</option>
					<option value="2">학부모</option>
					<option value="3">교사</option>
				</select>
			</div>
			<div style="padding-top: 20px;">	
				<input type="submit" value="회원가입" class="btn btn-primary form-control"> 
			</div>
			<div style="padding-top: 10px;">
				<input type="reset" value="되돌리기" class="btn btn-primary form-control">
			</div>
		</form>
		</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
</body>
</html>