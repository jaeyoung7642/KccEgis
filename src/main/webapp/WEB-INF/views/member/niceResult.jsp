<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "javax.crypto.Cipher" %>
<%@ page import = "javax.crypto.Mac" %>
<%@ page import = "javax.crypto.SecretKey" %>
<%@ page import = "javax.crypto.spec.IvParameterSpec" %>
<%@ page import = "javax.crypto.spec.SecretKeySpec" %>

<%@ page import = "java.security.InvalidKeyException" %>
<%@ page import = "java.security.NoSuchAlgorithmException" %>
<%@ page import = "java.util.Base64" %>
<%@ page import = "java.util.Base64.Encoder" %>
<%@ page import = "java.util.Base64.Decoder" %>
<%@ page import = "java.net.URLDecoder" %>

<%@ page import = "org.json.simple.JSONArray" %>
<%@ page import = "org.json.simple.JSONObject" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<%@ page import = "org.json.simple.parser.ParseException" %>
<%@ page import = "java.util.Enumeration" %>

<html>
<script>
window.onload = function() {
	window.opener.closePopup(); // 부모 창의 closePopup 함수 호출
};
</script>
<head>
    <title>NICE평가정보 본인인증</title>
</head>
<body>
</body>
</html>