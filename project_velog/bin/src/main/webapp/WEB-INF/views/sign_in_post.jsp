<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>velog-login</title>
</head>
<body>
	<form action="/sign-in" method="post">
		<input type="hidden" name="username" value="${username }">
		<input type="hidden" name="password" value="${password }">
	</form>
	
	<script type="text/javascript">
		const form = document.querySelector('form');
		window.onload = () => {
			form.submit();
		}
	</script>
</body>
</html>