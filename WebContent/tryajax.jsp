<%@page contentType="text/html;charset=utf-8"%> 
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.util.*"%>
<%@ page import="com.detail.promotion.*"%>
<%
	ProDAO dao = new ProDAO();
    List<ProVO> list = dao.activity();
    pageContext.setAttribute("list",list);
%>

<% 
  JSONObject emp = new JSONObject();
  emp.put("ename","Linsanity");
  JSONObject phone = new JSONObject();
  phone.put("O", "03-4257387");
  phone.put("H", "03-168168");
  phone.put("M", "0933-168168");

  emp.put("phone",phone);
  //out.print( emp );

%>	