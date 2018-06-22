# erciyuan
学生做到了
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
<title>漫展活动</title>
<base href="<%=basePath%>" />

<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="js/citycasecade.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	  $("#sf").change(function(){
	    //  alert($("#sf").val());
	      changelocation2($("#sf").val());
	  });
	  
	  
	  $('#mySelect').change(function(){  
		//    alert($(this).val());  
		//    var p1=$(this).children('option:selected').val();//这就是selected的值  
	     window.location.href="front/AddressPage.action?address="+$(this).val()+"";//页面跳转并传参  

	//	   $.post("front/AddressPage.action",{address:$(this).val()},function(result){
	//	      alert("myselext");
	//	  });
		});
	});



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

<script type="text/javascript">
function test(){
//这里还需要实现一些对于输入页码的安全性验证。比如不能为空，必须是数字这些。
var page = document.getElementById("goPage").value;
window.location.href="front/ActivityPage.action?curPage="+page;
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
	<div id="sidebar" class="left">
    	<div class="sidebar_box"><span class="bottom"></span>
            <h3 style="background:#69CEB4">漫展地点&nbsp;&nbsp;⊙</h3>
            <Form id="Form1" name="Form1" action="" method="post">
 <Table><TR><TD>
<FONT color=#ff9933 > 
<select  id="sf"  style=" background: url(images/templatemo_main.png) " name="sf"  >                                                    
<option  value="" selected>--请选择省份--</option>
                                                      
                                                                                
                                                      <option value='38'>广东</option>
                                                      <option value='39'>江西</option>
                                                      <option value='40'>安徽</option>
                                                      <option value='41'>福建</option>
                                                      <option value='42'>广西</option>
                                                      <option value='43'>云南</option>
                                                      <option value='44'>四川</option>
                                                      <option value='45'>贵州</option>
                                                      <option value='46'>湖南</option>
                                                      <option value='47'>浙江</option>
                                                      <option value='48'>江苏</option>
                                                      <option value='49'>河南</option>
                                                      <option value='50'>河北</option>
                                                      <option value='51'>山东</option>
                                                      <option value='52'>山西</option>
                                                      <option value='53'>陕西</option>
                                                      <option value='54'>甘肃</option>
                                                      <option value='55'>青海</option> 
                                                      <option value='57'>内蒙古自治区</option>
                                                      <option value='58'>辽宁</option>
                                                      <option value='59'>吉林</option>
                                                      <option value='60'>黑龙江</option>
                                                      <option value='61'>新疆自治区</option>
                                                      <option value='62'>西藏自治区</option>
                                                      <option value='63'>海南</option>
                                                      <option value='64'>澳门</option>
                                                      <option value='65'>香港</option>
                                                      <option value='66'>台湾</option>
                                                      <option value='67'>北京市</option>
                                                      <option value='68'>天津市</option>
                                                      <option value='69'>上海</option>
                                                      <option value='70'>重庆市</option>
                                                      <option value='37'>湖北</option> 

</select>
</FONT> </div></TD>
<TD width="125"><FONT color=#ff9933 > 
<select id="mySelect" name="city">  
<option selected value="" >--选择城市--</option> 
</select>  
             </Td>
             </TR>
             </TABLE>

 </Form>   
            <div class="content"> 
                <ul class="sidebar_list">
                    <li><a href="front/AddressPage.action?address=南京">南京</a></li>
                    <li><a href="front/AddressPage.action?address=上海">上海</a></li>
                    <li><a href="front/AddressPage.action?address=北京">北京</a></li>
                    <li><a href="front/AddressPage.action?address=武汉">武汉</a></li>
                    <li><a href="front/AddressPage.action?address=天津">天津</a></li>
                    <li><a href="front/AddressPage.action?address=重庆">重庆</a></li>
                    <li><a href="front/AddressPage.action?address=杭州">杭州</a></li>
                    <li><a href="front/AddressPage.action?address=南昌">南昌</a></li>
                    <li><a href="front/AddressPage.action?address=深圳">深圳</a></li>
                </ul>
            </div>
        </div>
        <div class="sidebar_box"><span class="bottom"></span>
            <h3>Weekly Special</h3>   
            <div class="content special"> 
            
                <a href="front/ActivityDetail.action?actId=26"><img src="image/img/mzB.jpg" height="185px" width="185px"alt="Flowers" />
                </a>
                <h3>
                <a href="front/ActivityDetail.action?actId=26">春日祭次元计划动漫展</a>
                </h3>
                <p>
                	地点：
                    <span class="price special_price">南京市</span>
                </p>
            </div>
        </div>
    </div>
    
    <div id="content" class="right">
		<h3>漫展列表</h3>
        <table cellpadding="15px"  class="table-td"  >
        <tr >
                    <td><a href="front/MonthPage.action?month=01">1月</a></td>
                    <td><a href="front/MonthPage.action?month=02">2月</a></td>
                    <td><a href="front/MonthPage.action?month=03">3月</a></td>
                    <td><a href="front/MonthPage.action?month=04">4月</a></td>
                    <td><a href="front/MonthPage.action?month=05">5月</a></td>
                    <td><a href="front/MonthPage.action?month=06">6月</a></td>
                    <td><a href="front/MonthPage.action?month=07">7月</a></td>
                    <td><a href="front/MonthPage.action?month=08">8月</a></td>
                    <td><a href="front/MonthPage.action?month=09">9月</a></td>
                    <td><a href="front/MonthPage.action?month=10">10月</a></td>
                    <td><a href="front/MonthPage.action?month=11">11月</a></td>
                    <td><a href="front/MonthPage.action?month=12">12月</a></td>
         </tr>

        </table><br>
 
        <c:forEach  items="${pageBean.pageList}" var="activity">
        <div class="product_box">
        <figure1 class="fig3" >
            <a href="front/ActivityDetail.action?actId=${activity.actId}"><img src="${activity.actImage}"
             height="165px" width="165px" alt="activity set 1" /></a>
        </figure1>
      		<h3>${activity.actName}</h3>
            <h3>${activity.actAddr}</h3>
            <div class="add_to_cart" >
            <div class="left">
               <a href="javascript:;" style="font-size:14px;margin:3px 0px 0px 20px;">星级</a>
            </div>
            <div class="left" style="margin-left:15px;" >
               <c:forEach begin="1" end="${activity.actStar}" >
               <img style="margin:0px 0px -1px 3px;" width=12px height=15px src="image/img/五角星图标.jpg">
               </c:forEach>
            </div>
            </div>
        </div>
        </c:forEach>
       
               	
        <div class="cleaner h20"></div>
 <!--翻页选项-->
<div style="margin-left:300px;">
  <a>当前页数：[${pagebean.currentPage}/${pagebean.pageCount}]</a>
  <c:if test="${pagebean.firstPage==true}">
  <a href="javaScript:;" onClick="return false;">首页</a>
  <a href="javaScript:;" onClick="return false;">上一页</a>
  </c:if>
  <c:if test="${pagebean.firstPage==false}">
  <a href="front/ActivityPage.action?curPage=1" >首页 </a>
  <a href="front/ActivityPage.action?curPage=${pagebean.previousPageCount }">上一页 </a>
  </c:if>
  <c:if test="${pagebean.lastPage==true}">
  <a href="javaScript:;" onClick="return false;">下一页 </a>
  <a href="javaScript:;" onClick="return false;">尾页 </a>
  </c:if>
  <c:if test="${pagebean.lastPage==false}">
  <a href="front/ActivityPage.action?curPage=${pagebean.nextPageCount}">下一页 </a>
  <a href="front/ActivityPage.action?curPage=${pagebean.pageCount}">尾页 </a>
  </c:if>
  <input id="goPage" type="text" style="width:40px;background:#ddddff;color:black;">
  <a href="javascript:;" onClick="test()">跳转</a>
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
