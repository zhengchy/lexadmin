<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/27
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title></title>
</head>
<body>
<form method="post" action="http://localhost:8091/web/user/weblogin">
    <table>
        <tr>
            <td>电话</td>
            <td><input type="text" name="phone"/></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password"  name="password"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="提交"/></td>
        </tr>
    </table>
</form>
</body>
</html>
