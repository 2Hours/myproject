
function setPage(total,currentPage,pageSize){//设置页脚显示样式
	$("#dataTables-example_paginate ul").empty();
	var yeshu = Math.ceil(total/pageSize) ;//页数//分多少页
	var digg = $("#dataTables-example_paginate ul");
	if(currentPage==1){//加载首页和上一页
		digg.append('<li class="paginate_button previous disabled"><a href="javascript: void(0);">上一页</a></li>');
	}else{
		digg.append('<li class="paginate_button previous"><a href="javascript: void(0);" onclick="loadList('+(parseInt(currentPage)-1)+','+pageSize+');">上一页</a></li>');
	}
	if(yeshu <=9){//若页数不大于9，则全部输出
		 for (var i = 0; i < yeshu; i++) {
			 
		      if (currentPage == i+1) {
		    	  digg.append('<li class="paginate_button active"><a href="javascript: void(0);" onclick="loadList('+(i+1)+','+pageSize+');">'+(i+1)+'</a></li>'); 
		      } else {
		    	  digg.append('<li class="paginate_button"><a href="javascript: void(0);" onclick="loadList('+(i+1)+','+pageSize+');">'+(i+1)+'</a><li>'); 
		      }
		    }
	}else{//页数大于9
		if (currentPage < 5) {
		      //当前页小于5时,打印格式如下：1 2 3 4 5 ... 11
		      for (var i = 1; i <= 5; i++) {//当前页小于5时,打印格式如下：1 2 3 4 5 ... 11
		        if (i == currentPage) {
		        	digg.append('<li class="paginate_button active"><a href="javascript: void(0);" onclick="loadList('+i+','+pageSize+');">'+currentPage+'</a></li>'); 
		        } else {
		        	digg.append('<li class="paginate_button"><a href="javascript: void(0);" onclick="loadList('+i+','+pageSize+');">'+i+'</a></li>'); 
		        }
		      }
		    //  digg.append('...'); 
		}else if(currentPage >= 5  && currentPage <= yeshu - 4){//打印格式如下：1 ... 5 6 7 8 9 ... 16
			//digg.append('...'); 
		    for (var i =  parseInt(currentPage) - 2; i <= parseInt(currentPage) + 2; i++) {
		    	if (i == currentPage) {
			         digg.append('<li class="paginate_button active"><a href="javascript: void(0);" onclick="loadList('+i+','+pageSize+');">'+currentPage+'</a></li>'); 
			     } else {
			         digg.append('<li class="paginate_button"><a href="javascript: void(0);" onclick="loadList('+i+','+pageSize+');">'+i+'</a></li>'); 
			     }
		    }
		    //digg.append('...'); 
		}else if (currentPage > yeshu - 5) { //打印格式如下：1 ... 12 13 14 15 16
		//	digg.append('...'); 
	        for (var i = yeshu - 4; i <= yeshu; i++) {
        	  if (i == currentPage) {
		          digg.append('<li class="paginate_button active"><a href="javascript: void(0);" onclick="loadList('+i+','+pageSize+');">'+currentPage+'</a></li>'); 
		      } else {
		          digg.append('<li class="paginate_button"><a href="javascript: void(0);" onclick="loadList('+i+','+pageSize+');">'+i+'</a></li>'); 
		      }
	      }
		}
	}
	if(currentPage==yeshu){//加载下一页和尾页
		digg.append('<li class="paginate_button next disabled"><a href="javascript: void(0);">下一页</a></li>'); 
	}else{
		digg.append('<li class="paginate_button next"><a href="javascript: void(0);" onclick="loadList('+(parseInt(currentPage)+1)+','+pageSize+');">下一页</a></li>');
	}
}