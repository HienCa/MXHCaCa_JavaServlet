<%-- 
    Document   : Conversations
    Created on : Oct 23, 2022, 3:41:11 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="images/logocaca.jpg" type="image/x-icon">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/style.css">
        <link rel="stylesheet" href="style/Friends.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>CaCa - Messenger | Caca</title>
    </head>
    <style>
        .active{
            display: block;
        }
        .hide{
            display: none;
        }
    </style>
    <body>
<!--        <div  id="formdelete" class="" style="position: absolute; left: 200px; top:100px; z-index: 2; background-color: #E4E6EB; padding: 10px">
            <h3>Bạn có chắc muốn xóa?</h3>
            <div style="display: flex; justify-content: space-between; margin: 10px">
                <form action="deleteConv" method="post">
                    <button class="hover" style="border: none; background: none; outline: none;color: red" >Xóa</button>
                </form>
                <button class="hover" id="CancelDelConv" style="border: none; background: none; outline: none;" >Hủy</button>
            </div>
        </div>-->
        <div class="header">
            <div class="header__left">
                <a href="indexServlet" class="header__center__home "><img src="images/logocaca.jpg" class="avatar-icon" alt="alt"/></a>
                <span class="groupSearch">

                    <input type="text" class="search" placeholder="Tìm kiếm trên Facebook">
                </span>
            </div>
            <!--            <div class="header__center ">
                            <a href="index.html" class="header__center__home">
                                <i class="fas fa-home-lg-alt icon icon--bg icon--blue"></i>
                            </a>
                            <a href="Friends.html" class="header__center__home">
                                <i class="fas fa-user-friends icon icon--bg "></i>
                            </a>
                            <a href="Watch.html" class="header__center__home">
                                <i class="fas fa-play icon icon--bg"></i>
                            </a>
                            <a href="" class="header__center__home">
                                <i class="fas fa-store icon icon--bg"></i>
                            </a>
                            <a href="" class="header__center__home">
                                <i class="fas fa-users icon icon--bg"></i>
                            </a>
                        </div>-->
            <div class="header__right">
                <!--                <span class="">
                                    <i class="fas fa-th-list icon icon--p hover"></i>
                                </span>-->

                <span id="notification" onclick="ToggleNoti()" class="notification">
                    <i class="fas fa-bell icon icon--p hover"></i>
                </span>
                <span >
                    <div class="" id="avt">
                        <c:if test="${sessionScope.Avt!=null}">
                            <img src="images/${sessionScope.Avt}" alt="avatar" class="avatar-icon icon--hover" style="margin-right:10px; margin-left:5px; ">

                        </c:if>
                        <c:if test="${sessionScope.Avt==null}">
                            <img src="images/defaultImage.png" alt="" class="avatar-icon icon--hover" style="margin-right:10px; margin-left:5px; ">
                        </c:if>

                    </div>
                    <div class="box" id="box">
                        <a href="GetInfoDetailServlet" class="" style="text-decoration: none; color: #000">
                            <div class="container__left__item">

                                <img src="images/${sessionScope.Avt}" alt="" class="avatar-icon icon--hover"
                                     style="margin-right:10px; margin-left:5px; ">
                                <span class="text-bold">${sessionScope.TenTK}</span>

                            </div>
                        </a>
                        <a href="DangXuatServlet" style="text-decoration: none; color: #000">
                            <div class="container__left__item" >
                                <i class="fa-solid fa-right-from-bracket" style="padding:10px; margin: 10px;"></i>
                                Đăng Xuất
                            </div>
                        </a>
                    </div>
                </span>

            </div>

            <div id="notificationBox" class="messengerList hide">
                <div class="messengerList__head">
                    <h2>Thông báo</h2>
                    <div class="groupBtn">
                        <i class="fas fa-video icon--md icon-w icon--hover"></i>
                    </div>
                </div>
                <div class="messengerList__head__show mg-top-10">
                    <span class="messengerList__head__show__item btn__sub--active icon--hover">Tất cả</span>
                    <span class="messengerList__head__show__item icon--hover">Chưa đọc</span>
                </div>

                <div class="messengerList__head__history mg-top-10">
                    <span class="messengerList__head__history__item icon--hover">Trước đó</span>
                    <span class="messengerList__head__history__item icon--blue icon--hover">Xem tất cả</span>
                </div>

                <div class="groupSearch mg-top-10 ">
                    <input type="text" class="search w-100" placeholder="Tìm kiếm trên Messenger">
                </div>
                <div class="statusPersonal__item GroupRelative mg-top-10">
                    <span class="GroupRelative">
                        <img src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover ">
                        <i class="fas fa-laugh-squint icon-w iconAbsolute icon--yellow icon--md"></i>
                    </span>
                    <div class="groupName mg-left-10">
                        <span class="groupName__item__name text--light">
                            <span class="text--weight">Hot Girl</span> đã bày tỏ cảm xúc về một video: No Cap.
                        </span>
                        <div class="groupName_item__time">
                            <span class="mg-left-10px text-light icon--blue">1h trước</span>
                        </div>
                    </div>
                    <i class="fas fa-circle icon-w iconActiveAbsolute"></i>
                </div>
                <div class="statusPersonal__item GroupRelative mg-top-10">
                    <span class="GroupRelative">
                        <img src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover ">
                        <i class="fas fa-birthday-cake icon-w iconAbsolute icon--pink"></i>
                    </span>
                    <div class="groupName">
                        <span class="groupName__item__name text--light">
                            Sinh nhật của <span class="text--weight">Hot Girl</span> vào 01 tháng 01
                        </span>
                        <div class="groupName_item__time">
                            <span class="mg-left-10px text-light icon--blue">6h trước</span>
                        </div>
                    </div>
                    <i class="fas fa-circle icon-w iconActiveAbsolute"></i>
                </div>
                <div class="statusPersonal__item GroupRelative mg-top-10">
                    <span class="GroupRelative">
                        <img src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover ">
                        <i class="fas fa-user-plus icon-w iconAbsoluteAdd icon--blue"></i>
                    </span>
                    <div class="groupName">
                        <span class="groupName__item__name text--light">
                            <span class="text--weight">Tiểu Bạch</span> đã gửi lời mời kết bạn
                        </span>
                        <div class="groupName_item__time">
                            <span class="mg-left-10px text-light icon--blue">4 tuần trước</span>
                        </div>
                        <div class="d-flex mg-top-10">
                            <button class="btn--accept">Xác nhận</button>
                            <button class="btn--delete mg-left-10">Xóa</button>
                        </div>
                    </div>


                    <i class="fas fa-circle icon-w iconActiveAbsolute"></i>
                </div>


            </div>
        </div>
        <div class="container-fluid pt-5">
            <div class="row pt-4">
                <div id="conversation__item" class="col-lg-3 " style="border-right: 1px solid #ccc;">
                    <div class="messengerList__head ">
                        <h2>Chat</h2>
                        <div class="groupBtn">
                            <i class="fas fa-ellipsis-h icon--md icon-w icon--hover"></i>
                            <i class="fas fa-expand-arrows-alt icon--md icon-w icon--hover"></i>
                            <i class="fas fa-video icon--md icon-w icon--hover"></i>
                        </div>
                    </div>
                    <div class="groupSearch mg-top-10">
                        <input type="text" class="search w-100" placeholder="Tìm kiếm trên Messenger">
                    </div>
                    <div class="" style="overflow-y: scroll; overflow-x: hidden; height:68vh">
                        <c:forEach items="${listConv}" var="lc">
                            <div style="display: flex; ">
                                <a style="width: 100%" href="LoadConversationDetail?FUserID=${lc.getConvd().getUa().getUserID()}&ConvID=${lc.getConvd().getConv().getConversationID()}&Avt=${lc.getConvd().getUa().getAvt()}&NickName=${lc.getConvd().getNickName()}">
                                    <div class="statusPersonal__item mg-top-10" >

                                        <img src="images/${lc.getConvd().getUa().getAvt()}" alt="avatar" class="avatar-icon icon--hover">
                                        <div class="groupName">
                                            <span class="groupName__item__name icon--red">
                                                ${lc.getConvd().getNickName()} </span>
                                            <div class="groupName_item__time">
                                                <c:if test="${lc.getUserID() != sessionScope.UserID}">
                                                    <span class="name icon--blue">${lc.getConvd().getNickName()}:</span>
                                                    <span class="mg-left-10px textlight">${lc.getMessageContent()}</span>
                                                </c:if>

                                                <c:if test="${lc.getUserID() == sessionScope.UserID}">
                                                    <span class="name icon--blue">Bạn:</span>
                                                    <span class="mg-left-10px textlight">${lc.getMessageContent()}</span>
                                                </c:if>
                                            </div>

                                        </div>


                                    </div>
                                </a>

                                <div  class="statusPersonal__item mg-top-10" id="delete"><button style="border: none; background: none; outline: none"  id="DeleteConv"><i  class="fas fa-ellipsis-h"></i></button></div>

                            </div>

                        </c:forEach>


                    </div>
                    <div class="p-2 hover" style="border-top: 1px solid #ccc;">
                        <i class="fas fa-download icon--md ml-5 pt-3"></i>
                        <span>Cài đặt ứng dụng cho Messenger</span>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="" >

                        <div class="d-flex justify-content-between pt-3 pb-3 align-items-center "
                             style="border-bottom: 1px solid #ccc; ">
                            <div class="">
                                <img src="images/${AvtF}" alt="" class="avatar-icon icon--hover">
                                <span class="ml-1 text-bold">${NickName}</span>

                            </div>
                            <div class="">
                                <i class="fas fa-phone-alt text-primary icon--md icon-w"></i>
                                <i class="fas fa-video text-primary icon--md icon-w"></i>
                                <i class="fas fa-info-circle text-primary icon--md icon-w"></i>
                            </div>
                        </div>
                        <div class="" style="overflow-y: scroll; height:68vh">
                            <c:forEach items="${listChatItem}" var="lci">
                                <c:if test="${lci.getConvd().getUa().getUserID()!= sessionScope.UserID}">
                                    <div class="d-flex align-items-center mt-2" >
                                        <img src="images/${lci.getConvd().getUa().getAvt()}" alt="" class="avatar-icon icon--hover">
                                        <div class="messDetail d-flex ml-2">
                                            <span class="bg-primary p-2 mb-1 text-white" style="border-radius:25px">
                                                ${lci.getMessageContent()}
                                            </span>
                                            <!--                                        <span class="bg-primary p-2 mb-1 text-white" style="border-radius:25px">Em ưi</span>
                                                                                    <span class="bg-primary p-2 mb-1 text-white" style="border-radius:25px">Nhỏ kia</span>-->
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${lci.getConvd().getUa().getUserID()== sessionScope.UserID}">
                                    <div class="d-flex mr-2 justify-content-start" style=" ">
                                        <div class="d-flex align-items-center mt-3" style="margin-left: 650px;position: relative">
                                            <div class="messDetail d-flex justify-content-start" >
                                                <span class="bg-primary p-2 mb-1 text-white " style="border-radius:25px;position: absolute; right: 60px; min-width: 200px; bottom: 5px; ">
                                                    ${lci.getMessageContent()}
                                                </span>

                                            </div>
                                            <c:if test="${sessionScope.Avt!=null}">
                                                <img src="images/${sessionScope.Avt}" alt="avatar" class="avatar-icon icon--hover ml-2">

                                            </c:if>
                                            <c:if test="${sessionScope.Avt==null}">
                                                <img src="images/defaultImage.png" alt="" class="avatar-icon icon--hover ml-2">
                                            </c:if>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>


                        </div>

                    </div>
                    <form action="InsertChat" method="post">

                        <div class="d-flex align-items-center mt-3 " style="clear:both;">

                            <div class="d-flex align-items-center">
                                <i class="fas fa-plus-circle icon-w text-primary icon--md icon--hover"></i>
                                <i class="fas fa-images icon-w text-primary icon--md icon--hover"></i>
                                <i class="fas fa-smile icon-w text-primary icon--md icon--hover"></i>
                            </div>

                            <input type="text" class="search w-100 icon--md pl-4" name="messagesContent" placeholder="Aa">
                            <div class="">
                                <i class="fas fa-thumbs-up text-primary icon--md ml-4 icon--hover"></i>

                            </div>

                        </div>
                        <%--<input class="d-none" name="FriendID" value="${chatUF.getFriend().getFriendID()}">
                        <input class="d-none" name="ConversationID" value="${chatUF.getConversation().getConversationID()}">--%>
                        <input class="d-none" name="ConvdID" value="${ConvdID}">
                        <input type="submit" class="d-none">

                    </form>

                </div>
                <div class="col-lg-3">
                    <div class="" style="text-align:center;">
                        <img src="images/${AvtF}" alt="" class="avatar-icon icon--hover  " style="width: 200px; height: 200px; ">
                        <h4 class="text-bold mt-2 ">${NickName}</h4>
                        <p>Hoạt động 7p trước</p>
                    </div>

                    <div class="d-flex justify-content-around">
                        <div class="" style="text-align:center ;">
                            <i class="fab fa-facebook icon--hover icon--md"></i>
                            <p>Trang cá nhân</p>
                        </div>
                        <div class="" style="text-align:center ">
                            <i class="fas fa-bell icon--hover icon--md"></i>
                            <p>Tắt thông báo</p>
                        </div>
                        <div class="" style="text-align:center ;">
                            <i class="fas fa-search icon--hover icon--md"></i>
                            <p>Tìm kiếm</p>
                        </div>
                    </div>
                    <div class="p-3 mt-2 hover d-flex justify-content-between align-items-center">
                        <span>Tùy chỉnh đoạn chat</span> 
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="p-3 mt-2 hover d-flex justify-content-between align-items-center">
                        <span>File phương tiện, file và liên kết</span> 
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="p-3 mt-2 hover d-flex justify-content-between align-items-center">
                        <span>Quyền riêng tư & hỗ trợ</span> 
                        <i class="fas fa-chevron-down"></i>
                    </div>

                </div>
            </div>
        </div>



        <script>
            function saveConvID(${lc.getConvd().getConv().getConversationID()})
            {

                sessionStorage.setItem("ConvID", ${lc.getConvd().getConv().getConversationID()});


            }

            const formdelete = document.querySelector("#formdelete");
            const DeleteConv = document.querySelectorAll("#DeleteConv");
            const CancelDelConv = document.querySelector("#CancelDelConv");
            function checkClick() {
                if (formdelete.classList.contains("active")) {
                    formdelete.classList.remove("active");
                } else {
                    formdelete.classList.add("active");
                    sessionStorage.setItem("ConvID", ${lc.getConvd().getConv().getConversationID()});

                }
            }
            ;
            for (var i = 0, max = DeleteConv.length; i < max; i++) {
                DeleteConv[i].addEventListener("click", checkClick);
            }
            CancelDelConv.addEventListener("click", checkClick);

        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="Javascript/index.js"></script>

    </body>

</html>
