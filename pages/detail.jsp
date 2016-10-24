<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file='../common/header.jsp' %>
<div id="page-wrapper" class="gray-bg dashbard-1">
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-sm-4">
		<h2>快递收发</h2>
		<ol class="breadcrumb">
			<li><a href="/index">首页</a></li>
			<li>公务快递单详情</li>
		</ol>
	</div>
</div>
<div class="wrapper wrapper-content delivery">
	<div class="form-group form-horizontal">
	<c:if test= "${single.orderStatus.id > 0  or (single.orderStatus.id eq '-1') }">
	<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>申请单</h5>
				</div>
				<div class="ibox-content">
					<div class="row">
                        <label class="col-sm-2 control-label">申请人</label>
						<div class="col-sm-3">
						<p class="form-control-static">
							${single.userName}(${single.userId})
							</p>
						</div> 
                        <label class="col-sm-2 control-label">申请单号</label>
						<div class="col-sm-4">
						<p class="form-control-static">
							${single.orderNum }</p>
						</div> 
					</div>

				</div>			
			</div>
		</div>
	</div>
	
<c:if test= "${single.orderStatus.id >0}">
	<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>进度</h5>
				</div>
				<div class="ibox-content">
                   <div id="vertical-timeline" class="vertical-container dark-timeline">
                       <div class="vertical-timeline-block">  <%-- 提交 1 2 3 4 5 6 31  --%>
                           <div class="vertical-timeline-icon navy-bg">
                               <i class="fa fa-user"></i>
                           </div>
                           <div class="vertical-timeline-content">
                               <p>${single.userName}( ${single.userId})提交了申请，待到收发室打包
                               </p>
                               <span class="vertical-date"><small> ${single.orderCreateTime} </small></span>
                           </div>
                       </div>
						<c:if test= "${single.orderStatus.id >1}">  <%--打包  2 3 4 5 6 31  --%>
                       <div class="vertical-timeline-block">
                           <div class="vertical-timeline-icon blue-bg">
                               <i class="fa fa-briefcase"></i>
                           </div>

                           <div class="vertical-timeline-content">
                               <p>已经完成物品称重估价</p>
                               <p><strong>完成人：收发室</strong></p>
                               <span class="vertical-date"><small> ${single.orderPackageTime}</small></span>
                           </div>
                       </div>
						</c:if>
						<c:if test= "${single.orderStatus.id >1}">  <%-- 一次审批 2 3 4 5 6 31  --%>
                       <div class="vertical-timeline-block">
                           <div class="vertical-timeline-icon lazur-bg">
                               <i class="fa fa-user-md"></i>
                           </div>

                           <div class="vertical-timeline-content">
                           		<c:if test= "${single.orderStatus.id ==2 }"><p>申请订单正在审批中</p></c:if>
                               <c:if test= "${single.inspectionStatus.id ==1 or single.inspectionStatus.id > 9 }"><p>审批通过</p></c:if>
                               <c:if test= "${single.inspectionStatus.id ==2}"><p>审批不通过，原因如下：<br/><textarea readonly="" class="form-control">${single.inspectionRejectReason}</textarea></p></c:if>
                               
                               <p><strong>审批人：${single.inspectionSuperiorName}</strong></p>
                               <c:if test= "${single.orderStatus.id ne 2 }"><span class="vertical-date"><small>${single.orderInspectionTime}</small></span></c:if>
                           </div>
                       </div>
						</c:if>
						
						<c:if test= "${single.packageIsCostChanged}"> <%-- 改价   --%>
						<div class="vertical-timeline-block">
                           <div class="vertical-timeline-icon blue-bg">
                               <i class="fa fa-briefcase"></i>
                           </div>

                           <div class="vertical-timeline-content">
                               <p>收发室将邮费价格从${single.packageEstimateCost/100}修改为${single.packageRealCost/100}<c:if test="${single.packageIsPriceProtect}">,将保价费从${single.packageProtectPriceFee/100}修改为${single.packageRealProtectPriceFee/100}</c:if></p>
                               <p><strong>完成人：收发室</strong></p>
                               <span class="vertical-date"><small> ${single.orderModifyCostTime}</small></span>
                           </div>
                       </div>
                  		</c:if>
						<c:if test= "${single.packageIsCostChanged and single.inspectionStatus.id > 9}"> <%-- 二次审批结果 3 ,4   --%>
						<div class="vertical-timeline-block">
							<div class="vertical-timeline-icon lazur-bg">
                               <i class="fa fa-user-md"></i>
                           </div>
                           <div class="vertical-timeline-content">
                           		<c:if test= "${single.inspectionStatus.id ==10 }"><p>申请订单正在重新审批中</p></c:if>
                               <c:if test= "${single.inspectionStatus.id ==11}"><p>改费用的审批通过</p></c:if>
                               <c:if test= "${single.inspectionStatus.id ==12}"><p>该费用审批不通过，原因如下：<br/><textarea readonly="" class="form-control">${single.inspectionRejectReason}</textarea></p></c:if>
                               <p><strong>审批人：${single.inspectionSuperiorName}</strong></p>
                               <c:if test= "${single.inspectionStatus.id > 10 }"><span class="vertical-date"><small>${single.orderReInspectionTime}</small></span></c:if>
                           </div>
                       </div>
						</c:if>
						<c:if test= "${single.orderStatus.id >2 and single.orderStatus.id <5}"> <%-- 审批结果 下一步3 ,4  --%>
                       <div class="vertical-timeline-block">
                           	<c:if test= "${single.inspectionStatus.id ==1 or single.inspectionStatus.id  == 11}"><div class="vertical-timeline-icon blue-bg"><i class="fa fa-briefcase"></i> </div></c:if>
                              <c:if test= "${single.inspectionStatus.id ==2 or single.inspectionStatus.id  == 12}"><div class="vertical-timeline-icon navy-bg"><i class="fa fa-user"></i> </div></c:if>
                           <div class="vertical-timeline-content">
                           		<c:if test= "${single.inspectionStatus.id ==1 or single.inspectionStatus.id  == 11}"><p>待收发室发送快递</p></c:if>
                               <c:if test= "${single.inspectionStatus.id ==2 or single.inspectionStatus.id  == 12}"><p>待申请人到收发室取回</p></c:if>
                            </div>
                       </div>
                       </c:if>
						<c:if test= "${single.orderStatus.id >4 and single.orderStatus.id ne 31}"><%-- 寄出结果 5 ,6  --%>
                       <div class="vertical-timeline-block">
                           
                           	<c:if test= "${single.inspectionStatus.id ==1 or single.inspectionStatus.id  == 11}"><div class="vertical-timeline-icon blue-bg"><i class="fa fa-briefcase"></i> </div></c:if>
                              <c:if test= "${single.inspectionStatus.id ==2 or single.inspectionStatus.id  == 12}"><div class="vertical-timeline-icon navy-bg"><i class="fa fa-user"></i> </div></c:if>
                               
                          

                           <div class="vertical-timeline-content">
                           		<c:if test= "${single.inspectionStatus.id ==1 or single.inspectionStatus.id  == 11}"><p>已寄出，快递单号为：${single.packageExpressNum}</p><p><strong>完成人：收发室</strong></p></c:if>
                               <c:if test= "${single.inspectionStatus.id ==2 or single.inspectionStatus.id  == 12}"><p>申请人${single.userName}( ${single.userId})已到收发室取回</p></c:if>
                               
                               <span class="vertical-date"><small>${single.orderFinishedTime}</small></span> </div>
                       </div>
						</c:if>
                   </div>
				</div>		
			</div>
		</div>
	</div>
