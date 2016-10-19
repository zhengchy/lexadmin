<%--
  Created by IntelliJ IDEA.1123
  User: Administrator
  Date: 2016/9/28
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
</head>
<body>





<c:forEach items="${lists}" var="file" varStatus="vs">
    <tr>

        <td>
            <s:property value="#vs.index+1"/>
        </td>
        <td align = "center">${file.fileId}</td>
        <td align = "center">${file.fileUrl}</td>
        <td align = "center">${file.fileName}</td>
        <td align = "center">${file.UpUserId}</td>
    </tr>
</c:forEach>
</body>
</html>
