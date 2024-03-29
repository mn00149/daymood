<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="tmp" items="${list}">
    <div class="chat_list_box${tmp.room} chat_list_box">
        <div type="button" class="chat_list" room="${tmp.room }" other-name="${tmp.other_name}">
            <!--active-chat-->
            <div class="chat_people">
                <div class="chat_img">
                  <!-- 프로필이동..? 할까말까     <a href="other_image?other_name=${tmp.other_name }"> -->
                  <!-- 경로 정해지면 수정해야됨.         <img src="./upload/profile/${tmp.user_image}" alt="abc" > --> 
                    </a>
                </div>
                <div class="chat_ib">
                    <h5>${tmp.other_name }<span class="chat_date">${tmp.send_time }</span>
                    </h5>
                    <div class="row">
                            <div class="col-10">
                                <p>${tmp.content}</p>
                            </div>
                            <!--만약 현재사용자가 안읽은 메세지 갯수가 0보다 클때만 badge를 표시한다-->
                            <c:if test="${tmp.unread > 0 }">
                                <div class="col-2 unread${tmp.room}">
                                    <span class="badge bg-danger">${tmp.unread }</span>
                                </div>
                            </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>