<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글리스트</title>
</head>
<body>

<div align="center">
	<div><h1>게시글 목록</h1></div>
	<div>
		<table border="1">
			<tr>
				<th width="50">순번</th>
				<th width="100">아이디</th>
				<th width="100">작성자</th>
				<th width="200">제목</th>
				<th width="100">작성일자</th>
				<th width="200">파일명</th>
				<th width="200">물리파일명</th>
			</tr>
			<c:forEach items="${notices }" var="notice">
				<tr>
					<td align="center">${notice.no }</td>
					<td align="center">${notice.id }</td>
					<td align="center">${notice.name }</td>
					<td>${notice.title }</td>
					<td align="center">${notice.wdate }</td>
					<td>${notice.fileName }</td>
					<td>${notice.pfileName }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<button type="button" onclick="location.href='noticeInputForm.do'">글쓰기</button>
	</div>
</div>

</body>
</html>