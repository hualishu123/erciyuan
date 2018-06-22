<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>讨论圈</title>
<base href="<%=basePath%>" />

<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" type="text/css" href="css/Discuss.css" />
<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}

</script>

<script type="text/javascript" src="js/jquery-1-4-2.min.js"></script> 
<link rel="stylesheet" href="css/slimbox2.css" type="text/css" media="screen" /> 
<script type="text/JavaScript" src="js/slimbox2.js"></script>
<script type="text/javascript">
function test(){
//这里还需要实现一些对于输入页码的安全性验证。比如不能为空，必须是数字这些。
var page = document.getElementById("goPage").value;
window.location.href="front/DiscussPage.action?curPage="+page;
}
</script>
</head>

<body>


<div id="templatemo_header_wsp">
	<div id="templatemo_header" class="header_subpage">

        <div id="templatemo_menu" class="ddsmoothmenu">
            <ul>
                <li><a href="front/index.jsp">首页</a></li>
                <li><a href="front/about.jsp">预约</a></li>
                <li><a href="front/ActivityPage.action" >漫展活动</a>
                    <ul></ul>
                </li>
                <li><a href="front/view.jsp">热门景点</a></li>
                <li><a href="front/Discuss.jsp">作品秀</a></li>
                <li><a href="front/DiscussPage.action">讨论圈</a></li>
              <div style="float:right">
                <c:if test="${loginer.cusName==null}">
				  <li><a href="front/login3.jsp">登录</a></li>
				  <li><a href="#">注册</a></li>
				</c:if>
				<c:if test="${loginer.cusName!=null}">
					<li>&nbsp&nbsp&nbsp&nbsp${loginer.cusName},欢迎你</li>
					<li style="margin-left"><a href="front/person_home.action">个人中心</a></li>
					<li><a href="front/loginout3.action">退出</a></li>
			    </c:if>
			   </div>
            </ul>
            <div id="templatemo_search">
<form action="front/DiscussQuery" method="post">
<input type="text" value="Search" name="discussName" id="discussName" title="discussName" 
                  			onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
<input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" class="sub_btn" />
</form>
            </div>
            
            <br style="clear: left" />
            
        </div> 
        
        
</div> <!-- END of header wrapper -->
<div id="templatemo_main_wrapper">
<div id="templatemo_main">

<div class="clear"></div> 
    
    <div id="content-discussdetail2">
      	<h3 style="color:black;background:#69CEB4;">讨论圈</h3>
      	
      	    <div id="templatemo_menu-discuss"  class="ddsmoothmenu">
            <h2>
            <ul>
            <li style="margin-left:100px"><a href="front/DiscussPage.action">全部讨论</a></li>
            <li style="margin-left:200px"><a href="front/IssueDiscuss.jsp">我要发布</a></li>
            <li style="margin-left:230px"><a href="front/DiscussQueryBest.action">最热讨论</a></li>
            </ul>
            </h2>
            </div>
<!--         <c:forEach  items="${pageBean.pageList}" var="discuss">
        <div class="content_half left">
        <figure class="fig2" >
         <a href="front/DiscussDetail.action?discussId=${discuss.discussId}"><img src="${discuss.discussImage}" /></a>
         <figcaption>
                      <p>${discuss.discussMan}</p>
           <p>${discuss.discussName}</p>
         </figcaption>
       </figure>
        </div>
        </c:forEach>   --!>
            <c:forEach  items="${pageBean.pageList}" var="discuss">
            <div style="height:150px;border-top:1px solid #a5b6c8;
background:white;border-radius:10px;">

            <div id="divtalk">
            <p>${discuss.discussAnswer}</p>
            <p>回答</p>
            </div>
            <div style="float:right;width:90%;"><br>
            <p class="text"><strong><a href="front/DiscussDetail.action?discussId=${discuss.discussId}">${discuss.discussName}</a></strong></p>
            <p class="textbestanswer"><strong>最赞回答：${discuss.discussBest}
            </strong></p>
            </div>
            </div>
            </c:forEach>
   <div class="cleaner h20"></div>
 <!--翻页选项-->
<div style="margin-left:360px;">
  <a href="#" onclick="return false">当前页数：[${pagebean.currentPage}/${pagebean.pageCount}]</a>
  <c:if test="${pagebean.firstPage==true}">
  <a href="javaScript:;" onClick="return false;">首页</a>
  <a href="javaScript:;" onClick="return false;">上一页</a>
  </c:if>
  <c:if test="${pagebean.firstPage==false}">
  <a href="front/DiscussPage.action?curPage=1" >首页 </a>
  <a href="front/DiscussPage.action?curPage=${pagebean.previousPageCount }">上一页 </a>
  </c:if>
  <c:if test="${pagebean.lastPage==true}">
  <a href="javaScript:;" onClick="return false;">下一页 </a>
  <a href="javaScript:;" onClick="return false;">尾页 </a>
  </c:if>
  <c:if test="${pagebean.lastPage==false}">
  <a href="front/DiscussPage.action?curPage=${pagebean.nextPageCount}">下一页 </a>
  <a href="front/DiscussPage.action?curPage=${pagebean.pageCount}">尾页 </a>
  </c:if>
  <input id="goPage" type="text" style="width:40px;background:#ddddff;color:black;">
  <a href="javascript:;" onClick="test()">跳转</a>
 </div>
   <div class="cleaner h20"></div>
    
    </div>
<div class="cleaner"></div>
	<div class="foot">
		<p><a href="index.html">联系我们</a> |<a href="about.html">关于我们</a>  <a href="front/checkout.jsp">常见问题</a> | </p>
        <p>Copyright (c) 二次元&nbsp;2018-3-26 <a href="#">意见反馈</a> | 加入我们 <a href="front/checkout.jsp" title="源码之家">二次元社区</a></p>
	</div>
    <div class="cleaner"></div>
</div> <!-- END of footer -->
</body>
</html>