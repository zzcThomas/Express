<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file='../common/header.jsp' %>
<div id="page-wrapper" class="gray-bg dashbard-1">
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-sm-4">
		<h2>快递收发</h2>
		<ol class="breadcrumb">
			<li><a href="/index">首页</a></li>
			<li>快递列表</li>
		</ol>
	</div>
</div>
<div class="wrapper wrapper-content delivery">
<c:if test="${role eq 'user' }" >
 	<div class="row">
		<div class="col-sm-4">
			<a href="/new" class="btn btn-primary btn-sm add"><i class="fa fa-plus"></i>&nbsp;对公快递</a>
			<a href="/new-global" class="btn btn-primary btn-sm add"><i class="fa fa-plus"></i>&nbsp;跨境对公快递</a>
		</div>
		<div class="col-sm-6">
			<div class="input-group">
			<form id="search_form" action="" method="get"><input type="text" name="q" id="search_query_text" class="form-control" placeholder="输入要搜索的 名字 或 手机号"/></form> <span class="input-group-btn"> <button type="button" class="btn btn-primary" id="search_btn">搜索</button> </span>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox">
				<table> 
					<thead class="ibox-title">
					<tr>
						<td>#</td><td>申请单编号</td><td>申请时间</td><td>收件人</td><td>状态</td><td>操作</td>
					</tr>
					</thead>
					<c:set var="index" value="1"/>
					<tbody class="ibox-content ">
					<c:if test="${pageCount<1 }"><tr><td colspan="6">空空如也~</td></tr></c:if>
					<c:forEach var="delivery" items="${list}">
					<tr>
						<td>${index}</td>
						<td>${delivery.orderNum}</td>
						<td>
							${delivery.orderCreateTime} 
						</td>
						<td>${delivery.recvName}</td>
						<td>
							<span class="status-${delivery.orderStatus.code}}">
							${delivery.orderStatus.userInstruction}
						<c:choose>	
						    <c:when test="${delivery.orderStatus.id eq '1'}">
						        
						    </c:when>
						    <c:when test="${delivery.orderStatus.id eq '2'}">
						       	，预计费用为${delivery.packageEstimateCost/100 }元
						    </c:when>
						    <c:when test="${delivery.orderStatus.id eq '3' or delivery.orderStatus.id eq '31'}">
							   	，预计费用为${(delivery.packageRealCost!=null && delivery.packageRealCost!="")?delivery.packageRealCost/100:delivery.packageEstimateCost/100 }元    
 							</c:when>
						    <c:when test="${delivery.orderStatus.id eq '5'}">
						     	，费用为${delivery.packageRealCost/100 }元  
						     	<%--，快递单号${delivery.packageExpressNum}，快递状态:--%>
						    </c:when>		    
						</c:choose>
						</span>
						</td>
						<td>
						<c:if test="${delivery.orderStatus.id eq '1' }">
							<a class="cancel_btn" data-value="${delivery.id }">撤回申请</a>
						</c:if>
						<c:if test="${delivery.orderStatus.id eq '-1' }">
							<a class="modify_btn" href="/modify<c:if test="${delivery.packageIsCrossBorder}">-global</c:if>/${delivery.id }">修改申请</a>
						</c:if>
							<a href="/${role}-detail/${delivery.id}">查看申请详情</a>
						</td>
					</tr>
					<c:set var="index" value="${index+1 }"/>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function(){
		$(".cancel_btn[data-value]").click(function(){
			var id = $(this).attr('data-value');
			var layer_index = layer.confirm('确认撤回申请？', {
      		  btn: ['撤回','取消'],
      		  title:false,
      		  closeBtn:false
      		}, function(){
      			$.ajax({
      				url:'/cancel/'+id,
      				type:'POST',
      				dataType:'json',
      				error:function(){
      					layer.close(layer_index);
      					layer.msg('操作失败', {icon: 5,shade:[0.5,'#000']});
      				},
      				success:function(data){
      					if(data.code==200){
      						layer.msg(data.message);
      						location.reload();
      					}else{
      						layer.close(layer_index);
      						layer.msg(data.message, {icon: 5,shade:[0.5,'#000']});
      					}
      				}
      			});
      		});
		});
	});
	</script>
