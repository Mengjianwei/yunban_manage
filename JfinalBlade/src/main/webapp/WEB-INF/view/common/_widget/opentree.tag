

<input type="text" id="_${x.index!}_INPUT" ${x.required!} placeholder="${placeholder!}" class="form-control" />
<input type="hidden" id="_${x.index!}" data-type="opentree" name="token_${table!x.table}.${x.index!}" value="${x.value!}" />


<script type="text/javascript">
	$(function(){
		$("#_${x.index!}_INPUT").bind("click",function(){
			@ var ename = func.encodeUrl(x.name);
			var val = $("#_${x.index!}").val();
			var urlParaSeparator = "-";
			val = (val == "") ? 0 : val;
			layer.open({
        	    type: 2,
        	    title:"树形选择",
        	    area: ["250", "420px"],
        	    fix: false, //不固定
        	    maxmin: true,
        	    content: "${basePath}/ztree/open/"
					+"${x.type!0}"+urlParaSeparator
					+"_${x.index!0}"+urlParaSeparator
					+"${ename!0}"+urlParaSeparator
					+"${x.source!0}"+urlParaSeparator
					+"${x.check!0}"+urlParaSeparator
					+"${x.where!0}"+urlParaSeparator
					+"${x.intercept!0}"+urlParaSeparator
					+"${x.ext!0}"+urlParaSeparator + val
        	});
		});
		
		if($("#_${x.index!}").val() != ""){
			initOpenTree($("#_${x.index!}").val());
		}
		
		
	});
	
	function initOpenTree(val){
		$.post("${basePath}/ztree/getTreeListName",{source:"${x.source!}", type:"${x.type!}", where:"${x.where!}", intercept:"${x.intercept!}", val:val},function(data){
			if(data.code === 0){
				$("#_${x.index!}_INPUT").val(data.data);
			}
		}, "json");
	}
	
</script>