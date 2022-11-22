


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" href="images/logocaca.jpg" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="style/style.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        <title>CaCa</title>
    </head>

    <body>
        <div class="header">
            <form class="header__left" action="FindMess" method="Post">

                <a href="indexServlet" class="header__center__home "><img src="images/logocaca.jpg" class="avatar-icon" alt="alt"/></a>
                <span class="groupSearch">

                    <input type="text" class="search" name = "Username" placeholder="Tìm kiếm trên Facebook" >
                    <input type="submit" style="display:none;">
                </span>
                
            </form>
            <div class="header__center ">
                <a href="indexServlet" class="header__center__home">
                    <i class="fas fa-home-lg-alt icon icon--bg icon--blue hover"></i>
                </a>
                <a href="FriendsServlet" class="header__center__home">
                    <i class="fas fa-user-friends icon icon--bg hover"></i>
                </a>
                <a href="Watch.jsp" class="header__center__home">
                    <i class="fas fa-play icon icon--bg hover"></i>
                </a>
                <a href="" class="header__center__home">
                    <i class="fas fa-store icon icon--bg hover"></i>
                </a>
                <a href="" class="header__center__home">
                    <i class="fas fa-users icon icon--bg hover"></i>
                </a>
            </div>
            <div class="header__right">
                <span class="">
                    <i class="fas fa-th-list icon icon--p hover"></i>
                </span>
<!--                <a href="LoadConversations?UserID=${sessionScope.UserID}">-->
                <span id="messenger" onclick="ToggleMess()" class="messenger">
                    <i class="fab fa-facebook-messenger icon icon--p hover"></i>
                </span>
                <!--                </a>-->
                <span id="notification" onclick="ToggleNoti()" class="notification">
                    <i class="fas fa-bell icon icon--p hover"></i>
                </span>
                <span class="" >
                    <div class="" id="avt">
                        <c:if test="${sessionScope.Avt!=null}">
                            <img src="images/${sessionScope.Avt}" alt="avatar" class="avatar-icon icon--hover" style="margin-right:10px; margin-left:5px; ">

                        </c:if>
                        <c:if test="${sessionScope.Avt==null}">
                            <img src="images/defaultImage.png" alt="" class="avatar-icon icon--hover" style="margin-right:10px; margin-left:5px; ">
                        </c:if>

                    </div>
                    <div class="box"  id="box">
                        <a href="GetInfoDetailServlet">
                            <div class="container__left__item">

                                <img src="images/${sessionScope.Avt}" alt="" class="avatar-icon icon--hover"
                                     style="margin-right:10px; margin-left:5px; ">
                                <span class="text-bold">${sessionScope.TenTK}</span>

                            </div>
                        </a>
                        <a href="DangXuatServlet">
                            <div class="container__left__item" >
                                <i class="fa-solid fa-right-from-bracket" style="padding:10px; margin: 10px;"></i>
                                Đăng Xuất
                            </div>
                        </a>
                    </div>
                </span>
            </div>

        </div>
        <div id="messengerBox" class="messengerList hide">
            <div class="messengerList__head ">
                <h2>Chat</h2>
                <div class="groupBtn">
                    <i class="fas fa-ellipsis-h icon--md icon-w icon--hover"></i>
                    <i class="fas fa-expand-arrows-alt icon--md icon-w icon--hover"></i>
                    <i class="fas fa-video icon--md icon-w icon--hover"></i>
                </div>
            </div>
            
            
            <c:forEach items="${listConv}" var="lc">
                
                <a href="LoadConversationDetail?FUserID=${lc.getConvd().getUa().getUserID()}&ConvID=${lc.getConvd().getConv().getConversationID()}&Avt=${lc.getConvd().getUa().getAvt()}&NickName=${lc.getConvd().getNickName()}">
                    <div class="statusPersonal__item mg-top-10">
                        
                            <img src="images/${lc.getConvd().getUa().getAvt()}" alt="avatar" class="avatar-icon icon--hover">
                            <div class="groupName">
                                <span class="groupName__item__name icon--red">
                                    ${lc.getConvd().getNickName()} </span>
                                <div class="groupName_item__time">
                                    <c:if test="${lc.getUserID() != sessionScope.UserID}">
                                        <span class="name icon--blue">${lc.getConvd().getNickName()}:</span>
                                        <span class="mg-left-10px text-light">${lc.getMessageContent()}</span>
                                    </c:if>

                                    <c:if test="${lc.getUserID() == sessionScope.UserID}">
                                        <span class="name icon--blue">Bạn:</span>
                                        <span class="mg-left-10px text-light">${lc.getMessageContent()}</span>
                                    </c:if>
                                </div>

                            </div>
                        
                        
                    </div>
                </a>
               
            </c:forEach>
            
            <!--            <div class="statusPersonal__item mg-top-10">
                            <img src="images/${sessionScope.Avt}" alt="" class="avatar-icon icon--hover">
                            <div class="groupName">
                                <span class="groupName__item__name text--light">
            ${sessionScope.TenTK}</span>
        <div class="groupName_item__time">
            <span class="name icon--blue">Văn Hiền:</span>
            <span class="mg-left-10px text-light">Haizz mệt mỏi quá đi...</span>
        </div>

    </div>
    <i class="fas fa-bell-slash icon-w iconAbsoluteActiveMess icon--md icon--gray"></i>
