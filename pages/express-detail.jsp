<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>快递单打印</title>
<link rel="icon" type="image/png" href="/dist/img/favicon.ico" />
<link href="/dist/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
<link href="/dist/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
<link href="/dist/css/style.css?v=2.2.0" rel="stylesheet">
<link href="/dist/css/baba/iconfont.css" rel="stylesheet">
<style>
  *{margin:0;}
  </style>
</head>
<body>
<c:set var="template" value="${detail.packageExpectExpress.expressTemplate}"/>
<c:if test="${template ne ''}">
<%
/*模板帮助变量*/
HashMap<String,List<String[]>> assistTag = new HashMap<String,List<String[]>>();
/*一属性转多属性*/
List<String[]> templist = new ArrayList<String[]>();
templist.add(new String[]{"recvProvince","name"});
templist.add(new String[]{"recvCity","name"});
assistTag.put("recvProvinceCity", templist);
templist = new ArrayList<String[]>();
templist.add(new String[]{"recvProvince","name"});
templist.add(new String[]{"recvCity","name"});
templist.add(new String[]{"recvDistrict","name"});
templist.add(new String[]{"recvAddress",""});
assistTag.put("recvFullAddress", templist);
templist = new ArrayList<String[]>();
templist.add(new String[]{"sendProvince","name"});
templist.add(new String[]{"sendCity","name"});
assistTag.put("sendProvinceCity", templist);
templist = new ArrayList<String[]>();
templist.add(new String[]{"sendProvince","name"});
templist.add(new String[]{"sendCity","name"});
templist.add(new String[]{"sendDistrict","name"});
templist.add(new String[]{"sendAddress",""});
assistTag.put("sendFullAddress", templist);

%>
<c:if test= "${detail.recvDistrict eq NULL}">
<%
/*属性转其他属性*/
templist = new ArrayList<String[]>();
templist.add(new String[]{"",""});
assistTag.put("recvProvince",templist);
templist = new ArrayList<String[]>();
templist.add(new String[]{"recvProvince","name"});
assistTag.put("recvCity",templist);
templist = new ArrayList<String[]>();
templist.add(new String[]{"recvCity","name"});
assistTag.put("recvDistrict",templist);
%>
</c:if>
<c:if test="${detail.sendDistrict eq NULL}">
<%
templist = new ArrayList<String[]>();
templist.add(new String[]{"sendProvince","name"});
assistTag.put("sendProvince",templist);
templist = new ArrayList<String[]>();
templist.add(new String[]{"sendProvince","name"});
assistTag.put("sendCity",templist);
templist = new ArrayList<String[]>();
templist.add(new String[]{"sendCity","name"});
assistTag.put("sendDistrict",templist);
%>
</c:if>

<%
pageContext.setAttribute("assistTag",assistTag);
%>
<div class="scroll">
<div class="view-bg">
<style>
@media screen{
	div.scroll{
		height:100%;
		width:70%;
		overflow:auto;
		position:absolute;
	}
	div.view-bg{
		<c:if test="${template.backgroundUrl ne ''}">
		background:url('${template.backgroundUrl}') no-repeat;
		background-size:${template.backgroundWidth}px ${template.backgroundHeight}px;
		width:${template.backgroundWidth}px;
		height:${template.backgroundHeight}px;
		position:absolute;
		top:0px;
		left:0px;
		</c:if>
	}    
} 
@media   print{ 
	div.view-bg{
		background:none;
		width:${template.printAreaWidth+(template.printPaperOffsetLeft - template.printPaperMargin )*template.printAreaWidth/210}px;
		height:${template.printAreaHeight + (template.printPaperOffsetTop)*template.printAreaWidth/210}px;
		position:absolute;
		left:-${(template.printPaperMargin + template.printPaperOffsetLeft)*template.printAreaWidth/210}px;/*(10mm(页面设置边距)+10mm(左边偏移量))*3.77 */
		top:-${(template.printPaperMargin + template.printPaperOffsetTop)*template.printAreaWidth/210}px; /*（10mm(页面设置边距)+4mm(夹紧边)）*3.77*/
		over-flow:hidden;
	}
	div.no-print{
		display:none;
	}
} 
 
</style>
<c:forEach var="component" items="${template.components}">
	<div style="
	width:${component.fieldDispWidth}px;
	height:${component.fieldDispHeight}px;
	position:absolute;
	text-align:center;
	top:${component.fieldDispTop}px;
	left:${component.fieldDispLeft}px;
	font-size:${component.fieldDispFontsize}px;
	">
<c:if test="${detail.packageRealCost eq null or detail.packageRealCost eq ''}">
<c:set target="${detail}" property="packageRealCost" value="${detail.packageEstimateCost}"/>
</c:if>
<c:if test="${detail.packageRealProtectPriceFee eq null or detail.packageRealProtectPriceFee eq ''}">
<c:set target="${detail}" property="packageRealProtectPriceFee" value="${detail.packageProtectPriceFee}"/>
</c:if>

