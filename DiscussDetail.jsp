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
function changeLink(){  
if(document.getElementById("connectSocket").value == "连接"){  
document.getElementById("connectSocket").value = "断开";  
}else{  
document.getElementById("connectSocket").value = "连接";  
}  
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
    
<div id="content-discussdetail">

      	<h3 style="background:#69CEB4;">讨论圈</h3>
      	<div id="div_tag">
<c:forEach items="${DList}" var="dislable">
<a class="btn btn--base btn--tag-1 btn--base-border-radius-circle btn--new-tag" href="javascript:;">
<div class="btn__text-wrap">
${dislable.dislableName}
</div>
</a>
</c:forEach>
<a class="btn btn--base btn--tag-1 btn--base-border-radius-circle btn--new-tag" href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">添加标签&nbsp;+</a>

        <div id="light" class="white_content">给讨论加上标签吧 
<a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">点击关闭</a>
<form  action=front/IssueLable.action?discussId=${DList[0].discussId} method="post" >
				<div class="cont-box">
                <textarea  name="dislable_Name" class="text" MaxLength="8" placeholder="请输入...（8字以内）" required></textarea>
				</div>
				<div class="tools-box">
					<div class="operator-box-btn"><span class="face-icon"  >☺</span><span class="img-icon">▧</span>
					</div>
					<div class="submit-btn">
                    <input type="submit" value="提交" onclick="isEmpty()" />
                    </div>
                </div>    
</form>
</div> 
<div id="fade" class="black_overlay"></div> 
</div>
<div><br>
<p><span class="discussName">&nbsp;&nbsp;${DList[0].discussName}</span><br><br>
&nbsp;&nbsp;<span class="discussName-A">讨论</span>&nbsp;
<span class="discussName-A">|</span>&nbsp;
<span class="discussName-A">${DList[0].discussDate}</span>&nbsp;
<span class="discussName-A">|</span>&nbsp;&nbsp;&nbsp;
<span class="discussName-A">发起人：<a href="javascript:void(0)">${DList[0].discussMan}</a></span>
<hr>
</p><p style="letter-spacing:3px; margin:20px;">
${DList[0].discussCont}
</p>
<img src="${DList[0].discussImage}" width="500px" height="350px" style="margin-left:20px;" />
<div  style="float:right">
</div>

</div>
           <div class="cleaner h40"></div>
     

   <div class="cleaner h20"></div>
 
   <div class="cleaner h20"></div>

            <div>&nbsp;&nbsp;&nbsp;<span class="discussName-A">有什么想要吐槽的呢</span></div>
       
             <div class="Cont_Box">
                <form action="front/addevadiscuss.action?discussId=${DList[0].discussId}" method="post" >
				<div class="cont-box">
                <textarea id="evalCont" name="evaCont" MaxLength="100" class="text" placeholder="请输入...（100字以内）" required></textarea>
				</div>
				<div class="tools-box">
					<div class="operator-box-btn"><span class="face-icon"  >☺</span><span class="img-icon">▧</span>
					</div>
					<div class="submit-btn">
                    <input type="submit" value="提交评论" />
                    </div>
                </div>    
                </form>
        <c:forEach items="${eList}" var="discussInfo">
        <div id="info-show">
		<ul>
        <li>
		<div class="head-face">
		<img src="image/img/hh.png" >
		</div>
		<div class="reply-cont">
		<p class="username">${discussInfo.evaMan}</p>
		<p class="comment-body">${discussInfo.evaCont}</p>
		<p class="comment-footer"><a href="#" onclick="return false">${discussInfo.evaDate}</a>　
		<a href="#">回复&nbsp;<img src="image/img/PL.jpg" width=24px;height=24px;></a>　
		<a href="#">点赞&nbsp;<img src="image/img/DZ.jpg" width=24px;height=24px;></a>　
		<a href="#">转发&nbsp;<img src="image/img/ZF.jpg"width=24px;height=24px; ></a></p>
		</div>
		</li>
        </ul>
		</div>
		</c:forEach>      
</div>  
</div>
<div id="IssueDiscuss">
<div class="addIssueDiscuss">
<input type="submit" id="connectSocket" value="连接" onClick="changeLink()">  
<a href="#">+&nbsp;&nbsp;关注讨论</a>
</div>
<p style="margin-left:25px;"><span class="discussName-AA">3</span>人关注该讨论&nbsp;></p>
<div style="margin-left:30px;">
<img src="image/img/hh.png"width=24px;height=24px; />
<img src="image/img/ivs (3).png"width=24px;height=24px; />
<img src="image/img/ivs (8).png"width=24px;height=24px; />
</div>
<p class="otherdiscuss">&nbsp;&nbsp;其他讨论&nbsp;></p>
<div style="margin-left:20px;">
<p>如果我和你妈掉水了，你先救谁？</p>
<p>共有<span style="color:#8e8e8e;font-size:14px;">2</span>个回答</p>
<p>掉哪条河里了，掉哪条河里了？</p>
<p>共有<span style="color:#8e8e8e;font-size:14px;">2</span>个回答</p>
<p>你不知道不行啊，你得告诉我掉哪条河了我好去救他们是不是？</p>
<p>共有<span style="color:#8e8e8e;font-size:14px;">2</span>个回答</p>
<p>我是说如果掉河里了...</p>
<p>共有<span style="color:#8e8e8e;font-size:14px;">2</span>个回答</p>
<p>如果掉河里了关我什么事，我又不认识如果。</p>
<p>共有<span style="color:#8e8e8e;font-size:14px;">2</span>个回答</p>
<p>我是说假如...</p>
<p>共有<span style="color:#8e8e8e;font-size:14px;">2</span>个回答</p>
<p>假如我也不认识啊，你老问我这些问题，我能答上来吗？</p>
<p>共有<span style="color:#8e8e8e;font-size:14px;">2</span>个回答</p>
<p>我是打比方！</p>
<p>共有<span style="color:#8e8e8e;font-size:14px;">2</span>个回答</p>
<p>比方我认识，他是我朋友，你为什么要打比方，啊，你怎么这么粗鲁！</p>
<p>共有<span style="color:#8e8e8e;font-size:14px;">2</span>个回答</p>
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