</div>

<div class="statusPersonal__item mg-top-10">
    <img src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover">
    <div class="groupName">
        <span class="groupName__item__name text--light">
            Mụi Mụi </span>
        <div class="groupName_item__time">
            <span class="name icon--blue">Tôi:</span>
            <span class="mg-left-10px text-light">HaHa</span>
        </div>

    </div>
    <i class="far fa-check-circle icon-w iconAbsoluteActiveMess icon--md icon--gray"></i>
</div>

<div class="statusPersonal__item mg-top-10">
    <img src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover">
    <div class="groupName">
        <span class="groupName__item__name text--light">
            Đệ Đệ </span>
        <div class="groupName_item__time">
            <span class="name icon--blue">Tôi:</span>
            <span class="mg-left-10px text-light">Tôi đang nghiêm túc đấy</span>
        </div>

    </div>
    <i class="fas fa-check-circle icon-w iconAbsoluteActiveMess icon--md icon--gray"></i>
</div>-->


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
        <div class="container">
            <div class="container__left">
                <a href="GetInfoDetailServlet">
                    <div class="container__left__item">

                        <c:if test="${sessionScope.Avt!=null}">
                            <img src="images/${sessionScope.Avt}" alt="avatar" class="avatar-icon icon--hover" style="margin-right:10px; margin-left:5px; ">

                        </c:if>
                        <c:if test="${sessionScope.Avt==null}">
                            <img src="images/defaultImage.png" alt="" class="avatar-icon icon--hover" style="margin-right:10px; margin-left:5px; ">
                        </c:if>

                        <span class="text-bold">${sessionScope.TenTK}</span>

                    </div>
                </a>
                <a href="FriendsServlet">
                    <div class="container__left__item">

                        <i class="fas fa-user-friends icon-w icon--md icon--blue"></i>
                        Bạn bè
                    </div>
                </a>

                <div class="container__left__item">
                    <i class="fas fa-users  icon-w icon--md icon--blue"></i>
                    Cộng đồng (Nhóm)
                </div>
                <div class="container__left__item">
                    <i class="fas fa-store  icon-w icon--md icon--yellow"></i>
                    Marketplace
                </div>
                <div class="container__left__item">
                    <i class="fas fa-play icon-w icon--md icon--blue"></i>
                    Watch
                </div>
                <div class="container__left__item">
                    <i class="far fa-clock icon-w icon--md icon--bluee"></i>
                    Kỷ niệm
                </div>
                <div class="container__left__item">
                    <i class="fas fa-bookmark icon-w icon--md icon--yellow"></i>
                    Đã lưu
                </div>
                <div class="container__left__item">
                    <i class="fas fa-flag icon-w icon--md icon--orange"></i>
                    Trang
                </div>
                <div class="container__left__item">
                    <i class="fas fa-user-clock icon-w icon--md icon--blue"></i>
                    Gần đây nhất
                </div>
                <div class="container__left__item">
                    <i class="fas fa-star icon-w icon--md icon--yellow"></i>
                    Yêu thích
                </div>
                <div class="container__left__item">
                    <i class="fas fa-calendar-day icon-w icon--md icon--orange"></i>
                    Sự kiện
                </div>

                <div class="container__left__item">
                    <i class="fas fa-angle-down icon-w icon--md"></i>
                    Xem thêm
                </div>
            </div>


            <div class="container__center">
                <div class="container__center_item">
                    <div class="container__center__head">
                        <div class="content__head">
                            <div class="GroupRelative">
                                <span class="btn-text">Tin</span>
                                <span class="absolute__Item "></span>
                            </div>
                            <div class="GroupRelative">
                                <span class="btn-text">Reels</span>
                                <span class="absolute__Item hide"></span>

                            </div>
                            <div class="GroupRelative">
                                <span class="btn-text">Phòng họp mặt</span>
                                <span class="absolute__Item hide"></span>

                            </div>
                        </div>
                        <div class="content__body">
                            <div class="content__body__item">
                                <c:if test="${sessionScope.Avt!=null}">
                                    <img src="images/${sessionScope.Avt}" alt="avatar" class="avatar icon--hover">

                                </c:if>
                                <c:if test="${sessionScope.Avt==null}">
                                    <img src="images/defaultImage.png" alt="" class="avatar icon--hover">
                                </c:if>

                                <span class="iconPlus">
                                    <i class="far fa-plus icon-s"></i>
                                </span>
                                <p class="text">Tạo tin</p>
                            </div>
                            <div class="content__body__item">
                                <img src="images/lenguyenanhdung.jpg" alt="" class="avatar-story icon--hover">
                                <img src="images/lenguyenanhdung.jpg" alt="" class="icon-avatar icon--hover">
                                <p class="text-absolute">A Dũng</p>
                            </div>
                            <div class="content__body__item">
                                <img src="images/phanthanhhai.jpg" alt="" class="avatar-story icon--hover">
                                <img src="images/phanthanhhai.jpg" alt="" class="icon-avatar icon--hover">
                                <p class="text-absolute">Thanh Hải</p>
                            </div>
                            <div class="content__body__item">
                                <img src="images/pha.jpg" alt="" class="avatar-story icon--hover">
                                <img src="images/pha.jpg" alt="" class="icon-avatar icon--hover">
                                <p class="text-absolute">Hoàng anh</p>
                            </div>



                        </div>
                    </div>

                </div>
                <div class="container__center_item mg-top-10">
                    <div class="statusPersonal bd-bt p-10">
                        <c:if test="${sessionScope.Avt!=null}">
                            <img src="images/${sessionScope.Avt}" alt="avatar" class="avatar-icon icon--hover">

                        </c:if>
                        <c:if test="${sessionScope.Avt==null}">
                            <img src="images/defaultImage.png" alt="" class="avatar-icon icon--hover">
                        </c:if>
                        <div class="write-status" id="write-status">
                            <span>${sessionScope.TenTK} ơi, bạn đang nghĩ gì thế ?</span>
                        </div>
                    </div>
                    <div class="crestatus"  id="crestatus">

                        <div style="text-align: center; display: flex; justify-content: space-between; align-items: center ">
                            <h3></h3>
                            <h3 >Tạo Bài Viết</h3>  
                            <span id="exit" class="closeBtn icon--hover"><i class="fas fa-times"></i></span>
                        </div>
                        <div class="cre_tk">
                            <c:if test="${sessionScope.Avt!=null}">
                                <img src="images/${sessionScope.Avt}" alt="avatar" class="avatar-icon icon--hover">

                            </c:if>
                            <c:if test="${sessionScope.Avt==null}">
                                <img src="images/defaultImage.png" alt="" class="avatar-icon icon--hover">
                            </c:if>
                                <div class="tentk" ><span style="margin-left: 10px"><b>${sessionScope.TenTK}</b></span></div>
                        </div>
                        <form  method="POST" action="UpLoadStatusServlet" enctype="multipart/form-data"> 
                            <textarea  class="write-crestatus" name="content"  placeholder="${sessionScope.TenTK} ơi, bạn đang nghĩ gì thế?"></textarea>
                            <center><input class="input" required type="file" name="images" value="Hình Ảnh" placeholder="Hình Ảnh"></center>
                            <center><button class="btn_dang" style="border: none; outline: none">Đăng</button></center>
                        </form>
                    </div>
                    <div class="uploadStatus">
                        <div class="uploadStatus__item">
                            <i class="fas fa-video icon icon--red"></i>
                            <span class="mg-left-10">Video trực tiếp</span>
                        </div>
                        <div class="uploadStatus__item">
                            <div id="a">
                                <i class="fas fa-images icon icon--green"></i>
                                <span class="mg-left-10" >Ảnh/Video</span>
                            </div>

                        </div>

                        <div class="uploadStatus__item">
                            <i class="fas fa-laugh icon icon--yellow"></i>
                            <span class="mg-left-10">Cảm xúc/Hoạt động</span>
                        </div>
                    </div>
                </div>
                <c:forEach items="${liststatusfr}" var="lst">
                    <div class="container__center_item mg-top-10">

                        <div class="p-10">
                            <div class="statusPersonal__items">
                                <div class="statusPersonal__item">
                                    <img controls src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover">
                                    <div class="groupName">
                                        <span class="groupName__item__name">${lst.getFullName()}</span>
                                        <div class="groupName_item__time">${lst.getDateTimeUpload()}<i class="fas fa-globe-asia icon--s"></i></div>
                                    </div>
                                </div>
                                <div class="statusPersonal__item">
                                    <i class="fas fa-ellipsis-h icon--s"></i>
                                </div>
                            </div>

                            <p class="statusText">${lst.getStatusCaption()}</p>
                            <div class="">
                                <img src="images/${lst.getStatusImages()}" alt="" style="width: 100%;">

                            </div>
                            <div class="interactive mg-top-10">
                                <div class="groupInteraction">
                                    <div class="groupInteraction__item ">
                                        <i class="fas fa-thumbs-up icon--blue"></i>
                                        <!-- <i class="fas fa-heart icon--red"></i>
                                        <i class="fas fa-laugh-squint icon--yellow"></i>
                                        <i class="fas fa-angry icon--angry"></i> -->
                                    </div>
                                    <div class="groupInteraction__item mg-left-10">
                                        ${lst.getLikes()}
                                    </div>
                                </div>
                                <div class="groupInteraction">
                                    <div class="groupInteraction__item">
                                        20k
                                    </div>
                                    <div class="groupInteraction__item mg-left-5">
                                        bình luận
                                    </div>
                                    <div class="groupInteraction__item mg-left-10">
                                        1000
                                    </div>
                                    <div class="groupInteraction__item mg-left-5">
                                        lượt chia sẽ
                                    </div>
                                </div>
                            </div>
                            <div class="interactiveBtn mg-top-10 bd-bt">
                                <div class="interactiveBtn__item">
                                    <a href="InsertLikes?StatusID=${lst.getStatusID()}">
                                        <i class="far fa-thumbs-up icon--md ${lst.getLike()}" ></i>
                                        <span class="${lst.getLike()}">Thích</span>

                                    </a>

                                </div>
                                <div id="" onclick="CommentClick()" class="interactiveBtn__item commentAction">
                                    <i class="far fa-comment icon--md"></i>
                                    <span>Bình luận</span>
                                </div>
                                <div class="interactiveBtn__item">
                                    <i class="fas fa-share icon--md"></i>
                                    <span>Chia sẽ</span>
                                </div>
                            </div>
                            <div class="statusPersonal bd-bt p-10">
                                <c:if test="${sessionScope.Avt!=null}">
                                    <img src="images/${sessionScope.Avt}" alt="avatar" class="avatar-icon icon--hover">

                                </c:if>
                                <c:if test="${sessionScope.Avt==null}">
                                    <img src="images/defaultImage.png" alt="" class="avatar-icon icon--hover">
                                </c:if>
                                <input type="text" class="write-status" placeholder="Viết bình luận đi...">
                            </div>
                            <div id="" class="commentList hide comments bd-bt p-10  ">
                                <img src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover">
                                <div class="comments__item mg-left-10">
                                    <span class="name">Hien Ca</span>
                                    <div class="comment__detail">OMG, Nữ</div>
                                </div>
                            </div>
                        </div>

                    </div>
                </c:forEach>
            </div>

            <div class="container__right">
                <span class="text-bold">Sinh nhật</span>
                <div class="Birthday bd-bt p-10" style="padding-top:0 ;">
                    <div class="birthday__item mg-top-10">
                        <i class="fas fa-gift icon icon--blue"></i>
                        <div class="mg-left-10">
                            <span>Hôm nay là sinh nhật của</span>
                            <span class="text-bold">NYM.</span>
                        </div>
                    </div>
                </div>
                <div class="friendsActive">
                    <div class="friendsActive__head mg-top-10">
                        <div class="friendsActive__head_item text-bold">Người liên hệ</div>
                        <div class="friendsActive__head__item">
                            <i class="fas fa-video icon-w hover"></i>
                            <i class="fas fa-search icon-w hover"></i>
                            <i class="fas fa-ellipsis-h icon-w hover"></i>
                        </div>
                    </div>
                    <div class="friendsActive__head__body">
                        <div class="groupSearch mg-top-10">
                <form action="FindMess" Method="Post">
                    <input type="text" class="search " name="name" placeholder="Tìm kiếm trên Messenger">
                    <input type="submit" style="display:none;">
                </form>
            </div>
                        <c:forEach items = "${listfriend}" var="lf">
                            <form action="createchat" method="post">
                                <button class="friendsActive__head__body__item  mg-top-10" style="width:100%; border: 0;">
                                <div class="group__item">
                                    
                                    <img src="images/${lf.getAvt()}" alt="" class="avatar-icon icon--hover">
                                    <i class="fas fa-circle iconActive"></i>
                                    <input type="text" name="FUserID" value="${lf.getUserID()}" style="display:none"/>
                                </div>
                                <span class="mg-left-10 text-bold">${lf.getFullName()}</span>
                                </button>
                            </form>
                        </c:forEach>  
                       
                    </div>
                </div>

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
        <script type="text/javascript" src="Javascript/index.js"></script>
    </body>

</html>