</c:if>
<c:if test="${role eq 'mailroom'}" >
	<div class="row">
		<div class="col-sm-5">
			<a href="/${role}-list/new" class="btn btn-primary btn-sm <c:if test="${status eq 'new' }">active</c:if>">新单</a>
			<a href="/${role}-list/pending" class="btn btn-primary btn-sm <c:if test="${status eq 'pending' }">active</c:if>">待发送</a>
			<a href="/${role}-list/finished" class="btn btn-primary btn-sm <c:if test="${status eq 'finished' }">active</c:if>">已完成</a>
			<a href="/${role}-list/reject" class="btn btn-danger btn-sm <c:if test="${status eq 'reject' }">active</c:if>">审批不通过</a>
			<a href="/${role}-list/all" class="btn btn-success btn-sm <c:if test="${status eq 'all' }">active</c:if>">全部单子</a>
		</div>
		<div class="col-sm-5">
			<div class="input-group">
			<form id="search_form" action="" method="get"><input type="text" name="q" id="search_query_text" class="form-control" placeholder="输入要搜索的 名字 或 手机号"/></form> <span class="input-group-btn"> <button type="button" class="btn btn-primary" id="search_btn">搜索</button> </span>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox">
				<table> 
					<thead class="ibox-title">
					<tr>
						<td>#</td><td>申请单编号</td><td>申请人/寄件人</td><td>寄件人手机号</td><td>申请时间</td><td>期望快递公司</td><td>托寄物类型</td><td>状态</td><td>操作</td>
					</tr>
					</thead>
					<c:set var="index" value="1"/>
					<tbody class="ibox-content ">
					<c:if test="${pageCount<1 }"><tr><td colspan="9">空空如也~</td></tr></c:if>
					<c:forEach var="delivery" items="${list}">
					<tr>
						<td>${index}</td>
						<td>${delivery.orderNum}</td>
						<td>
							${delivery.userName}(${delivery.userId})
							<c:if test="${delivery.sendName!=delivery.userName}"> / ${delivery.sendName}</c:if>
						</td>
						<td>${delivery.sendPhonenum}</td>
						<td>${delivery.orderCreateTime}</td>
						<td>${delivery.packageExpectExpress.name}</td>
						<td><c:if test="${delivery.packageType=='1'}">文件</c:if><c:if test="${delivery.packageType=='2'}">物品</c:if></td>
						<td>
						<span class="status-${delivery.orderStatus.code} }">
								${delivery.orderStatus.mailroomInstruction}
						<c:choose>	
						    <c:when test="${delivery.orderStatus.id eq '2'}">
						       ，预计费用为${delivery.packageEstimateCost/100 }元
						    </c:when>
						    <c:when test="${delivery.orderStatus.id eq '3' or delivery.orderStatus.id eq '31'}">
							   	，预计费用为${(delivery.packageRealCost!=null && delivery.packageRealCost!="")?delivery.packageRealCost/100:delivery.packageEstimateCost/100 }元    
 							</c:when>
						    <c:when test="${delivery.orderStatus.id eq '5'}">
						     	，费用为${delivery.packageRealCost/100 }元  
 								<%--, 快递状态：  --%> 
						    </c:when>		    
						</c:choose>
						</span>
						</td>
						<td><a href="/${role}-detail/${delivery.id}">查看详情</a></td>
					</tr>
					<c:set var="index" value="${index+1 }"/>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</c:if>
	<c:if test="${ role eq 'admin'}" >
	<div class="row">
		<div class="col-sm-2">
			<a href="/${role}-list/all" class="btn btn-success btn-sm <c:if test="${status eq 'all' }">active</c:if>">全部单子</a>
			<a href="/${role}-list/sendout" class="btn btn-primary btn-sm <c:if test="${status eq 'sendout' }">active</c:if>">已发出</a>
		</div>
		<form id="search_form" action="" method="get">
		<div class="col-sm-6">
		<div class="row">
			<div class="col-sm-3">
				<select class="form-control m-b" id="department" name="department">
					<option value="" <c:if test="${param.department eq '' or param.department eq null}">selected</c:if> >选择部门</option>
					<c:forEach var="item" items="${departmentList }">
					<option value="${item}" <c:if test="${param.department eq item}">selected</c:if>>${item}</option>
					</c:forEach>
	            </select>
            </div>
            <div class="col-sm-3">
	            <select class="form-control m-b" id="express" name="express">
					<option value="" <c:if test="${param.express eq '' or param.express eq null}">selected</c:if> >选择快递</option>
					<c:forEach var="item" items="${packageExpressList }">
					<option value="${item.id}" <c:if test="${param.express eq item.id}">selected</c:if>>${item.name}</option>
					</c:forEach>
	            </select>
            </div>
			<div class="col-sm-3"><input placeholder="开始日期" class=" laydate-icon layer-date form-control" id="begin" name="begin" value="${param.begin}"/></div>
            <div class="col-sm-3"><input placeholder="结束日期" class=" laydate-icon layer-date form-control" id="end" name="end" value="${param.end}" /></div>
            </div>
        </div>
		<div class="col-sm-3">
		<div class="row">
			<div class="col-sm-10">
				<div class="input-group">
					<input type="text" name="q" id="search_query_text" class="form-control" placeholder="搜索名字或 手机号" value="${param.q}"/> <span class="input-group-btn"> <button type="button" class="btn btn-primary" id="search_btn">搜索</button> </span>
				</div>
			</div>
			<div class="col-sm-1">
				<button type="button" class="btn btn-primary" id="clear_btn">清空</button>
			</div>
		</div>
		</div>
		</form>
	</div> 
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox">
				<table> 
					<thead class="ibox-title">
					<tr>
						<td>#</td><td>申请单编号</td><td>申请人/寄件人</td><td>寄件人手机号</td><td>申请时间</td><td>期望快递公司</td><td>托寄物类型</td><td>状态</td><td>操作</td>
					</tr>
					</thead>
					<c:set var="index" value="1"/>
					<tbody class="ibox-content ">
					<c:if test="${pageCount<1 }"><tr><td colspan="9">空空如也~</td></tr></c:if>
					<c:forEach var="delivery" items="${list}">
					<tr>
						<td>${index}</td>
						<td>${delivery.orderNum}</td>
						<td>
							${delivery.userName}(${delivery.userId})
							<c:if test="${delivery.sendName!=delivery.userName}"> / ${delivery.sendName}</c:if>
						</td>
						<td>${delivery.sendPhonenum}</td>
						<td>${delivery.orderCreateTime}</td>
						<td>${delivery.packageExpectExpress.name}</td>
						<td><c:if test="${delivery.packageType=='1'}">文件</c:if><c:if test="${delivery.packageType=='2'}">物品</c:if></td>
						<td>
						<span class="status-${delivery.orderStatus.code} }">
								${delivery.orderStatus.name}
						<c:choose>	
						    <c:when test="${delivery.orderStatus.id eq '2'}">
						       ，预计费用为${delivery.packageEstimateCost/100 }元
						    </c:when>
						    <c:when test="${delivery.orderStatus.id eq '3' or delivery.orderStatus.id eq '31'}">
							   	，预计费用为${(delivery.packageRealCost!=null && delivery.packageRealCost!="")?delivery.packageRealCost/100:delivery.packageEstimateCost/100 }元    
 							</c:when>
						    <c:when test="${delivery.orderStatus.id eq '5'}">
						     	，费用为${delivery.packageRealCost/100 }元
						     	 <%--, 快递状态：  --%>
						    </c:when>		    
						</c:choose>
						</span>
						</td>
						<td><a href="/${role}-detail/${delivery.id}">查看详情</a></td>
					</tr>
					<c:set var="index" value="${index+1 }"/>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</c:if>
