<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<fmt:requestEncoding value="utf-8" />
<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver"
	url="jdbc:oracle:thin:@52.79.235.41:1521:xe" user="ksm"
	password="ource" var="conn" />
	

<!-- 유저가 팔로우 한 사람 가져오기 -->
<c:catch var="error">
	<sql:query dataSource="${conn}" var="followFromMe">
		            SELECT upi.id, upi.profile_img
		            FROM user_follow uf, user_profile_img upi
		            WHERE uf.mem_id = ? AND
		            uf.target_mem_id = upi.id
		            <sql:param>
		            	${sessionScope.sessionId}
		            </sql:param>
	</sql:query>
</c:catch>

<!-- 유저를 팔로우 한 사람 가져오기 -->
<c:catch var="error">
	<sql:query dataSource="${conn}" var="followToMe">
                    SELECT upi.id, upi.profile_img
		            FROM user_follow uf, user_profile_img upi
		            WHERE uf.target_mem_id = ? AND
		            uf.mem_id = upi.id
		            <sql:param>
		            	${sessionScope.sessionId}
		            </sql:param>
	</sql:query>
</c:catch>

<link rel="stylesheet" type="text/css" href="css_main/user_friends.css">
<link rel="stylesheet" type="text/css" href="css_shared/fontFamily.css">

<div id="friendListContainer">
	<ul id="friendTab" class="nav nav-tabs" role="tablist">
	
		<li role="presentation" class="active">
		<a data-target="#followingSec" id="tabFollowing" role="tab" data-toggle="tab" aria-controls="followingSec" aria-expanded="true">팔로잉</a></li>
		
		<li role="presentation" class="">
		<a data-target="#followerSec" id="tabFollower" role="tab" data-toggle="tab" aria-controls="followerSec" aria-expanded="false"> 팔로우 </a></li>
		
	</ul>

	<div id="friendTabContentSelection" class="tab-content">
	
		<div role="tabpanel" class="tab-pane fade active in" id="followingSec">
			<c:forEach var="data" items="${followFromMe.rows}">
				<c:if test="${data.profile_img eq '0'}">
					<a class="followingItem" href="#">
						<img src="Image/user_black.png" id="friendIcon"/> ${data.id}
					</a>
				</c:if>
				
				<c:if test="${data.profile_img ne '0'}">
				</c:if>
			</c:forEach>
		</div> <!-- following -->

 		<div role="tabpanel" class="tab-pane fade" id="followerSec">
			<c:forEach var="data" items="${followToMe.rows}">
				<c:if test="${data.profile_img eq '0'}">
					<a class="followerItem" href="#">
						<img src="Image/user_black.png" id="friendIcon"/> ${data.id}
					</a>
				</c:if>
				
				<c:if test="${data.profile_img ne '0'}">
				</c:if>
			</c:forEach>
		</div> <!-- follow -->

	</div> <!-- friendTabContentSelection -->




</div> <!-- Container -->


		<div class="modal fade" id="modal_Fol" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="vertical-alignment-helper">
				<div class="modal-dialog vertical-align-center">
					<div id="checkType" class="modal-content panel-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true"> &times;</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="modal_Fol_title"> 
							</h4>
						</div>
						<div class="modal-footer" id="modal_Fol_footer">
						</div>
					</div>
					
				</div>
			</div>
		</div><!-- Modal -->