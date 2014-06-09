$(document).ready(function(){
	$("#product_square").on('keyup',function(){
		article_id = $("#product_article_id").val()
		console.log("article_id "+article_id);
			if(article_id!=""){
				product_square = $("#product_square").val();
				console.log("article_id"+product_square);				
				$.ajax({url:"/admin/products/sold?article_id="+article_id+"&square="+product_square,
					success:function(result){
			    // alert(22)
					}
				});
			}
	  });
	});