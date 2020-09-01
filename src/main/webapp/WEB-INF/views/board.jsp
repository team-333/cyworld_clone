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
.board_table{
border-bottom :1px solid grey;
}

.board_table tr td{
 text-align :center;
}
.board_table * {
padding :3px 0 3px 0;
}
.table__bnum{
width:50px;
}
.table__title{
width:350px;
}
.table_writer{
width:100px;
}
.table_time{
width:100px;
}
.table_views{
width:50px;
}
.table__firstRow{
	border-bottom:0.5px solid grey;
}
.context2__menu{
	display:flex;
	flex-direction:row-reverse;
}
.context2__menu div{
margin-left:7px;
margin: 5px 0 0 7px;
}
.boardlist_searchbox{
margin-top:5px;
display:flex;
justify-content:center;
}
.boardlist_searchbox *{
	margin-left :5px;
}
</style>
</head>
<script type="text/javascript">
	var num=0;
	function insertnum(){
		num=num+1;
		document.getElementById('num').innerHTML(num);
		return num;
	}
	const folderid=${folderid};
</script>
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
									<c:forEach  var="folder" items="${flist }">
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
							
							<table class="board_table">
								<tr class="table__firstRow">
									<th class="table__check"><input type="checkbox"></th>
									<th class="table__bnum"></th>
									<th class="table__title">제목</th>
									<th class="table__writer">작성자</th>
									<th class="table__time">작성일</th>
									<th class="table__views">조회</th>
								</tr>
								<c:forEach var="vo" items="${list }">
								<span style="visibility: hidden;height:0px"class="bnum">
									${vo.bnum }
								</span> 
									<tr id="foreach">
										<td>
											<form action="method">
												<input type="checkbox" value="${vo.bnum}">
											</form>
										</td>
										<td id="num"></td>
										<td><a href="${cp }/detail/${folderid}/${vo.bnum}/">${vo.title }</a></td>
										<td>${vo.writer }</td>
										<td><fmt:formatDate value="${vo.time }" pattern="yyyy.MM.dd" /></td>
										<td>${vo.views }</td>
									</tr>
								</c:forEach>
							</table>
							
							<div class="context2__menu">
								<div class="context2__insert-Btn" onclick="location.href = '${cp}/board/${path}/insert/'">
									<button onclick="location.href('${cp }/board/insert/${folderid }/')"><i class="fas fa-pencil-alt"></i>글쓰기</button>
								</div>
								<div class="context2__delete-Btn">
									<button id="deleteboard">삭제</button>
								</div>
								<div>
									<button>이동</button>
								</div>
							</div>
							
							<div>
	
							<div class="boardlist_searchbox">
							<select>
								<option>글제목</option>
								<option>작성자</option>
								
							</select>
							<input type="text" name="search_board">
							<button>찾기</button>
							</div>
						</div>
						</div>
						
						<!--이까지-->
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
	<script type="text/javascript">
	document.getElementById('foreach').addEventListener("load",insertnum);
	</script>
</body>
</html>