<c:if test="${ role eq 'superior'}" >
	<div class="row">
		<div class="col-sm-4">
			<a href="/${role}-list/new" class="btn btn-primary btn-sm <c:if test="${status eq 'new' }">active</c:if>">新单</a>
			<a href="/${role}-list/pass" class="btn btn-primary btn-sm <c:if test="${status eq 'pass' }">active</c:if>">已通过</a>
			<a href="/${role}-list/reject" class="btn btn-primary btn-sm <c:if test="${status eq 'reject' }">active</c:if>">已驳回</a>
		</div>
		<div class="col-sm-6">
			<div class="input-group">
				<form id="search_form" action="" method="get"><input type="text" name="q" id="search_query_text" class="form-control" placeholder="输入要搜索的 名字 或 手机号"/></form> <span class="input-group-btn"> <button type="button" class="btn btn-primary" id="search_btn">搜索</button> </span>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="ibox">
				<table> 
					<thead class="ibox-title">
					<tr>
						<td>#</td><td>申请单编号</td><td>申请人/寄件人</td><td>收件人</td><td>申请时间</td><td>期望快递公司</td><td>托寄物类型</td><td>状态</td><td>申请事由</td><td>操作</td>
					</tr>
					</thead>
					<c:set var="index" value="1"/>
					<tbody class="ibox-content ">
					<c:if test="${pageCount<1 }"><tr><td colspan="10">空空如也~</td></tr></c:if>
					<c:forEach var="delivery" items="${list}">
					<tr>
						<td>${index}</td>
						<td>${delivery.orderNum}</td>
						<td>${delivery.userName}(${delivery.userId})
							<c:if test="${delivery.sendName!=delivery.userName}"> / ${delivery.sendName}</c:if>
						</td>
						<td>${delivery.recvName}</td>
						<td>${delivery.orderCreateTime}</td>
						<td>${delivery.packageExpectExpress.name}</td>
						<td><c:if test="${delivery.packageType=='1'}">文件</c:if><c:if test="${delivery.packageType=='2'}">物品</c:if></td>
						<td>
						<span class="status-${delivery.orderStatus.code} }">
								${delivery.orderStatus.superiorInstruction}
						<c:choose>	
						    <c:when test="${delivery.orderStatus.id eq '2'}">
						       ，预计费用为${delivery.packageEstimateCost/100 }元
						    </c:when>
						    <c:when test="${delivery.orderStatus.id eq '3' or delivery.orderStatus.id eq '31'}">
							   	，预计费用为${(delivery.packageRealCost!=null && delivery.packageRealCost!="")?delivery.packageRealCost/100:delivery.packageEstimateCost/100 }元    
 							</c:when>
						    <c:when test="${delivery.orderStatus.id eq '5'}">
						     	，费用为${delivery.packageRealCost/100 }元  
						     	<%--, 快递状态：  --%>
						    </c:when>		    
						</c:choose>
						</span>
						</td>
						<td>
						${delivery.inspectionApplyCause}
						</td>
						<td>
							<c:if test="${delivery.orderStatus.id=='2'}"><a class="pass_btn" data-value="${delivery.id}">通过申请</a></c:if>
							<c:if test="${delivery.orderStatus.id=='31'}"><a class="pass_btn" data-value="${delivery.id}">通过改价申请</a></c:if>
							<a href="/${role}-detail/${delivery.id}">查看详情</a>
						</td>
					</tr>
					<c:set var="index" value="${index+1 }"/>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function(){
		$(".pass_btn[data-value]").click(function(){
			var id = $(this).attr('data-value');
			var layer_index = layer.confirm('确认通过申请？', {
      		  btn: ['确认','取消'],
      		  title:false,
      		  closeBtn:false
      		}, function(){
      			$.ajax({
      				url:'/approval/'+id+'?action=pass',
      				type:'POST',
      				dataType:'json',
      				data:{},
      				error:function(){
      					layer.close(layer_index);
      					layer.msg('提交失败', {icon: 5,shade:[0.5,'#000']});
      				},
      				success:function(data){
      					if(data.code==200){
      						layer.msg(data.message);
      						location.href=location.href;
      					}else{
      						layer.close(layer_index);
      						layer.msg(data.message, {icon: 5,shade:[0.5,'#000']});
      					}
      				}
      			});
      		});
		});
	});
	</script>
	</c:if>
	<div  class="row">
