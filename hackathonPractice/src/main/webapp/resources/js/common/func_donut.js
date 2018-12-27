var showAlltable = function(major){
	
				var str='';
				str+=' <div class="major">';
				str+='<div id="demo1" class="donut-size">';
				str+='<div class="pie-wrapper">';
				str+='<span class="label"> <span class="num">0</span><span class="smaller">%</span></span>';
				str+='<div class="pie">';
				str+='<div class="left-side half-circle"></div>';
				str+='<div class="right-side half-circle"></div>';
				str+=' </div> ';
				str+=' <div class="shadow"></div> ';
				str+=' </div> ';
				str+=' </div> ';
				str+=' <label class="label_major">'+ major +' </label>';
				str+=' </div> ';
				var tableChart = document.getElementById("tableChart");
				tableChart.innerHTML=str;	
	
}
