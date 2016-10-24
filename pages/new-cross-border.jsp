<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file='../common/header.jsp' %>
<div id="page-wrapper" class="gray-bg dashbard-1">
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-sm-4">
		<h2>快递收发</h2>
		<ol class="breadcrumb">
			<li><a href="/index">首页</a></li>
			<li>(跨境)公务快递单填写</li>
		</ol>
	</div>
</div>

<div class="wrapper wrapper-content delivery">
	<div class="form-group form-horizontal">
	<div class="row">
		<div class="col-sm-6 col-sm-offset-0 col-md-4 col-md-offset-1">
			<div class="ibox">
				<div class="ibox-title">
					<h5>收件人信息</h5>
				</div>
				<div class="ibox-content info-card"  id="recv_info">
					<a class="btn btn-warning" id="load_recv_info_btn">从标签库里选择填充</a> 
					<div class="hr-line-dashed"></div>
					<div class="row">
						<div class="col-sm-12">
	                    	<input type="text" placeholder="收件人姓名" class="form-control m-b" id="recv_name" name="recv_name">
	                    </div>
	                    <div class="col-sm-12">
	                    	<input type="text" placeholder="收件人手机号" class="form-control m-b" id="recv_phonenum" name="recv_phonenum">
	                    </div>
	               		<div class="col-sm-12">
	                    	<textarea placeholder="详细地址" class="form-control m-b" id="recv_address" name="recv_address"></textarea>
	                    </div>
						<div class="col-sm-12">
	                    	<input type="text" placeholder="邮政编码" class="form-control" id="recv_code" name="recv_code"/>
	                    </div>
                	</div>
                	<div class="hr-line-dashed"></div>
                	<div class="row">
	                	<div class="col-sm-6">
		                    <input type="text" placeholder="地址标签" class="form-control" id="recv_mark" name="recv_mark">
		                </div>
		                <div class="col-sm-6">
		                	<a class="btn btn-primary" id="save_recv_info_btn">保存到标签库</a>
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
				<div class="ibox-content info-card"  id="send_info">
					<a  class="btn btn-warning" id="load_send_info_btn">从标签库里选择填充</a> 
					<div class="hr-line-dashed"></div>
					<div class="row">
						<div class="col-sm-12">
	                    	<input type="text" placeholder="寄件人姓名" class="form-control m-b" id="send_name" name="send_name">
	                    </div>
	                    <div class="col-sm-12">
	                    	<input type="text" placeholder="寄件人手机号" class="form-control m-b" id="send_phonenum" name="send_phonenum">
	                    </div>    
	                    <div class="col-sm-12">
	                    	<textarea placeholder="详细地址" class="form-control m-b" id="send_address" name="send_address"></textarea>
	                    </div>
						<div class="col-sm-12">
	                    	<input type="text" placeholder="邮政编码" class="form-control" id="send_code" name="send_code">
	                    </div>
                	</div>
                	<div class="hr-line-dashed"></div>
                	<div class="row">
	                	<div class="col-sm-6">
		                    <input type="text" placeholder="地址标签" class="form-control" id="send_mark" name="send_mark">
		                </div>
		                <div class="col-sm-6">
		                	<a class="btn btn-primary" id="save_send_info_btn">保存到标签库</a>
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
					<h5>托寄物</h5>
				</div>
				<div class="ibox-content">
					<div class="row">
						<label class="col-sm-2 control-label">类型</label>
						<div class="col-sm-4 col-md-2">
							<div class="radio i-checks">
							<label><input type="radio" value="1" name="package_type" id="package_type"> <i></i>文件</label>
							</div>
						</div>
						<div class="col-sm-4 col-md-2">
							<div class="radio i-checks">
							<label><input type="radio" value="2" name="package_type"> <i></i>物件</label>
							</div>
						</div>
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">内件品名</label>
						<div class="col-sm-3">
							 <input type="text" class="form-control" id="package_inner_content" name="package_inner_content" /> 
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">数量</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="package_count" name="package_count">
						</div> 
					</div>
					<div class="row">
						<label class="col-sm-2 control-label">是否保价</label>
						<div class="col-sm-4 col-md-2">
							<div class="radio i-checks">
							<label><input type="radio" value="true" name="package_is_price_protect" id="package_is_price_protect"> <i></i>是  </label>
							
							</div>
						</div>						
						<div class="col-sm-4 col-md-2">
							<div class="radio i-checks">
							<label><input type="radio" value="false" name="package_is_price_protect"> <i></i>否</label>
							</div>
						</div>
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">保价价值(美元)<br/><small class="text-navy">(选保价必填)</small></label>
						<div class="col-sm-3">
							 <input type="text" class="form-control" id="package_protect_price" name="package_protect_price" /> 
						</div> 
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">保价理由<br/><small class="text-navy">(选保价必填)</small></label>
						<div class="col-sm-3">
							 <input type="text" class="form-control" id="package_protect_price_reason" name="package_protect_price_reason"/> 
						</div> 
					</div>
					<div class="row">
						<label class="col-sm-2 control-label">若无法投递</label>
						<div class="col-sm-4 col-md-2">
							<div class="radio i-checks">
							<label><input type="radio" value="1" name="package_cross_border_unreachable" id="package_cross_border_unreachable"> <i></i>退回，并承担退回费用 </label>
							</div>
						</div>						
						<div class="col-sm-4 col-md-2">
							<div class="radio i-checks">
							<label><input type="radio" value="2" name="package_cross_border_unreachable"> <i></i>放弃</label>
							</div>
						</div>
					</div>
					<div class="row">
                        <label class="col-sm-2 control-label">对公快递事由<br/><small class="text-navy">(审批用)</small></label>
						<div class="col-sm-6">
							<textarea class="form-control"  id="inspection_apply_cause" name="inspection_apply_cause"></textarea>
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
					<h5>选择快递公司</h5>
				</div>
				<div class="ibox-content">
					<div class="row">
						<label class="col-sm-2 col-md-2 control-label">快递类型</label>
						<c:forEach var="item" items="${packageExpressList}">
   						<div class="col-sm-3 col-md-2">
							<div class="radio i-checks">
							<label><input type="radio" value="${item.id}" name="package_expect_express"  <c:if test="${item.id eq 0 or item.id eq 4}">id="package_expect_express"</c:if> /> <i></i>${item.name}</label>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>			
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-3 col-sm-offset-3">
			<a class="btn btn-primary btn-lg btn-submit" id="submit_btn"><i class="fa fa-check"></i>&nbsp;提交申请</a>
		</div>
		<div class="col-sm-2">
			<a href="/user-list" class="btn btn-white btn-lg"><i class="fa fa-reply"></i>&nbsp;返回</a>
		</div>
	</div>
	</div>