<%-- 	<div class="col-md-4 page-component">
		<ul>
			<li class="form-inlie">每页显示数量</li>
			<li><a class="btn btn-page">20</a></li>
			<li><a class="btn btn-page">50</a></li>
			<li><a class="btn btn-page">100</a></li>
		</ul>
	</div>
	--%>
	<c:if test="${pageCount>0}">
	<c:if test="${ role eq 'admin'}" >
	<div class="col-md-4">
		<a id="export_page_btn" class="btn btn-primary" data-value="${maxId}">导出本页</a>
		<a id="export_all_btn" class="btn btn-primary" data-value="${maxId}">导出全部</a>
		
	</div>
	</c:if>
	<div class="col-md-8 page-component">
		<ul class="fr">
			<c:set var="leftmore" value="true"/>
			<c:set var="begin" value="${pageNum-2}"/>
			<c:set var="end" value="${pageNum+2}"/>
			<c:set var="rightmore" value="true"/>
			<c:set var="left" value="${pagePrev ne pageNum}"/>
			<c:set var="right" value="${pageNext ne pageNum}"/>
			<c:if test="${pageNum - 2 le 2 }">
				<c:set var="leftmore" value="false"/>
				<c:set var="begin" value="1"/>
			</c:if>
			<c:if test="${pageNum + 2 ge pageCount }">
				<c:set var="rightmore" value="false"/>
				<c:set var="end" value="${pageCount}"/>
			</c:if>
			<li><a href="JavaScript:void(0);" <c:if test="${left}">data-value="${pagePrev}"</c:if>  class="btn-page btn-jumppage <c:if test="${not left}">disabled</c:if>">&lt;&lt;</a></li>
			<c:if test="${leftmore}">
			<li><a href="JavaScript:void(0);" data-value="1" class="btn-page btn-jumppage">1</a></li>
			<li><a href="JavaScript:void(0);" data-value="${pageNum-3}" class="btn-page btn-jumppage">...</a></li>
			</c:if>
			<c:forEach var="i" begin="${begin}" end="${end}">
			<li><a href="JavaScript:void(0);" <c:if test="${i ne pageNum}">data-value="${i}"</c:if> class="btn-page btn-jumppage <c:if test="${i eq pageNum}">active</c:if> ">${i}</a></li>
			</c:forEach>
			<c:if test="${rightmore}">
			<li><a href="JavaScript:void(0);" data-value="${pageNum+3}" class="btn-page btn-jumppage">...</a></li>
			<li><a href="JavaScript:void(0);" data-value="${pageCount}" class="btn-page btn-jumppage">${pageCount}</a></li>
			</c:if>
			<li><a href="JavaScript:void(0);" <c:if test="${right}">data-value="${pageNext}"</c:if>  class="btn-page btn-jumppage <c:if test="${not right}">disabled</c:if>">&gt;&gt;</a></li>
