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

<link rel="stylesheet" href="css/orman.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
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

</head>

<body>

<div id="templatemo_wrapper_sp">
<div id="templatemo_header_wsp">
	<div id="templatemo_header" class="header_subpage">

        <div id="templatemo_menu" class="ddsmoothmenu">
            <ul>
                <li><a href="front/index.jsp">首页</a></li>
                <li><a href="front/about.jsp">预约</a></li>
                <li><a href="front/ActivityPage.action" class="selected">漫展活动</a>
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
    
    <div id="content-IssueDiscuss" class="right">
      	<h3>讨论圈</h3>
   <div class="cleaner h20"></div>
            <div><span class="discussName-A">有什么想要吐槽的呢</span></div>
       
             <div class="Cont_Box">
                <form action="front/IssueDiscuss.action" method="post" enctype="multipart/form-data" >
                    <div class="cleaner h20"></div>                       
                &nbsp;<span class="discussIssue">讨论主题：</span><div class="cleaner h20"></div> 
             <textarea id="discussCont" name="discussName" MaxLength="20"  class="cont-boxName" placeholder="请输入讨论主题...（20字以内）" required></textarea>
				 <div class="cleaner h20"></div>
				&nbsp;<span class="discussIssue">上传图片：</span>
				<div class="cleaner h20"></div>
				<input class="discussIssueImg" type="file" name="upload" required><br/>
				<div class="cleaner h20"></div>
				&nbsp;<span class="discussIssue">讨论内容：</span>
				<div class="cleaner h20"></div>
				<div class="cont-box">
              <textarea id="discussCont" name="discussCont" MaxLength="100" class="text" placeholder="请输入讨论内容...（100字以内）" required></textarea>
				</div>
				<div class="tools-box">
					<div class="operator-box-btn"><span class="face-icon"  >☺</span><span class="img-icon">▧</span>
					</div>
					<div class="submit-btn">
                    <input type="submit" value="提交讨论" />
                    </div>
                </div>    
                </form>

        </div>    
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