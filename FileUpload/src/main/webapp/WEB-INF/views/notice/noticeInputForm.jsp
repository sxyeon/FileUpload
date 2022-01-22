<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 쓰기</title>
</head>
<body>

<div align="center">
	<div><h1>게시글 작성</h1></div>
	<div>
		<form id="frm" action="noticeInsert.do" method="post" enctype="multipart/form-data">
			<div>
				<table border="1">
					<tr>
						<th width="100">아이디</th>
						<td width="150">
							<input type="email" id="id" name="id" placeholder="email을 입력하세요" required="required">
						</td>
						<th width="100">작성자</th>
						<td width="150">
							<input type="text" id="name" name="name" placeholder="이름을 입력하세요" required="required">
						</td>
						<th width="100">작성일자</th>
						<td width="150">
							<input type="date" id="wdate" name="wdate" placeholder="날짜를 선택하세요" required="required">
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="5">
							<input type="text" id="title" name="title" placeholder="제목을 입력하세요" required="required">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="5">
							<textarea rows="10" cols="80"></textarea>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="5">
							<input type="file" id="file" name="file">
						</td>
					</tr>
				</table>
			</div><br>
			<div>
				<input type="submit" value="저장">
			</div>
		</form>
	</div>
</div>

</body>
</html>