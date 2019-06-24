$(function(){
	var num = 0;
	var timer = setInterval(autoplay,1000);
	$(".show").mouseenter(function(){
		clearInterval(timer);
	})
	$(".show").mouseleave (function(){
		timer = setInterval(autoplay,1500);
	})
	$(".show ul li").mouseenter(function(){
		var num = $(this).index();
		$(".show img").eq(num).fadeIn(800).siblings('img').fadeOut(800);
		$(".show ul li").eq(num).css('background','red')
		.siblings('li').css('background','gray');
	})
	
	function autoplay(){
	   num ++;
		if(num == 5){
			num=0;
		}
		$(".show img").eq(num).fadeIn(100).siblings('img').fadeOut(100);
		$(".show ul li").eq(num).css('background','red')
		.siblings('li').css('background','gray');
}
}

)
$("#search button").click(function () {
    var bookName = $("#findbook").val();
    var urls = "../jsp/bookshow.jsp?name="+bookName;
    window.location.href= urls;
})
$(function () {
    var urls ="/start"
    $.ajax({
         url:urls,
        type:"get",
        contentType:"application/json;charset=utf-8",
        success:function (data) {
            for(var  i = 0;i<data.length;i++){
                 $("#content .goodsshow").append("<a id='a"+i+"'><div><img id='img"+i+"'><p id='p1"+i+"' class='p1'></p><p id='p2"+i+"'class='p2'></p></div></a>");
                $("#content .goodsshow #a"+i).attr("href", "/jsp/book_info.jsp?id=" +data[i].bookId);
                $("#content .goodsshow #img"+i).attr("src", data[i].bookImg);
                $("#content .goodsshow #p1"+i).html(data[i].bookName);
                $("#content .goodsshow #p2"+i).html(data[i].bookPrice);
            }

        }
    })
})


