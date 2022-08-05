<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="tmp" items="${clist }">

    <c:choose>
        <c:when test="${username ne tmp.send_name }">
            <!--받은 메세지-->
            <div class="incoming_msg">
                <div class="incoming_msg_img">
                    <a href="other_profile?other_name=${tmp.send_name }">
                       <img src="./upload/profile/${tmp.user_image}" alt="abc" >   
                    </a>
                </div>
                <div class="received_msg">
                    <div class="received_withd_msg">
                        <p>${tmp.content }</p>
                        <span class="time_date"> ${tmp.send_time }</span>
                    </div>
                </div>
            </div>
        </c:when>

        <c:otherwise>
        <!-- 보낸 메세지-->
        <div class="outgoing_msg">
            <div class="sent_msg">
                <p>${tmp.content }</p>
                <span class="time_date"> ${tmp.send_time}</span>
            </div>
        </div>
        </c:otherwise>
    </c:choose>
</c:forEach>