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
<title>漫展详情</title>
<base href="<%=basePath%>" />

<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
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

<!--js实现展开收起-->
<script type="text/javascript"> 

function show()
{ 
  var box = document.getElementById("box"); 
  box.style.cssText = 'margin-left:4px;width: 999px; height: 100%;font-size:13px;';

  var text = box.innerHTML; 
  var newBox = document.createElement("div"); 
  var btn = document.createElement("a"); 
  newBox.innerHTML = text.substring(0,92); 
  btn.innerHTML = text.length > 92 ? "显示全部" : ""; 
  btn.onclick = function(){ 
    if(btn.innerHTML == "显示全部")
    { 
      btn.innerHTML = "收起"; 
      newBox.innerHTML = text; 
    }
    else
    { 
      btn.innerHTML = "显示全部"; 
      newBox.innerHTML = text.substring(0,92); 
    } 
  } 
  box.innerHTML = ""; 
  box.appendChild(newBox); 
  box.appendChild(btn); 
} 
window.onload=function()
{
  show(); 
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
                <li><a href="front/ActivityPage.action">漫展活动</a>
                    <ul></ul>
                </li>
                <li><a href="front/view.jsp">热门景点</a></li>
                <li><a href="front/Discuss.jsp">作品秀</a></li>
                <li><a href="front/DiscussPage.action">讨论圈</a></li>
              <div style="float:right">
                <c:if test="${loginer.cusName==null}">
				  <li><a href="front/login2.jsp">登录</a></li>
				  <li><a href="#">注册</a></li>
				</c:if>
				<c:if test="${loginer.cusName!=null}">
					<li>&nbsp&nbsp&nbsp&nbsp${loginer.cusName},欢迎你</li>
					<li style="margin-left"><a href="front/person_home.action">个人中心</a></li>
					<li><a href="front/loginout2.action">退出</a></li>
			    </c:if>
			   </div>
            </ul>
            <div id="templatemo_search">
<form action="front/ActivityQuery1" method="post">
<input type="text" value="Search" name="actName" id="actName" title="actName" 
                  			onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
<input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" class="sub_btn" />
</form>
            </div>
            
            <br style="clear: left" />
            
        </div> 
        
        
</div> <!-- END of header wrapper -->
<div id="templatemo_main_wrapper">
<div id="templatemo_main">

    <div id="contentdetail">
      	<h3>漫展详情</h3>
        <div class="content_half left">
        	<a><img src="${AList[0].actImage}" height="300px" width="350px" /></a>
        </div>
            <div class="content_half right">
            
                <table style="margin-left:-200px;line-height:35px;font-size:16px">
                    <tr>
                        <td width="200">&diams;&nbsp;综合评价:</td>
                        <c:forEach begin="1" end="${AList[0].actStar}" >
                        <img style="margin-bottom:-40px" width=30px height=30px src="image/img/五角星图标.jpg">
                        &nbsp;
                        </c:forEach>
                    </tr>
                    <tr>
                        <td width="200">&diams;&nbsp;漫展名称:</td>
                        <td width="200"><strong>${AList[0].actName}</strong></td>
                    </tr>
                    <tr>
                        <td width="200">&diams;&nbsp;地址:</td>
                        <td width="200"><strong>${AList[0].actAddr}</strong></td>
                    </tr>
                    <tr>
                        <td width="200">&diams;&nbsp;时间:</td>
                        <td width="200"><strong>${AList[0].actDate}</strong></td>
                    </tr>
                    <tr>
                        <td width="200">&diams;&nbsp;举办方:</td>
                        <td width="200"><strong>${AList[0].actSpon}</strong></td>
                    </tr>

                    
                </table>
              
                <div class="cleaner h20"></div>
               
			</div>
            <div class="cleaner h40"></div>
            
            <h3 style="color:black">漫展详情</h3>
            <div id="box">${AList[0].actCont}</div>
       
             <div class="Cont_Box">
                <form action="front/addeval.action?actId=${AList[0].actId}" method="post" >
				<div class="cont-box">
                <textarea id="evalCont" name="evaCont" class="text" MaxLength="100" placeholder="请输入...（100字以内）" required></textarea>
				</div>
				<div class="tools-box">
					<div class="operator-box-btn"><span class="face-icon"  >☺</span><span class="img-icon">▧</span>
					</div>
					<div class="submit-btn">
                    <input type="submit" value="提交评论" />
                    </div>
                </div>    
                </form>
        <c:forEach items="${eList}" var="actInfo">
        <div id="info-show">
		
		<div class="head-face">
		<img src="image/img/hh.png" >
		</div>
		<div class="reply-cont">
		<p class="username"><a href="javascript:void(0)">${actInfo.evaMan}</a></p>
		<p class="comment-body">${actInfo.evaCont}</p>
		<p class="comment-footer"><a href="#" onclick="return false">${actInfo.evaDate}</a>　
				<a href="#">回复&nbsp;<img src="image/img/PL.jpg" width=24px;height=24px;></a>　
		<a href="#">点赞&nbsp;<img src="image/img/DZ.jpg" width=24px;height=24px;></a>　
		<a href="#">转发&nbsp;<img src="image/img/ZF.jpg"width=24px;height=24px; ></a></p>
		
		</div>

		</div>
		<hr style="height:1px;border-top:1px solid  #e0e0e0;" />
		</c:forEach>
   
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