</div>
<script>
	$("#delivery").addClass('active');
	$('#version').slimScroll({
	    color: '#ccc',
	    size: '10px',
	    height: '686px',
	    alwaysVisible: true
	});
</script>
<script src="/dist/js/plugins/iCheck/icheck.min.js"></script>
<script>
var layer_markinfo_index;
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
            
            $('#submit_btn').click(function(){
            	var check_message = {
            		"recv_name":["请填写收件人名字",/^[\s\S]{1,50}$/,"名字长度不能超过50"],//长度不超过50 
        			"recv_phonenum":["请填写收件人手机号",/^[0-9\(\)+]{6,16}$/,"手机号格式错误"],//数字 可有连字符和加号和括号，不多于16位
        			"recv_address":["去填写收件人详细地址",/^[\s\S]{1,200}$/,"地址长度不能超过200"],//长度不超过200 
        			"recv_code":["请填写收件人邮政编码",/^[0-9]{6}$/ ,"邮政编码为6位数字"],//长度为6
                    "send_name":["请填写寄件人名字",/^[\s\S]{1,50}$/,"名字长度不能超过50"],
                    "send_phonenum":["请填写寄件人手机号",/^[0-9\(\)+]{1,16}$/,"手机号格式错误"],
                    "send_address":["去填写寄件人详细地址",/^[\s\S]{1,200}$/,"地址长度不能超过200"],
        			"send_code":["请填写寄件人邮政编码",/^[0-9]{6}$/,"邮政编码为6位数字"],
        			"package_type":["请选择托寄物类型",/^[12]$/,"文件类型信息出错"],
        			"package_inner_content":["请填写内件品名",/^[\s\S]{1,50}$/,"品名不能超过20个字符"],
        			"package_count":["请填写托寄物数量",/^[1-9][0-9]{0,5}$/,"托寄货物数量不正确"],
        			"package_is_price_protect":["请选择是否保价",/^[\s\S]+$/,"选择是否保价信息出错"],
        			"package_cross_border_unreachable":["请选择无法投递时，是否退回物品",/^[12]$/,"选择无法投递退回物品或放弃出错"],
        			"inspection_apply_cause":["请填写对公快递事由",/^[\s\S]{1,200}$/,"理由文字不能超过100"],
        			"package_expect_express":["请选择快递公司",/^[0-9]+$/,"选择快递公司信息出错"]
            	}
            	if($("input[name='package_is_price_protect']:checked").val()=="true"){
            		check_message["package_protect_price"]=["请填写保价价值",/^[0-9]{1,8}(\.[0-9]{0,2})?$/,"快递费用填写有误，小数点前最多8位，小数点后最多2位"];
            		check_message["package_protect_price_reason"]=["请填写保价理由",/^[\s\S]{1,50}$/,"保价理由长度不能超过50"];
            	}
            		
            		
            	var check_result = {};
            	for (var check_content_id in check_message){
            		var checking_obj =$('#'+check_content_id);
            		var checking_val;
            		if(checking_obj.attr('type')=='radio' || checking_obj.attr('type')=='checkbox'){
            			checking_val=$('input[name='+check_content_id+']:checked').val();
            		}else if(checking_obj.attr('disabled')=='disabled'){ //被disabled的select
            			continue;
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
               	if($("input[name='package_is_price_protect']:checked").val()=="true"){
               		check_result["package_protect_price"]=Math.round(check_result["package_protect_price"]*100)+"";
               	}      	
            	var layer_index = layer.confirm('确认提交申请？', {
            		  btn: ['提交','取消'],
            		  title:false,
            		  closeBtn:false
            		}, function(){
            			check_result["package_is_cross_border"] ="true";
            			$.ajax({
            				url:'/submit',
            				type:'POST',
            				dataType:'json',
            				data:check_result,
            				error:function(){
            					layer.close(layer_index);
            					layer.msg('保存失败', {icon: 5,shade:[0.5,'#000']});
            				},
            				success:function(data){
            					if(data.code==200){
            						layer.msg(data.message);
            						location.href='/user-list';
            					}else{
            						layer.close(layer_index);
            						layer.msg(data.message, {icon: 5,shade:[0.5,'#000']});
            					}
            				}
            			})
            		});
            	//
            });
            $.cxSelect.defaults.url = '/dist/js/cityData.json';
            $.cxSelect.defaults.emptyStyle = '';
            
            
            $.each(['recv','send'],function(i,val){
            	$('#'+val+'_info').cxSelect({selects: ['province', 'city', 'area'],jsonValue: 'value',jsonName:'name',jsonSub:'sub'});
	            $("#load_"+val+"_info_btn").click(function(){
	            	$.ajax({
	    				url:'/user-mark-list',
	    				type:'POST',
	    				dataType:'json',
	    				error:function(){
	    					layer.msg('加载失败', {icon: 5,shade:[0.5,'#000']});
	    				},
	    				success:function(data){
	    					if(data.code==200){
	    						layer_markinfo_index = layer.open({
	    			        		  type: 1,
	    			        		  title:"选择地址标签",
	    			        		  skin: 'layui-layer-rim', //加上边框
	    			        		  area: ['420px', '240px'], //宽高
	    			        		  content: (function(arr){
	    			        			  if(arr!=null && arr instanceof Array && arr.length!=0){
	    			        				  var str="<div class='mark-select'><ul>";
	    			        				  for(var mark in arr){
	    			        					  str += "<li><a class='mark-select-link "+val+"'>"+arr[mark]+"</a><i class='fa fa-times'></i></li>";
	    			        				  }
	    			        				  str +="</ul></div>";
	    			        				  return str;
	    			        			  }else{
	    			        				  return "<div>没有标签</div>";
	    			        			  }
	    			        		  })(data.data)
	    			        		});
	    					}else{
	    						layer.msg(data.message);
	    					}
	    				}
	    			});
	            	
	            });
	    		$("#save_"+val+"_info_btn").click(function(){
	    			var check_message = {
	                		"name":["请填写名字",/^[\s\S]{1,50}$/,"名字长度不能超过50"],//长度不超过50 
	            			"phonenum":["请填写手机号",/^[0-9\(\)+]{6,16}$/,"手机号格式错误"],//数字 可有连字符和加号和括号，不多于16位
	            			"address":["去填写详细地址",/^[\s\S]{1,200}$/,"地址长度不能超过200"],//长度不超过200 
	            			"code":["请填邮政编码",/^[0-9]{6}$/ ,"邮政编码为6位数字"],//长度为6
	            			"mark":["请填标签名",/^[\s\S]{1,20}$/ ,"标签长度不能超过20"]
	            			}
	    			var check_result = {};
	            	for (var check_content_id_short in check_message){
	            		var check_content_id = val+'_'+check_content_id_short;
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
	                      	
	            	var layer_index = layer.confirm('确认保存到标签库？', {
	            		  btn: ['保存','取消'],
	            		  title:false,
	            		  closeBtn:false
	            		}, function(){
	            			$.ajax({
	            				url:'/user-mark-save',
	            				type:'POST',
	            				dataType:'json',
	            				data:check_result,
	            				error:function(){
	            					layer.close(layer_index);
	            					layer.msg('保存失败', {icon: 5,shade:[0.5,'#000']});
	            				},
	            				success:function(data){
	            					if(data.code==200){
	            						layer.close(layer_index);
	            						layer.msg(data.message);
	            					}else if(data.code==412){
	            						var layer_index = layer.confirm(data.message, {
	            		            		  btn: ['确定','取消'],
	            		            		  title:false,
	            		            		  closeBtn:false
	            		            		}, function(){
	            		            			check_result['force']='true';
	            		            			$.ajax({
	            		            				url:'/user-mark-save',
	            		            				type:'POST',
	            		            				dataType:'json',
	            		            				data:check_result,
	            		            				error:function(){
	            		            					layer.close(layer_index);
	            		            					layer.msg('保存失败', {icon: 5,shade:[0.5,'#000']});
	            		            				},
	            		            				success:function(data){
	            		            					if(data.code==200){
	            		            						layer.close(layer_index);
	            		            						layer.msg(data.message);
	            		            					}else{
	            		            						layer.close(layer_index);
	            		            						layer.msg(data.message, {icon: 5,shade:[0.5,'#000']});
	            		            					}
	            		            				}
	            		            			});
	            		            		});
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
			//动态绑定加载操作
    		$("body").on('click','.mark-select-link',function(){
    			var mark = $(this).text();
    			var rs = $(this).hasClass('recv')?'recv':'send';
    			$.ajax({
    				url:'/user-mark-info',
    				type:'POST',
    				dataType:'json',
    				data:{'mark':mark},
    				error:function(){
    					layer.msg('加载失败', {icon: 5,shade:[0.5,'#000']});
    				},
    				success:function(data){
    					if(data.code==200){
    						(function(info){
    							if(info!=null){
    								try{
    									$('#'+rs+'_'+'name').val(info.name);
    									$('#'+rs+'_'+'phonenum').val(info.phonenum);
    									$('#'+rs+'_'+'address').val(info.address);
    									$('#'+rs+'_'+'code').val(info.code);
    									$('#'+rs+'_'+'mark').val(info.userMark);
    									
    									layer.close(layer_markinfo_index);
    								}catch(e){
    									layer.msg('信息错误', {icon: 5,shade:[0.5,'#000']});
    								}
    							}else{
    								layer.msg('信息加载失败', {icon: 5,shade:[0.5,'#000']});
    							}
    						})(data.data);
    					}else{
    						layer.close(layer_index);
    						layer.msg(data.message, {icon: 5,shade:[0.5,'#000']});
    					}
    				}
    			});
    		});
			//动态绑定删除操作
    		$("body").on('click','.mark-select li i',function(){
    			var mark = $(this).prev().text();
    			var that = $(this);
    			var layer_index = layer.confirm('确认删除“'+mark+'”标签？', {
	           		  btn: ['删除','取消'],
	           		  title:false,
	           		  closeBtn:false
	           		}, function(){
	    			$.ajax({
	    				url:'/user-mark-delete',
	    				type:'POST',
	    				dataType:'json',
	    				data:{'mark':mark},
	    				error:function(){
	    					layer.msg('操作失败', {icon: 5,shade:[0.5,'#000']});
	    				},
	    				success:function(data){
	    					if(data.code==200){	
	    						layer.close(layer_index);
	    						layer.msg(data.message);
	    						that.parent().remove();
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
</div>
<%@ include file='../common/footer.jsp' %>
