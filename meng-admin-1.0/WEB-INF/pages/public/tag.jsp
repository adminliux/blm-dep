<%--
  Created by IntelliJ IDEA.
  User: chengbing Qiu
  Date: 2016/12/27
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script>
    var path = "${config.apiHost}";
    //path = "http://localhost:8081";
    var apiHost = path + "/api/json";
    path = apiHost;
</script>


