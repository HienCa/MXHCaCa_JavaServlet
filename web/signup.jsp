<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>


        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="images/nvhh.jpg" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Document</title>
    </head>
    <body>
        <div class=" text-center  " style="background-color:#F0F2F5; height: 100vh">
            <div class="container d-flex justify-content-around align-items-center pt-5">
                <img src="images/logocaca.jpg" class="" alt="alt"/>
                <form action="DangKyServlet" method="post">
                    <div class=" w-100 p-4 m-auto rounded " >
                        <h2 class="text-center mb-3">ĐĂNG KÝ</h2>
                        <div class="row mb-4 ">
                            <div class="col col-lg-12">
                                <div style="color:red">${Error}${ErrorUserName}</div>
                                <input type="text" class="shadow-none border-0 rounded w-100 p-3" name = "FullName" placeholder="Họ Tên" value="${FullName}">
                            </div>
                            <div class="col col-lg-12 mt-2">
                                <input type="text" class="shadow-none border-0 rounded w-100 p-3" name = "Username" placeholder="UserName(Email/Số Điện Thoại)" value="${UserName}">
                            </div>
                            <div class="col col-lg-12 mt-2 ">
                                <input type="password" class="shadow-none border-0 rounded w-100 p-3" name = "Password" placeholder="Mật khẩu" value="${Password}">
                            </div>
                            <div class="col col-lg-12 mt-2 ">
                                <input type="password" class="shadow-none border-0 rounded w-100 p-3" name = "CPassword" placeholder="Nhập Lại Mật khẩu" value="${CPassword}">
                            </div>
<!--                            <div class="col col-lg-12 mt-2 ">
                                <span >Ngày Sinh</span> <input type="date" class="border-0 shadow-none rounded ml-3 p-3" name = "NgaySinh">
                            </div>
                            <div class="col col-lg-12 mt-2 ">
                                <span class="mr-5">Giới Tính</span>
                                <input type="radio" name="gioitinh" value = "Nam" class="ml-3" > Nam
                                <input type="radio" name="gioitinh" value = "Nữ" class="ml-3" >  Nữ

                            </div>-->
                        </div>
                        <button class="btn btn-primary p-2 w-100">Đăng ký</button>
                        <a href="index.jsp" class="text-white d-inline-block bg-success p-2 rounded mt-2">Đăng nhập</a>

                    </div>
                </form>
            </div>
        </div>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    </body>
</html>