</c:if>
	<div class="row">
		<div class="col-sm-6 col-sm-offset-0 col-md-4 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>收件人信息</h5>
				</div>
				<div class="ibox-content info-card">
					<div class="row">
						<div class="col-sm-12">
							<strong>${single.recvName}</strong>，&nbsp;${single.recvPhonenum}
	                    </div>
	                    <div class="col-sm-12">
	                    	${single.recvProvince.name} ${single.recvCity.name} ${single.recvDistrict.name} ${single.recvAddress}，${single.recvCode}
	                    </div>
	                </div>
				</div>			
			</div>
		</div>
		<div class="col-sm-6 col-sm-offset-0 col-md-4 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>寄件人信息</h5>
				</div>
				<div class="ibox-content info-card">
					<div class="row">
						<div class="col-sm-12">
							<strong>${single.sendName}</strong>，&nbsp;${single.sendPhonenum}
	                    </div>
	                    <div class="col-sm-12">
	                    	${single.sendProvince.name} ${single.sendCity.name} ${single.sendDistrict.name} ${single.sendAddress}，${single.sendCode}
	                    </div>
	                </div>
				</div>				
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1 ">
			<div class="ibox">
				<div class="ibox-title">
					<h5>托寄物<c:if test="${single.packageIsCrossBorder}">（跨境快递）</c:if></h5>
				</div>
				<div class="ibox-content">
					<div class="row">
						<label class="col-sm-2 control-label">类型</label>
						<div class="col-sm-3 col-md-3">
							<div class="radio i-checks ">
							<label><input type="radio" value="1" name="document_type"  disabled=""  <c:if test="${single.packageType eq '1' }">checked=""</c:if> > <i></i>文件</label>
							</div>
						</div>
						<div class="col-sm-3 col-md-3">
							<div class="radio i-checks">
							<label><input type="radio" value="2" name="document_type" disabled="" <c:if test="${single.packageType eq '2' }">checked=""</c:if>  > <i></i>物品</label>
							</div>
						</div>
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">内件品名</label>
						<div class="col-sm-3">
							 <input type="text" class="form-control" id="package_inner_content" name="package_inner_content" value="${single.packageInnerContent }" readonly=""/> 
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">数量(件)</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" readonly="" value="${single.packageCount}" />
						</div> 
					</div>
					<div class="row">
						<label class="col-sm-2 control-label">是否保价</label>
						<div class="col-sm-4 col-md-2">
							<div class="radio i-checks">
							<label><input type="radio" value="true" name="package_is_price_protect" id="package_is_price_protect" <c:if test="${single.packageIsPriceProtect eq true }">checked=""</c:if> disabled=""> <i></i>是  </label>
							
							</div>
						</div>						
						<div class="col-sm-4 col-md-2">
							<div class="radio i-checks">
							<label><input type="radio" value="false" name="package_is_price_protect" <c:if test="${single.packageIsPriceProtect eq false }">checked=""</c:if>  disabled=""> <i></i>否</label>
							</div>
						</div>
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">保价价值(<c:if test="${single.packageIsCrossBorder}">美</c:if>元)<br/><small class="text-navy">(选保价必填)</small></label>
						<div class="col-sm-3">
							 <input type="text" class="form-control" id="package_protect_price" name="package_protect_price" value="<c:if test="${single.packageProtectPrice ne null and single.packageProtectPrice ne ''}">${single.packageProtectPrice/100 }</c:if>" readonly=""/> 
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">保价理由<br/><small class="text-navy">(选保价必填)</small></label>
						<div class="col-sm-3">
							 <input type="text" class="form-control" id="package_protect_price_reason" name="package_protect_price_reason" value="${single.packageProtectPriceReason }"  readonly=""/> 
						</div> 
					</div>
					<c:if test="${single.packageIsCrossBorder}">
					<div class="row">
						<label class="col-sm-2 control-label">若无法投递</label>
						<div class="col-sm-4 col-md-2">
							<div class="radio i-checks">
							<label><input type="radio" value="1" name="package_cross_border_unreachable" id="package_cross_border_unreachable"  disabled="" <c:if test="${single.packageCrossBorderUnreachable eq 1}">checked=""</c:if>> <i></i>退回，并承担退回费用 </label>
							</div>
						</div>						
						<div class="col-sm-4 col-md-2">
							<div class="radio i-checks">
							<label><input type="radio" value="2" name="package_cross_border_unreachable" disabled="" <c:if test="${single.packageCrossBorderUnreachable eq 2}">checked=""</c:if> > <i></i>放弃</label>
							</div>
						</div>
					</div>
					</c:if>
				</div>			
			</div>
		</div>
	</div>
