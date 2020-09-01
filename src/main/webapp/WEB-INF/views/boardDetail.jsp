<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${pageContext.request.contextPath }" var="cp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Home</title>
<script src="https://kit.fontawesome.com/cc3f76d574.js"></script>
<link rel="styleSheet" href="${cp}/css/style.css" />
<style>
.board_folder_img{
	width:15px;
	margin-right :5px;
}
boardlist-1{
	
}
#boardlist_title{
	width:150px;
}
a{
text-decoration:none;
cursor :pointer;
color:black;
overflow:auto;
}
.context2_main{
padding :10px;
}

.boardlist_setting{
	padding: 4px;
	width : 150px;
	height: 25px;
	border: 1px solid grey;
	border-radius:7px;
	position:absolute;
	top:550px;
	display:flex;
	justify-content:space-evenly;
	
}
.context1_profile{
	display:flex;
}
#boardlist_settingimg{
	width:15px;
	overflow:auto;
	height :15px;
}
#boder_setting_a{
	height: 15px;
}
.context2__main{
	display:flex;
	flex-direction:column;
	padding :20px;
}
</style>
</head>
<body style="background: url('${cp}/img/pixel_heart.png');">
	<main>
		<div class="main1">
			<div class="wrapper">
				<div class="wrapper2">
					<div class="context1">
						<div class="context1__visitor">TODAY 00 | TOTAL 00</div>
						<div class="context1__profile">
							<div class="context1__boardList">
								<div id="boardlist_title"> FREE BOARD
									<hr>
								</div>
									<c:forEach var="folder" items="${flist }">
										<div class="boardList-1 board">
											<a href="${cp }/board/${folder.folderId}/"><img class="board_folder_img"src="${cp }/img/folder1.png"><label>${folder.folderName }</label></a>
										</div>
									</c:forEach>
								</div>
							<div class="boardlist_setting">
							<img id="boardlist_settingimg"src="${cp }/img/settings.png"><a id="boder_setting_a"href="">폴더관리하기</a>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="main2">
			<div class="wrapper_1">
				<div class="wrapper2_1">
					<div class="context2">
						<div class="context2__title">
							<div class="title-context"></div>
							<div class="setting"></div>
						</div>
						<div class="context2__main" style="overflow: auto;">
							<!--이부분만 바뀜-->
							<div class="main__title">
								<span>${board.title }</span>
							</div>
							<div class="main__profile">
								<div>${board.writer }</div>
								<div>${board.time }</div>
							</div>
							<div class="main__context">
								<textarea readonly="readonly">
									${board.context }
								</textarea>
							</div>
							<div class="main__des">
								<a href="${cp }/board/${path}/${board.bnum}/update/">수정</a>
								<a href="${cp }/board/${path}/${board.bnum}/move/">이동</a> <!-- DB에서 다른 보드로 이동 구현 -->
								<a href="${cp }/board/${path}/${board.bnum}/delete/">삭제</a>
							</div>
							
							<div class="main__comment">
								<form method="post">
									<div>댓글</div>
									<input type="text" name="comment">
									<input type="submit" value="확인">
								</form>
							</div>
							
						<!--이까지-->
						</div>
						<div class="nav__home nav" onclick="location.href = '${cp}/'">
							홈</div>
						<div class="nav__profile nav"
							onclick="location.href = '${cp}/profile/'">
							프로필</div>
						<div class="nav__diary nav"
							onclick="location.href = '${cp}/diary/'">
							다이어리</div>
						<div class="nav__gallary nav"
							onclick="location.href = '${cp}/gallary/'">
							사진첩</div>
						<div class="nav__board nav"
							style="z-index: 9; background-color: white; color: black; border-left: none;"
							onclick="location.href = '${cp}/board/'">
							게시판</div>
						<div class="nav__guest nav"
							onclick="location.href = '${cp}/guest/'">
							방명록</div>
						<div class="nav__setting nav"
							onclick="location.href = '${cp}/setting/'">
							관리</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clip clip1"></div>
		<div class="clip clip2"></div>
		<div class="clip clip3"></div>
		<div class="clip clip4"></div>
	</main>
</body>
</html>