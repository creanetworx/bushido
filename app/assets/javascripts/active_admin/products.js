$(document).ready(function(){
	$("#product_square").on('keyup',function(){
		article_id = $("#product_article_id").val()
		if(article_id!=""){
			product_square = $("#product_square").val();			
			$.ajax({url:"/admin/products/sold?article_id="+article_id+"&square="+product_square,
				success:function(result){
		    // alert(22)
				}
			});
		}
	});
	// $("#add_to_cart").click(function(){
	// 	$.ajax({url:"/admin/products/sold?article_id="+article_id+"&square="+product_square,
	// 		success:function(result){
	//     // alert(22)
	// 		}
	// 	});
	// });
});