<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1 ">
			<div class="ibox">
				<div class="ibox-title">
					<h5>审批信息</h5>
				</div>
				<div class="ibox-content">
					<div class="row">
                        <label class="col-sm-2 control-label">对公快递事由<br/><small class="text-navy">(审批用)</small></label>
						<div class="col-sm-6">
							<textarea class="form-control"  readonly="" >${single.inspectionApplyCause }</textarea>
						</div> 
					</div>
				</div>			
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>期望快递公司</h5>
				</div>
				<div class="ibox-content">
					<div class="row">
						<label class="col-sm-2 col-md-2 control-label">快递类型</label>
						<c:forEach var="item" items="${packageExpressList}">
						<div class="col-sm-3 col-md-2">
							<div class="radio i-checks">
							<label><input type="radio" value="${item.id}" name="package_expect_express" disabled=""  <c:if test="${item.id eq single.packageExpectExpress.id }">checked=""</c:if> /> <i></i>${item.name}</label>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>			
			</div>
		</div>
	</div>
</c:if>
<c:if test= "${single.orderStatus.id == 1 and role eq 'mailroom'}">
	<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>称重估价</h5>
				</div>
				<div class="ibox-content">
					<div class="row">
                        <label class="col-sm-2 control-label">重量(Kg)</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="package_weight" id="package_weight">
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">快递费用(元)</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="package_estimate_cost" id="package_estimate_cost">
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">保价费用(元)</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="package_protect_price_fee" id="package_protect_price_fee" <c:if test="${single.packageIsPriceProtect ne true}">value="无需填写" readonly=""</c:if> >
						</div> 
						<c:if test="${single.packageIsCrossBorder}">
						<div class="col-sm-6">
							 <p class="form-control-static">注意：跨境快递的保价价值单位为美元，此处填写为人民币元</p> 
						</div>
						</c:if>
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">存放区域</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="package_storage_area" id="package_storage_area">
						</div> 
					</div>
				</div>			
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3 col-md-offset-3 col-sm-5 col-sm-offset-1">
			<a class="btn btn-primary btn-lg btn-submit" id="transfer_btn"><i class="fa fa-check"></i>&nbsp;提交给助理审批</a>
		</div>
		<div class="col-sm-2">
			<a href="/${role}-list"class="btn btn-white btn-lg"><i class="fa fa-reply"></i>&nbsp;返回</a>
		</div>
	</div>
	<script>
        $(document).ready(function () {
            
            
            $('#transfer_btn').click(function(){
            	var check_message = {
            		"package_weight":["请填写重量",/^[0-9]{1,8}(\.[0-9]{1,3})?$/,"重量填写有误,小数点后最多3位"],
        			"package_estimate_cost":["请填写快递费用",/^[0-9]{1,8}(\.[0-9]{0,2})?$/,"快递费用填写有误，最多8位，小数点后2位"],
        			"package_storage_area":["请填写存放区域",/^[\s\S]{1,10}$/,"存放区域文字不能超过10位"]
            	}
            	if(${ single.packageIsPriceProtect!=null && single.packageIsPriceProtect == true}){
            		check_message["package_protect_price_fee"] = ["请填写保价费用",/^[0-9]{1,8}(\.[0-9]{0,2})?$/,"保价费用填写有误，小数点后最多2位"];
            	}
            	var check_result = {};
            	for (var check_content_id in check_message){
            		var checking_obj =$('#'+check_content_id);
            		var checking_val;
            		if(checking_obj.attr('type')=='radio' || checking_obj.attr('type')=='checkbox'){
            			checking_val=$('input[name='+check_content_id+']:checked').val();
            		}else{
            			checking_val=checking_obj.val().replace(/\n/gm,'<br>');
            		}
            		//非空校验
            		if(checking_val==null||checking_val.trim()==""){
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
                //特殊处理
                check_result["package_weight"] = Math.round(check_result["package_weight"]*1000)+"";
                check_result["package_estimate_cost"] = Math.round(check_result["package_estimate_cost"]*100)+"";
            	if(${ single.packageIsPriceProtect!=null && single.packageIsPriceProtect == true }){
            		  check_result["package_protect_price_fee"] = Math.round(check_result["package_protect_price_fee"]*100)+"";
            	}
            	var layer_index = layer.confirm('确认提交申请？', {
            		  btn: ['提交','取消'],
            		  title:false,
            		  closeBtn:false
            		}, function(){
            			$.ajax({
            				url:'/transfer/${single.id}',
            				type:'POST',
            				dataType:'json',
            				data:check_result,
            				error:function(){
            					layer.close(layer_index);
            					layer.msg('保存失败', {icon: 5,shade:[0.5,'#000']});
            				},
            				success:function(data){
            					if(data.code==200){
            						layer.msg(data.message,{time:3000});
            						setTimeout("location.href='/${role}-list'",2000);
            					}else{
            						layer.close(layer_index);
            						layer.msg(data.message, {icon: 5,shade:[0.5,'#000']});
            					}
            				}
            			});
            		});
            	//
            });

        });
    </script>
</c:if>
<c:if test= "${single.orderStatus.id > 1}">
	<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>称重估价</h5>
				</div>
				<div class="ibox-content">
					<div class="row">
                        <label class="col-sm-2 control-label">重量(Kg)</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="package_weight" value="${single.packageWeight/1000 }" readonly="">
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">快递费用(元)</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="package_expect_cost" value="${single.packageEstimateCost/100 } <c:if test="${single.packageRealCost ne null and single.packageRealCost ne single.packageEstimateCost}"> ->${single.packageRealCost/100 }</c:if>" readonly=""> 
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">保价费用(元)</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="package_expect_cost" value="${single.packageProtectPriceFee/100 } <c:if test="${single.packageRealProtectPriceFee ne null and single.packageRealProtectPriceFee ne single.packageProtectPriceFee}"> ->${single.packageRealProtectPriceFee/100 }</c:if>" readonly=""> 
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">存放区域</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="package_storage_area"  value="${single.packageStorageArea }" readonly="">
						</div> 
					</div>
					<c:if test="${role eq 'mailroom' and single.orderStatus.id eq 3}">
						<div class="hr-line-dashed"></div>
						<div class="row">
							<label class="col-sm-2 control-label">其他操作</label>
							<div class="col-sm-4">
								费用有误？<a id="modify_cost_btn" class="btn btn-primary <c:if test="${single.packageIsCostChanged eq true}"> disabled </c:if>">修改实际费用</a>
								<c:if test="${single.packageIsCostChanged eq true}">
								<p class="form-control-static">(最多只能修改一次且已经修改过一次)</p>
								</c:if>
							</div>
						</div>
					</c:if>
				</div>			
			</div>
		</div>
	</div>
</c:if>

<c:if test= "${single.orderStatus.id == 2 and role=='superior'}">
	<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>审批事项</h5>
				</div>
				<div class="ibox-content">
					<div class="row">
                        <label class="col-sm-2 control-label">驳回原因<br/><small class="text-navy">(审批不通过必填)</small></label>
						<div class="col-sm-6">
							<textarea class="form-control" name="inspection_reject_reason" id="inspection_reject_reason"></textarea>
						</div> 
					</div>
				</div>			
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2 col-md-offset-2 col-sm-3 col-sm-offset-1">
			<a class="btn btn-primary btn-lg btn-submit" id="pass_btn"><i class="fa fa-check"></i>&nbsp;通过申请</a>
		</div>
		<div class="col-md-2 col-sm-3 ">
			<a class="btn btn-danger btn-lg btn-submit" id="reject_btn"><i class="fa fa-backward"></i>&nbsp;驳回申请</a>
		</div>
		<div class="col-md-2 col-sm-2 ">
			<a href="/${role}-list" class="btn btn-white btn-lg"><i class="fa fa-reply"></i>&nbsp;返回</a>
		</div>
	</div>
	<script>
        $(document).ready(function () {
            $('#reject_btn').click(function(){
            	var check_message = {
            		"inspection_reject_reason":["请填写驳回理由",/^[\s\S]{1,200}$/,"最多两百个字符"]
            	}
            	
            	var check_result = {};
            	for (var check_content_id in check_message){
            		var checking_obj =$('#'+check_content_id);
            		var checking_val;
            		if(checking_obj.attr('type')=='radio' || checking_obj.attr('type')=='checkbox'){
            			checking_val=$('input[name='+check_content_id+']:checked').val();
            		}else{
            			checking_val=checking_obj.val().replace(/\n/gm,'<br>');
            		}
            		//非空校验
            		if(checking_val==null||checking_val.trim()==""){
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
                      	
            	var layer_index = layer.confirm('确认驳回申请？', {
            		  btn: ['确认','取消'],
            		  title:false,
            		  closeBtn:false
            		}, function(){
            			$.ajax({
            				url:'/approval/${single.id}?action=reject',
            				type:'POST',
            				dataType:'json',
            				data:check_result,
            				error:function(){
            					layer.close(layer_index);
            					layer.msg('提交失败', {icon: 5,shade:[0.5,'#000']});
            				},
            				success:function(data){
            					if(data.code==200){
            						layer.msg(data.message);
            						setTimeout("location.href='/${role}-list'",2000);
            					}else{
            						layer.close(layer_index);
            						layer.msg(data.message, {icon: 5,shade:[0.5,'#000']});
            					}
            				}
            			})
            		});
            	//
            });
            $('#pass_btn').click(function(){    	
            	var layer_index = layer.confirm('确认通过申请？', {
            		  btn: ['确认','取消'],
            		  title:false,
            		  closeBtn:false
            		}, function(){
            			$.ajax({
            				url:'/approval/${single.id}?action=pass',
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
            						setTimeout("location.href='/${role}-list'",2000);
            					}else{
            						layer.close(layer_index);
            						layer.msg(data.message, {icon: 5,shade:[0.5,'#000']});
            					}
            				}
            			});
            		});
            	//
            });
        });
    </script>
</c:if>
<c:if test= "${single.orderStatus.id >2 }">
	<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>审批事项</h5>
				</div>
				<div class="ibox-content">
					<div class="row">
                        <label class="col-sm-2 control-label">审批人</label>
						<div class="col-sm-6">
							<p class="form-control-static">
							<strong>${single.inspectionSuperiorName}</strong>(${single.inspectionSuperior})
							</p>
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">审批结果</label>
						<div class="col-sm-6">
							<p class="form-control-static">
							<c:if test= "${single.inspectionStatus.id == 1 or single.inspectionStatus.id >9}">审批通过</c:if>
							<c:if test= "${single.inspectionStatus.id == 2 }">审批不通过</c:if>
							</p>
						</div> 
					</div>
					<c:if test= "${single.inspectionStatus.id ==2 }">
					<div class="row">
                        <label class="col-sm-2 control-label">驳回原因</label>
						<div class="col-sm-6">
							<textarea class="form-control" readonly="">${single.inspectionRejectReason}</textarea>
						</div> 
					</div>
					</c:if>
				</div>			
			</div>
		</div>
	</div>
</c:if>
<c:if test= "${single.orderStatus.id == 31 and role=='superior'}">
	<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>二次审批事项</h5>
				</div>
				<div class="ibox-content">
					<div class="row">
                        <label class="col-sm-2 control-label">驳回原因<br/><small class="text-navy">(审批不通过必填)</small></label>
						<div class="col-sm-6">
							<textarea class="form-control" name="inspection_reject_reason" id="inspection_reject_reason"></textarea>
						</div> 
					</div>
				</div>			
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2 col-md-offset-2 col-sm-3 col-sm-offset-1">
			<a class="btn btn-primary btn-lg btn-submit" id="pass_btn"><i class="fa fa-check"></i>&nbsp;通过改价申请</a>
		</div>
		<div class="col-md-2 col-sm-3 ">
			<a class="btn btn-danger btn-lg btn-submit" id="reject_btn"><i class="fa fa-backward"></i>&nbsp;驳回改价申请</a>
		</div>
		<div class="col-md-2 col-sm-2 ">
			<a href="/${role}-list" class="btn btn-white btn-lg"><i class="fa fa-reply"></i>&nbsp;返回</a>
		</div>
	</div>
	<script>
        $(document).ready(function () {
            $('#reject_btn').click(function(){
            	var check_message = {
            		"inspection_reject_reason":["请填写驳回理由",/^[\s\S]{1,200}$/,"最多两百个字符"]
            	}
            	
            	var check_result = {};
            	for (var check_content_id in check_message){
            		var checking_obj =$('#'+check_content_id);
            		var checking_val;
            		if(checking_obj.attr('type')=='radio' || checking_obj.attr('type')=='checkbox'){
            			checking_val=$('input[name='+check_content_id+']:checked').val();
            		}else{
            			checking_val=checking_obj.val().replace(/\n/gm,'<br>');
            		}
            		//非空校验
            		if(checking_val==null||checking_val.trim()==""){
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
                      	
            	var layer_index = layer.confirm('确认驳回申请？', {
            		  btn: ['确认','取消'],
            		  title:false,
            		  closeBtn:false
            		}, function(){
            			$.ajax({
            				url:'/approval/${single.id}?action=reject',
            				type:'POST',
            				dataType:'json',
            				data:check_result,
            				error:function(){
            					layer.close(layer_index);
            					layer.msg('提交失败', {icon: 5,shade:[0.5,'#000']});
            				},
            				success:function(data){
            					if(data.code==200){
            						layer.msg(data.message);
            						setTimeout("location.href='/${role}-list'",2000);
            					}else{
            						layer.close(layer_index);
            						layer.msg(data.message, {icon: 5,shade:[0.5,'#000']});
            					}
            				}
            			})
            		});
            	//
            });
            $('#pass_btn').click(function(){    	
            	var layer_index = layer.confirm('确认通过申请？', {
            		  btn: ['确认','取消'],
            		  title:false,
            		  closeBtn:false
            		}, function(){
            			$.ajax({
            				url:'/approval/${single.id}?action=pass',
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
            						setTimeout("location.href='/${role}-list'",2000);
            					}else{
            						layer.close(layer_index);
            						layer.msg(data.message, {icon: 5,shade:[0.5,'#000']});
            					}
            				}
            			});
            		});
            	//
            });
        });
    </script>
</c:if>
<c:if test= "${single.inspectionStatus.id >10 }">
	<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>二次审批事项</h5>
				</div>
				<div class="ibox-content">
					<div class="row">
                        <label class="col-sm-2 control-label">审批人</label>
						<div class="col-sm-6">
							<p class="form-control-static">
							<strong>${single.inspectionSuperiorName}</strong>(${single.inspectionSuperior})
							</p>
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">二次审批结果</label>
						<div class="col-sm-6">
							<p class="form-control-static">
							<c:if test= "${single.inspectionStatus.id == 11 }">改费用审批通过</c:if>
							<c:if test= "${single.inspectionStatus.id == 12 }">改费用审批不通过</c:if>
							</p>
						</div> 
					</div>
					<c:if test= "${single.inspectionStatus.id ==12 }">
					<div class="row">
                        <label class="col-sm-2 control-label">驳回原因</label>
						<div class="col-sm-6">
							<textarea class="form-control" readonly="">${single.inspectionRejectReason}</textarea>
						</div> 
					</div>
					</c:if>
				</div>			
			</div>
		</div>
	</div>
</c:if>
<c:if test= "${(single.orderStatus.id ==3 or single.orderStatus.id ==4) and role eq 'mailroom' }">
	<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>操作事项</h5>
				</div>
				<div class="ibox-content">
					<c:if test= "${single.inspectionStatus.id == 1 or single.inspectionStatus.id == 11 }">
					<div class="row">
                        <label class="col-sm-2 control-label">第一步</label>
						<div class="col-sm-6">
						<p class="form-control-static">
							<a class="btn btn-primary btn-submit" id="print-express"><i></i>&nbsp;打印快递单</a>
							</p>
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">第二步</label>
						<div class="col-sm-6">
						<p class="form-control-static">
							鼠标单击以下输入框，使光标停在输入框后，用扫描枪扫描快递单，自动输入单号（若扫描失败请手动输入单号）<br/>
							<input type="text" class="form-control" name="package_express_num" id="package_express_num" value="" placeholder="快递单号"/>
						</p>
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">第三步</label>
						<div class="col-sm-6">
						<p class="form-control-static">
							到页面底部确认结单
							</p>
						</div> 
					</div>
						
					</c:if>
					<c:if test= "${single.inspectionStatus.id ==2 or single.inspectionStatus.id == 12 }">
					<div class="row">
                        <label class="col-sm-2 control-label">第一步</label>
						<div class="col-sm-6">
						<p class="form-control-static">
							等待寄件人<strong> ${single.userName} (${single.userId}) </strong>取回物品，
							请从<strong> ${single.packageStorageArea}区 </strong>取回
							编号为<strong> ${fn:substring(single.orderNum,single.orderNum.length()-4,single.orderNum.length()) } </strong>的物品，
							交还给寄件人
						</p>
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">第二步</label>
						<div class="col-sm-6">
							<p class="form-control-static">到页面底部确认结单</p>
						</div> 
					</div>
					</c:if>
				</div>			
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-2 col-sm-offset-4">
			<a class="btn btn-primary btn-lg btn-submit" id="finish_btn"><i></i>&nbsp;结单</a>
		</div>
		<div class="col-sm-2">
			<a href="/${role}-list" class="btn btn-white btn-lg"><i class="fa fa-reply"></i>&nbsp;返回</a>
		</div>
	</div>
	<script>
        $(document).ready(function () {
        	$('#print-express').click(function(){
        		var width = 1264;
        		var height = 500;
        		var left = (screen.width - width) / 2;
        		var top = (screen.height - height) / 2;
        		window.open("/print-express/${single.id}","print","width="+width+",height="+height+",top="+top+",left="+left,false); 
        	});
            $('#finish_btn').click(function(){
            	var check_message = {
            		<c:if test='${single.inspectionStatus.id == 1 or single.inspectionStatus.id == 11 }'>
            		"package_express_num":["请填写快递单号",/^[\s\S]{8,50}$/,"最少8个字符最多50个字符"]
            		</c:if>
            	};
            	
            	var check_result = {};
            	for (var check_content_id in check_message){
            		var checking_obj =$('#'+check_content_id);
            		var checking_val;
            		if(checking_obj.attr('type')=='radio' || checking_obj.attr('type')=='checkbox'){
            			checking_val=$('input[name='+check_content_id+']:checked').val();
            		}else{
            			checking_val=checking_obj.val().replace(/\n/gm,'<br>');
            		}
            		//非空校验
            		if(checking_val==null||checking_val.trim()==""){
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
                      	
            	var layer_index = layer.confirm('确认结单？', {
            		  btn: ['确认','取消'],
            		  title:false,
            		  closeBtn:false
            		}, function(){
            			$.ajax({
            				url:'/finish/${single.id}',
            				type:'POST',
            				dataType:'json',
            				data:check_result,
            				error:function(){
            					layer.close(layer_index);
            					layer.msg('提交失败', {icon: 5,shade:[0.5,'#000']});
            				},
            				success:function(data){
            					if(data.code==200){
            						layer.msg(data.message);
            						setTimeout("location.href='/${role}-list'",2000);
            					}else{
            						layer.close(layer_index);
            						layer.msg(data.message, {icon: 5,shade:[0.5,'#000']});
            					}
            				}
            			})
            		});
            	//
            })
         });
    </script>
</c:if>
<c:if test= "${( single.orderStatus.id ==4) and role eq 'user' }">
	<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>操作事项</h5>
				</div>
				<div class="ibox-content">
					<c:if test= "${single.inspectionStatus.id ==2 }"> 
					<div class="row">
                        <label class="col-sm-2 control-label">第一步</label>
						<div class="col-sm-6">
						<p class="form-control-static">
							前往收发室
						</p>
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">第二步</label>
						<div class="col-sm-6">
							<p class="form-control-static">
							从<strong> ${single.packageStorageArea}区 </strong>取回
							编号为<strong> ${fn:substring(single.orderNum,single.orderNum.length()-4,single.orderNum.length()) } </strong>的物品
							</p>
						</div> 
					</div>
					</c:if>
				</div>			
			</div>
		</div>
	</div>
</c:if>
<c:if test= "${single.orderStatus.id ==5 }">
	<div class="row">
		<div class="col-sm-12 col-sm-offset-0 col-md-9 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>快递详情</h5>
				</div>
				<div class="ibox-content">
					<div class="row">
                        <label class="col-sm-2 control-label">快递单号</label>
						<div class="col-sm-6">
						<p class="form-control-static">
							${single.packageExpressNum}
						</p>
						</div> 
					</div>
				<div class="row">
                        <label class="col-sm-2 control-label">实际费用</label>
						<div class="col-sm-6">
						<p class="form-control-static">
						<c:if test="${single.packageRealCost!='' }">
							${single.packageRealCost/100}
						</c:if>
						<c:if test="${single.packageRealCost=='' }">
							${single.packageEstimateCost/100}
						</c:if>
							元
						</p>
						<c:if test= "${role eq 'mailroom'}">
						<a id="modify_cost_btn" class="btn btn-primary <c:if test="${single.packageIsCostChanged eq true}"> disabled </c:if>" >修改费用,并重新寄出</a>
						<c:if test="${single.packageIsCostChanged eq true}">(最多只能修改一次且已经修改过一次) </c:if>
						</c:if>
						</div> 
					</div>

				</div>			
			</div>
		</div>
	</div>
</c:if>
<c:if test= "${
	(role == 'user' and single.orderStatus.id ne '1' and single.orderStatus.id ne '-1') 
	or role =='admin'
	or (role == 'mailroom' and single.orderStatus.id == '2' )
	or (role == 'mailroom' and single.orderStatus.id == '5' )
	or (role == 'mailroom' and single.orderStatus.id == '6' )
	or (role == 'mailroom' and single.orderStatus.id == '31' )
	or (role == 'superior' and single.orderStatus.id != '2' and single.orderStatus.id != '31')
}">
	<div class="row">
		<div class="col-sm-2 col-sm-offset-5">
			<a href="/${role}-list" class="btn btn-white btn-lg"><i class="fa fa-reply"></i>&nbsp;返回</a>
		</div>
	</div>
</c:if>
<c:if test= "${(role eq 'user' and single.orderStatus.id eq '1')
	or (role eq 'user' and single.orderStatus.id eq '-1')}">
	<div class="row">
		<c:if test= "${(role eq 'user' and single.orderStatus.id eq '1')}">
		<div class="col-sm-2 col-sm-offset-3">
			<a id="cancel_btn" class="btn btn-danger btn-lg"><i class=""></i>&nbsp;撤回申请</a>
		</div>
		</c:if>
		<c:if test= "${(role eq 'user' and single.orderStatus.id eq '-1')}">
		<div class="col-sm-2 col-sm-offset-3">
			<a id="modify_btn" href="/modify<c:if test="${single.packageIsCrossBorder}">-global</c:if>/${single.id}" class="btn btn-primary btn-lg"><i class=""></i>&nbsp;修改申请</a>
		</div>
		</c:if>
		<div class="col-sm-2 col-sm-offset-0">
			<a href="/${role}-list" class="btn btn-white btn-lg"><i class="fa fa-reply"></i>&nbsp;返回</a>
		</div>
	</div>
	<script>
	$(document).ready(function () {
		$("#cancel_btn").click(function(){
			var layer_index = layer.confirm('确认撤回申请？', {
      		  btn: ['撤回','取消'],
      		  title:false,
      		  closeBtn:false
      		}, function(){
      			$.ajax({
      				url:'/cancel/${single.id}',
      				type:'POST',
      				dataType:'json',
      				error:function(){
      					layer.close(layer_index);
      					layer.msg('操作失败', {icon: 5,shade:[0.5,'#000']});
      				},
      				success:function(data){
      					if(data.code==200){
      						layer.msg(data.message);
      						setTimeout("location.href='/${role}-list'",2000);
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
<c:if test= "${role eq 'mailroom' and (single.orderStatus.id eq '3' or single.orderStatus.id eq '5')}">
<script>
$(document).ready(function () {
	var layer_index;
	$("#modify_cost_btn").click(function(){
		var content = '<div style="padding:20px;">';
		content +='<div class="row"><label class="col-sm-3 control-label">快递费用(元)</label><div class="col-sm-6"><input type="text" class="form-control" name="m_package_estimate_cost" id="m_package_estimate_cost"></div></div>';
		content +='<div class="row"><label class="col-sm-3 control-label">保价费用(元)</label><div class="col-sm-6"><input type="text" class="form-control" name="m_package_protect_price_fee" id="m_package_protect_price_fee"';
		content += ${single.packageIsPriceProtect == true}?'':' readonly="" value="无需填写" ';
		content +='></div></div>';
		content +='<br/><div class="row"><div class="col-sm-3 col-sm-offset-4"> <a class="btn btn-primary btn-submit" id="modify_cost_submit_btn"><i class="fa fa-check"></i>&nbsp;提交修改</a></div></div>';
		content +='</div>';
		layer_index = layer.open({
  		  type: 1,
  		  title:"修改费用",
  		  skin: 'layui-layer-rim', //加上边框
  		  area: ['480px', '240px'], //宽高
  		  content:content
  		});
	});
	$("body").on('click','#modify_cost_submit_btn',function(){
		var check_message = {
        		"package_estimate_cost":["请填写快递费用",/^[0-9]{1,8}(\.[0-9]{0,2})?$/,"快递费用填写有误，小数点后最多2位"]//长度不超过50 
    			}
		if(${ single.packageIsPriceProtect!=null && single.packageIsPriceProtect == true }){
			check_message["package_protect_price_fee"] = ["请填写保价费用",/^[0-9]{1,8}(\.[0-9]{0,2})?$/,"保价费用填写有误，小数点后最多2位"];//数字 可有连字符和加号和括号，不多于16位
		}
		var check_result = {};
    	for (var check_content_id_short in check_message){
    		var check_content_id = 'm_'+check_content_id_short;
    		var checking_obj =$('#'+check_content_id);
    		var checking_val;
    		if(checking_obj.attr('type')=='radio' || checking_obj.attr('type')=='checkbox'){
    			checking_val=$('input[name='+check_content_id+']:checked').val();
    		}else if(checking_obj.attr('disabled')=='disabled'){
    			continue;
    		}else{
    			checking_val=checking_obj.val().replace(/\n/gm,'<br>');
    		}
    		//非空校验
    		if(checking_val==null||checking_val.trim()==""){
    			layer.msg(check_message[check_content_id_short][0]);
    			$('#'+check_content_id).focus();
    			return;
    		}
    		//正则校验
    		if(check_message[check_content_id_short][1]!=null){
        		var re = new RegExp(check_message[check_content_id_short][1]);
        		if(re.test(checking_val)){
        			//console.log("格式正确");         			
        		}else{
        			layer.msg(check_message[check_content_id_short][2]);
        			$('#'+check_content_id).focus();
        			return;
        		}
    		}
    		check_result[check_content_id_short] = checking_val;
    	}
    	//特殊处理
    	check_result["package_estimate_cost"] = Math.round(check_result["package_estimate_cost"]*100)+"";
    	if(${ single.packageIsPriceProtect!=null && single.packageIsPriceProtect == true }){
    		check_result["package_protect_price_fee"] = Math.round(check_result["package_protect_price_fee"]*100)+"";
    	}
		$.ajax({
				url:'/modify-cost/${single.id}',
				type:'POST',
				dataType:'json',
				data:check_result,
				error:function(){
					layer.close(layer_index);
					layer.msg('操作失败', {icon: 5,shade:[0.5,'#000']});
				},
				success:function(data){
					if(data.code==200){
						layer.close(layer_index);
						layer.msg(data.message,{icon:1});
						setTimeout("location.href='/${role}-list'",2000);
					}else{
						layer.close(layer_index);
						layer.msg(data.message, {icon: 5,shade:[0.5,'#000']});
					}
				}
		});
	});
});
</script>
</c:if>
	</div>
</div>
<script>
	$("#delivery").addClass('active');
</script>
<script src="/dist/js/plugins/iCheck/icheck.min.js"></script>
<script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
</div>
<%@ include file='../common/footer.jsp' %>
