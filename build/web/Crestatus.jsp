<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" href="images/nvhh.jpg" type="image/x-icon">
	<title>Tạo bài viết</title>
</head>
<style>	
		*{
			margin:0;
			padding:0;
			box-sizing: border-box;	
		}
		body{
			background-color:rgba(241,245,248,0.1);
			background-size: cover;
			font-family:sans-serif;
			justify-content:center;
			}
		#wrapper{
			display: flex;
			justify-content:center;
			padding: 50px;
			justify-items:center;
			align-items: center;
			
		}
		.header{
			background-color: white;
			
			margin-bottom: 30px;
			width:400px;
			height: 400px;
			border-radius: 5%;
			border: 1px solid gray;
			
		}
		
		
		.container{
			max-width:100%;
			margin: 0px auto;
			display:flex;
			justify-content:center;
			justify-items:center;
		}
		
		.statusPersonal{
   			justify-content:center;
   			border-bottom: 1px solid #ccc;
   			padding: 10px;
   			justify-items:center;
   			align-items: center;
		}	
		.statusPersonal h3{
			justify-content:center;
   			
   			padding: 10px;
   			justify-items:center;
   			align-items: center;
		}
		.content{
			border-bottom: 1px solid #ccc;
   			padding: 10px;
   			justify-content: left;
			justify-items:center;
			align-items: center;
			display:flex;
		}
		.avatar-icon{
    		width:50px;
    		height: 50px;
    		border-radius: 50%;
   			border: 1px solid #ccc; 
   			
		}
		.write-status{
		    width: 390px;
		    margin: 5px;
		    border-radius: 25px;
		    background-color:#F0F2F5;
    		height:150px;
		    font-size: 15px;
		    border: none;
		    outline: none;
    
    		padding: 15px;
		}
		
		#nen{
			display:flex;
			justify-content:space-between;
			
		}
		
		.btn_dang{
			margin:10px;
			padding:10px;
			color:#fff;
			background-color:#007bff;
			border-radius: 5px;;
			width:300px;;
			
		}
		.btn_dang:hover{
			background-color:#005bff;
		}
		.tentk{
			
			padding:10px;
			justify-content:center;
			justify-items:center;
			align-items: center;
		}
	</style>
	<body >
	<div >
		<center><a href="indexServlet" ><button class="btn_dang">Hủy Đăng</button></a></center>
	</div>
		<div id="wrapper">
		
			<div class="header">
				<div class="statusPersonal">
	                   <center><h3>Tạo Bài Viết</h3></center>
	            </div>
				<div class="content">
		        	<img src="images/${sessionScope.Avt}" alt="" class="avatar-icon">
		        	<div class="tentk"><span><b>${sessionScope.TenTK}</b></span></div>
		           </div>
				<form  method="POST" action="UpLoadStatusServlet" enctype="multipart/form-data"> 
					<textarea  class="write-status" name="content"  placeholder="${sessionScope.TenTK} ơi, bạn đang nghĩ gì thế?"></textarea>
					<center><input class="input" type="file" name="images" value="Hình Ảnh" placeholder="Hình Ảnh"></center>
					<center><button class="btn_dang">Đăng</button></center>
				</form>
			</div>
		</div>
	</body>
</html>