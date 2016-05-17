<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="authorize" uri="/WEB-INF/taglib/hxbtag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<s:set id="currentHandle" value="'list'" />
	<s:set id="isHideDel" value="true" />
	<s:set id="isHideAdd" value="true" />
	<s:include value="inc-vars.jsp" />
	<title><s:text name="lbl.%{#submodule}" /><s:text name="lbl.%{#currentHandle}" /></title>
	<s:include value="/common/include.jsp" />
	<%-- 引入jsp,使用Ajax查询详情 --%>
	<script type="text/javascript">
	function doUpdate(id,index){
		var isAjax=true;
		var checkedValue=$("input[name='agentType."+index+"']:checked").val();
		var hidid=$("#"+id);
		var hidValue=$("#"+id).val();
		var isOpen=hidid.parent().prev().children(":hidden").val();
		var isOpen2=$("#switch_"+id).val();
		if(checkedValue == hidValue){
			alert("未做修改，无需保存");
		}else if(isOpen==0){
			alert("该彩种代理商状态为关，不可选");
		}else{	
			if(confirm('确定要修改吗')){
				$.ajax({
					type:"post",
					url:ctx+'/business/lotteryquick/editexc.do',
					data:{'id':id,'step':checkedValue},
					async:false,
					success:function(data){
						alert("修改成功");
					}
				});
			}
		}
	}
	$(function(){
		
// 		if($(':radio[name^=agentType.]').parent().prev().children(':hidden').val()==1){
// 			$(this).parent().children('input:checked').attr("disabled","true");
// 			isAjax = false;
// 		}
		$(':radio[name^=agentType.]').bind('change',function(){
			var s = $(this).parent().prev().text();
			var agentType=$(this).parent().children('input:checked').val();
			var lotteryId=$(this).parent().parent().children('td:eq(0)').text();
			var checkedradio=$(this).parent().children('input:checked');
			var uncheckedradio=$(this).children('input:checked').siblings('input[type=radio]');
					$.ajax({
					type:"post",
					url:ctx+'/business/lotteryquick/list!checkSwitch.do',
					data:{'lotteryId':lotteryId,'agentType':agentType},
					async:false,
					success:function(data){
						if(data!=null&&data!=""){
							if(data=="0"){
								$(this).parent().prev().text('关');
								$(this).parent().prev().children(':hidden').val('0');
								checkedradio.parent().prev().text('关');
								var html='<input type="hidden" value="0"/>';
								checkedradio.parent().prev().append(html);
								checkedradio.parent().prev().children(':hidden').val('0');
// 								checkedradio.removeAttr("checked");
// 								uncheckedradio.attr("checked","checked");
// 								uncheckedradio.attr("disabled","true");
							}else if(data=="1"){
								$(this).parent().prev().text('开');
								checkedradio.parent().prev().text('开');
								$(this).parent().prev().children(':hidden').val('1');
							}else{
								alert("彩票编号或代理商类型不存在");
							}
						}
					}
				});
			
		});
	});
</script>
</head>
<body>
	<s:include value="/common/commonactionmsg.jsp" />
	<div id="pageContent">
		<s:include value="/common/includeNavBar.jsp" />
		 <div>
			 <form method="post" id="searchForm" style="width: 98.8%;" action="${pageContext.request.contextPath}/<s:property value="#module" />/<s:property value="#submodule" />/list.do">
			 	<s:token />
					<div class="searchFrmTab" style="border: 1px solid #F0D2D2;">
						<div title="<s:text name="lbl.basic"/><s:text name="lbl.information"/><s:text name="lbl.search"/>">
							<div class="formstyle">
								<table style="border: 1px; width: 100%;">
									<tr >
										<td class="tdLabel"><s:text name="lbl.id"/></td>
										<td><s:textfield name="searchDataObj.lotteryId" theme="simple"/></td>
										<td class="tdLabel"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</form>
		 <form method="post" action="${pageContext.request.contextPath}/<s:property value="#module" />/<s:property value="#submodule" />/deleteexc.do" id="deleteListContent">
			<s:hidden id="AUDIT_TYPE" name="AUDIT_TYPE" value="0026" />
			<s:hidden id="AUDIT_OPERATION" name="AUDIT_OPERATION"  value="001" />
			<table class="listdatatable" cellpadding="0" cellspacing="0">
				<thead>
					<tr>
						<th><s:text name="lbl.lotteryId" /></th>
						<th><s:text name="lbl.lottery.lotteryName" /></th>
						<th><s:text name="lbl.lotteryMerchant.lotterySwith" /></th>
						<th><s:text name="lbl.agentType" /></th>
						<th><s:text name="lbl.control" /></th>
					</tr>
				</thead>
				<tbody>
					<s:if test="%{dp == null || dp.size() <=0 }">
						<tr id="not_found_row">
							<td colspan="1" style="text-align: center;"><s:text name="err.record.not.found" /></td>
						</tr>
					</s:if>
					<s:iterator value="dp" id="obj" status="num">
						<tr id="row">
							<td><s:property value="#obj.lotteryId"/></td>
							<td><s:property value="#obj.lottery.lotteryName"/></td>
							<td>
								<s:hidden id="switch.%{#obj.id}" name="lotterySwitch" value="%{#obj.lotteryMerchant.lotterySwitch}"/>
								<html type="hidden" value="0"/>
								<s:if test="#obj.lotteryMerchant.lotterySwitch == 0">
									<s:text name="lbl.lotteryMerchant.lotterySwith.close" />
								</s:if> 
								<s:if test="#obj.lotteryMerchant.lotterySwitch == 1">
									<s:text name="lbl.lotteryMerchant.lotterySwith.open" />
								</s:if>
							</td>
							<td id="rad<s:property value="#obj.id" />">
								<s:hidden name="index" id="%{#obj.id}" value="%{#obj.agentType}"/>
								
								<s:radio list="#obj.lst" name="agentType.%{#num.index}"  listKey="agentType" listValue="agentName" value="#obj.agentType" theme="simple"/>
<%-- 								<s:radio id="agentType" list="#obj.lst" name="agentType.%{#num.index}"  listKey="key" listValue="value" value="#obj.agentType" theme="simple"  /> --%>
<%-- 								<s:if test="#obj.lotteryMerchant.lotterySwitch==0"> --%>
<%-- 							<s:radio id="agentType" list="#{'1':'九歌','0':'华彩' }" name="agentType.%{#num.index}"  value="#obj.agentType" theme="simple" disabled="true" /> --%>
<%-- 								</s:if> --%>
<%-- 								<s:elseif test="#obj.lotteryMerchant.lotterySwitch==1"> --%>
<%-- 							<s:radio id="agentType1" list="#{'1':'九歌','0':'华彩' }" name="agentType.%{#num.index}"  value="#obj.agentType" theme="simple" /> --%>
<%-- 								</s:elseif> --%>
							</td>
							<td style="text-align: center;" class="save">	
								<authorize:authorize ifAllGranted="ET01690214">						
									<span class="forAll">
									<input type="button" name="savech" id="<s:property value="#obj.id" />" value="<s:text name='btn.savechange'/>" onclick="return doUpdate('<s:property value="#obj.id" />','<s:property value="#num.index" />');"/>
									&nbsp;&nbsp;&nbsp;</span>
								</authorize:authorize>
							</td>
						</tr>
					</s:iterator>
				</tbody>
				<tfoot></tfoot>
			</table>
		</form>
			<s:include value="/common/includePage.jsp" />
		</div>
	</div>
	<div id="reviewView" style="display: none;">
		<div id="reviewFrame"></div>
	</div>
</body>
</html>