<%-- 			<li class="">跳到<input class="" style="width:20px"/>页(共 ${pageCount}页)<button class="btn btn-primary">确定</button></li> --%>
		</ul>
	</div>
	</c:if>
</div>
</div>

<script>
	$("#delivery").addClass('active');
</script>
<script>
        $(document).ready(function () {
        	var urlParams;
        	(window.onpopstate = function () {
        	    var match,
        	        pl     = /\+/g,  // Regex for replacing addition symbol with a space
        	        search = /([^&=]+)=?([^&]*)/g,
        	        decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); },
        	        query  = window.location.search.substring(1);

        	    urlParams = {};
        	    while (match = search.exec(query))
        	       urlParams[decode(match[1])] = decode(match[2]);
        	})();
       		function jumpURL(params){
       			if(params == null){window.location.href= window.location.pathname;return;}
       			for(var key in params)
       				urlParams[key]=params[key];
       			window.location.href= window.location.pathname+"?"+$.param(urlParams);
       		}
       		function downloadFile(url,params){
       			var newParams = {};
       			for(var key in urlParams)
       				newParams[key]=urlParams[key];
       			for(var key in params)
       				newParams[key]=params[key];
       			var down_iframe=document.getElementById("download_iframe")
       			
       			var iframe;
       			if(down_iframe == null){
       				iframe = document.createElement("iframe");
	       			iframe.style.display = "none";
	       			iframe.id = "download_iframe";
	       			document.body.appendChild(iframe);
       			}else{
       				iframe = down_iframe
       			}
       			iframe.src=url+"?"+$.param(newParams);
       		}
        	$(".btn-jumppage[data-value]").click(function(){
        		var pageNum =  $(this).attr('data-value');
        		if(pageNum!="")jumpURL({p:pageNum});
        	});
        	$('#clear_btn').click(function(){
        		jumpURL(null);
        	});
            $('#search_btn').click(function(){
            	var check_message = {
            		"department":["请选择部门",/[\s\S]*/,"部门名字"],
            		"express":["请选择快递",/\d*/,"快递名字"],
            		"begin":["请填写开始日期",/\d{4}-\d{2}-\d{2}/,"格式必须是yyyy-mm-dd"],
            		"end":["请填写结束日期",/\d{4}-\d{2}-\d{2}/,"格式必须是yyyy-mm-dd"],
            		"search_query_text":["请填写搜索内容",null,null]
            	}
            	var check_result = {};
            	for (var check_content_id in check_message){
            		var checking_obj =$('#'+check_content_id);
            		if(checking_obj.length==0) continue;
            		var checking_val;
            		if(checking_obj.attr('type')=='radio' || checking_obj.attr('type')=='checkbox'){
            			checking_val=$('input[name='+check_content_id+']:checked').val();
            		}else{
            			checking_val=checking_obj.val().replace(/\n/gm,'<br>');
            		}
            		//非空校验
            		if(checking_val==null||checking_val.trim()==""){
            			continue;
            			layer.msg(check_message[check_content_id][0]);
            			$('#'+check_content_id).focus();
            			return;
            		}
            		//正则校验
            		if(check_message[check_content_id][1]!=null){
	            		var re = new RegExp(check_message[check_content_id][1]);
	            		if(re.test(checking_val)){
	            			//console.log("格式正确");         			
	            		}else{
	            			layer.msg(check_message[check_content_id][2]);
	            			$('#'+check_content_id).focus();
	            			return;
	            		}
            		}
            		check_result[check_content_id] = checking_val;
            	}
            	var check_result_size = 0;
            	for(var key in check_result) check_result_size++;
            	if(check_result_size!=0){
            		
            		$("#search_form").submit();
            	}
            	else{
            		if($('#begin').length == 0) {
            			layer.msg("请填写搜索内容"); 
            			return;
            		}else{
            			layer.msg("请至少选择“部门”或者选择“快递”填写“开始日期，结束日期，搜索内容”中的一项");
        				return;
        			}
            	}
            	
            });
            $("#export_page_btn").click(function(){
            	var check_result = {};
            	check_result['maxid']=$(this).attr('data-value');
            	$.ajax({
    				url:'/export-excel-check',
    				type:'POST',
    				dataType:'json',
    				data:check_result,
    				error:function(){
    					layer.msg('查询失败', {icon: 5,shade:[0.5,'#000']});
    				},
    				success:function(data){
    					var url = '/export-excel/${status}';
    					if(data.code==200){
    						downloadFile(url,{ps:"${pageSize}",p:"${pageNum}"});
    					}else{
    						layer.confirm(data.message, {
    							  btn: ['是的','否，导出当前数据']
    							}, function(){
    								downloadFile(url,{ps:"${pageSize}",p:"${pageNum}"});
    							}, function(){
    								downloadFile(url,{ps:"${pageSize}",p:"${pageNum}",maxid:check_result['maxId']});
    						});
    						
    					}
    				}
    			});
			});
        	$("#export_all_btn").click(function(){
            	var check_result = {};
            	check_result['maxid']=$(this).attr('data-value');
            	$.ajax({
    				url:'/export-excel-check',
    				type:'POST',
    				dataType:'json',
    				data:check_result,
    				error:function(){
    					layer.msg('查询失败', {icon: 5,shade:[0.5,'#000']});
    				},
    				success:function(data){
    					var url = '/export-excel/${status}';
    					if(data.code==200){
    						downloadFile(url,{ps:"",p:""});
    					}else{
    						layer.confirm(data.message, {
    							  btn: ['是的','否，导出当前数据']
    							}, function(){
    								downloadFile(url,{ps:"",p:""});
    							}, function(){
    								downloadFile(url,{ps:"",p:"",maxid:check_result['maxId']});
    						});
    						
    					}
    				}
    			});
        	});
    			
         });
    </script>
</div>
<c:if test="${role eq 'admin' }">
 <script>
     var start={
   		  elem:"#begin",
   		  format:"YYYY-MM-DD",
   		  min:"2000-01-01",
   		  max:laydate.now(),
   		  istoday:true,
   		  choose:function(datas){
   			  end.min=datas;end.start=datas
   			  }
     };
     var end={
   		  elem:"#end",
   		  format:"YYYY-MM-DD",
   		  min:"2000-01-01",
   		  max:laydate.now(),
   		  istoday:true,
   		  choose:function(datas){
   			  start.max=datas
   			  }
     };
     laydate(start);laydate(end);
 </script>
 </c:if>
<%@ include file='../common/footer.jsp' %>