<c:if test="${component.fieldType eq 1}"><%--文本或子项文本类型，后来添加了指定数字处理 --%>
	<c:if test="${component.fieldUseSubProperty eq NULL}">
	<c:choose>
		<c:when test="${ component.fieldUseProperty eq 'packageEstimateCost' 
			or component.fieldUseProperty eq 'packageRealCost'
			or component.fieldUseProperty eq 'packageRealProtectPriceFee'
			or component.fieldUseProperty eq 'packageProtectPriceFee'
			or component.fieldUseProperty eq 'packageProtectPrice'
		}">
			<c:if test="${detail[component.fieldUseProperty] ne null and detail[component.fieldUseProperty]!=''}">
			${detail[component.fieldUseProperty] /100}
			</c:if>
		</c:when>
		<c:when test="${ component.fieldUseProperty eq 'packageWeight'}">
			${detail[component.fieldUseProperty] /1000}
		</c:when>
		<c:otherwise>
			${detail[component.fieldUseProperty]}
		</c:otherwise>
	</c:choose>
	</c:if>
	<c:if test="${component.fieldUseSubProperty ne NULL}">
	${detail[component.fieldUseProperty][component.fieldUseSubProperty]}
	</c:if>	
</c:if>
<c:if test="${component.fieldType eq 2}"><%--checkbox/radio类型 --%>
	<c:set var="OptionHelper" value="${fn:split(component.fieldUseSubProperty, '|')}"/>	
	<c:set var="RetangleBoxHelper" value="${fn:split(OptionHelper[fn:length(OptionHelper)-1],',')}"/>
	<c:set var="SelectedOptionHelper" value="${fn:split(OptionHelper[detail[component.fieldUseProperty]],',')}"/>
	<c:if test="${SelectedOptionHelper[0]>0}">
	<div style="
	width:${RetangleBoxHelper[0]}px;
	height:${RetangleBoxHelper[1]}px;
	position:absolute;
	text-align:center;
	top:${SelectedOptionHelper[1]}px;
	left:${SelectedOptionHelper[0]}px;
	font-size:${component.fieldDispFontsize}px;
	font-weight:bold;
	">√</div>
	</c:if>
</c:if>
<c:if test="${component.fieldType eq 3}"><%-- 组合属性，替换属性 --%>
	<c:if test="${assistTag[component.fieldUseProperty] ne NULL}">
	<c:forEach var="newPopertyName" items="${assistTag[component.fieldUseProperty]}">
		<c:if test="${newPopertyName[1] ne '' }">
			<c:set var="temp" value="${detail[newPopertyName[0]]}"/>
			${temp[newPopertyName[1]]}
			<c:remove var="temp"/>
		</c:if>
		<c:if test="${newPopertyName[1] eq '' }">
			<c:if test="${newPopertyName[0] ne ''}">
			${detail[newPopertyName[0]]}
			</c:if>
		</c:if> 
	</c:forEach>
	</c:if>
	<c:if test="${assistTag[component.fieldUseProperty] eq NULL}">
		<c:if test="${component.fieldUseSubProperty eq NULL}">
	${detail[component.fieldUseProperty]}
	</c:if>
	<c:if test="${component.fieldUseSubProperty ne NULL}">
	${detail[component.fieldUseProperty][component.fieldUseSubProperty]}
	</c:if>	
	</c:if>
</c:if>
<c:if test="${component.fieldType eq 4}"><%--属性转硬编码文本 --%>
	<c:set var="porpertyTextHelper" value="${fn:split(component.fieldUseSubProperty, ',')}"/>	
	${porpertyTextHelper[detail[component.fieldUseProperty]]}
</c:if>
<c:if test="${component.fieldType eq 5}"><%--直接显示图片--%>
	<c:set var="porpertyTextHelper" value="${fn:split(component.fieldUseSubProperty, ',')}"/>	
	<img src="${component.fieldUseProperty}" width="${component.fieldDispWidth}" height="${component.fieldDispHeight}"/>
</c:if>
</div>	
</c:forEach>
</div>
</c:if>
</div>
<div class="no-print delivery form-group form-horizontal" style="position:fixed;height:100%;right:0;top:0;width:30%;background:#FFF;border-left:2px solid #CCC;float:right;z-index:100;">
	<div class="ibox-title">打印步骤指南</div>
	<div class="ibox-content">
	<div class="row">
                        <label class="col-sm-3 control-label">第一步</label>
						<div class="col-sm-9">
						<p class="form-control-static">
							将打印机入纸口的<strong>刻度尺拨动到${template.printPaperOffsetLeft}mm，使打印居中</strong>，放入<strong>${template.description} </strong>打印纸,左边对齐刻度尺正面朝上。
							</p>
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-3 control-label">第二步</label>
						<div class="col-sm-9">
						<p class="form-control-static">
							<strong>第一次使用打印机请务必设置！</strong>
						</p>
						<p class="form-control-static">
						Chrome:<br/>单击第打印（在第三步）后设置，
						<c:if test="${template.printPaperMargin eq 10}">
						使用<strong>默认</strong>打印配置,即“A4 ，纵向，默认边距(10mm)”，
						</c:if>
						<c:if test="${template.printPaperMargin ne 10}">
						使用以下打印配置,即<strong>“A4 ，纵向，自定义边距${template.printPaperMargin}mm”，</strong>
						</c:if>					
						并<strong>取消页眉页脚</strong>。	
						</p>
						<p class="form-control-static">
						IE:<br/>使用<strong>右键</strong>—<strong>打印预览</strong>，设置四个方向的<strong>页边距均为${template.printPaperMargin}mm,页眉页脚均设置为空</strong>，其余不变，即保持“A4，纵向”。
						</p>
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-3 control-label">第三步</label>
						<div class="col-sm-9">
						<p class="form-control-static">
							单击下面的打印，并在弹出框中选择“Deli DL-630K打印设备”，并打印。
						</p>
						<p class="form-control-static">
							<a class="btn btn-primary btn-lg" href="javascript:window.print();">打印</a>
						</p>
						</div> 
					</div>
	</div>
</div>
</body></html>