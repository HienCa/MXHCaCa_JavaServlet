<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" href="images/nvhh.jpg" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Đăng nhập CaCa</title>
    </head>

    <body>

        <div class="container-fluid text-center pt-5" style="background-color:#F0F2F5; height: 100vh">

            <form action="DangNhapServlet" method="post">
                <div class=" w-50  h-100  d-inline-block m-auto rounded" >
                    <video width="100%" height="100%" loop="true" autoplay="autoplay" muted="">
                        <source src="videos/logoCaCa.mp4" type="video/mp4">
                    </video>
                    <div class="row mb-3 pt-2">
                        <div class="col col-lg-12">
                            <div style="color: red;">${Error}</div>
                            <input type="text" class="shadow-none rounded border-0 w-100 p-3" name ="Username" placeholder="Email/Số Điện Thoại">
                        </div>
                        <div class="col col-lg-12 mt-2 ">
                           
                            <input type="password" class="shadow-none rounded border-0 w-100 p-3" name = "password" placeholder="Password">
                        </div>
                    </div>
                    <button class="btn btn-primary p-2 w-100">Đăng nhập</button>
                    <a href="signup.jsp " class="text-white d-inline-block bg-success p-2 rounded mt-2">Tạo tài khoản mới</a>

                </div>
            </form>
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