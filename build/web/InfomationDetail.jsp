<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" href="images/logocaca.jpg" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="style/style.css">
        <link rel="stylesheet" href="style/InfomationDetial.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <title>CaCa</title>
    </head>
    <!--298 246 thiếu $-->
    <body>
        <div class="header">
            <div class="header__left">
                <a href="indexServlet" class="header__center__home "><img src="images/logocaca.jpg" class="avatar-icon" alt="alt"/></a>
                <span class="groupSearch">

                    <input type="text" class="search" placeholder="Tìm kiếm trên Facebook">
                </span>
            </div>
            <div class="header__center ">
                <a href="indexServlet" class="header__center__home ">
                    <i class="fas fa-home-lg-alt icon icon--bg icon--blue hover"></i>
                </a>
                <a href="FriendsServlet" class="header__center__home">
                    <i class="fas fa-user-friends icon icon--bg  hover"></i>
                </a>
                <a href="Watch.jsp" class="header__center__home">
                    <i class="fas fa-play icon icon--bg  hover"></i>
                </a>
                <a href="" class="header__center__home">
                    <i class="fas fa-store icon icon--bg  hover"></i>
                </a>
                <a href="" class="header__center__home">
                    <i class="fas fa-users icon icon--bg  hover"></i>
                </a>
            </div>
            <div class="header__right">
                <span class="">
                    <i class="fas fa-th-list icon icon--p hover"></i>
                </span>
                <span id="messenger" onclick="ToggleMess()" class="messenger">
                    <i class="fab fa-facebook-messenger icon icon--p hover"></i>

                </span>
                <span id="notification" onclick="ToggleNoti()" class="notification">
                    <i class="fas fa-bell icon icon--p hover"></i>
                </span>
                <span class="">
                    <c:if test="${sessionScope.Avt!=null}">
                        <img src="images/${sessionScope.Avt}" alt="avatar" class="avatar-icon icon--hover">

                    </c:if>
                    <c:if test="${sessionScope.Avt==null}">
                        <img src="images/defaultImage.png" alt="" class="avatar-icon icon--hover">
                    </c:if>
                </span>
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
                </c:forEach>


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
        <div class="App">

            <div class="App__head">
                <div class="App__head__img GroupRelative pt-4">
                    <form action="ChangeCoverPhoto" method="post" enctype="multipart/form-data">
                        <label for="anhbia">
                            <c:if test="${sessionScope.Anhbia!=null}">
                                <img src="images/${sessionScope.Anhbia}" alt="avatar" class="personalAvatar__Main icon--hover">

                            </c:if>
                            <c:if test="${sessionScope.Anhbia==null}">
                                <img src="images/DefaultCoverPhoto.jpg" alt="" class="personalAvatar__Main icon--hover">
                            </c:if>

                            <span class="btnUpdateAbsolute hover">
                                <i class="fas fa-camera">

                                    <input  class="d-none" required id="anhbia" type="file" name="Anhbia" >

                                </i> Chỉnh sửa ảnh bìa<input type="submit" value="Thay đổi"/>

                            </span>
                        </label>
                    </form>

                </div>
                <div class="App__head__update">
                    <div class="App__head__update__item">
                        <div class="groupPersonal">
                            <span class="personalAvatar GroupRelative">
                                <form action="ChangeAvatar" method="post" enctype="multipart/form-data">
                                    <label for="avt">

                                        <c:if test="${sessionScope.Avt!=null}">
                                            <img src="images/${sessionScope.Avt}" alt="avatar" class="avatar icon--hover">

                                        </c:if>
                                        <c:if test="${sessionScope.Avt==null}">
                                            <img src="images/defaultImage.png" alt="" class="avatar icon--hover">
                                        </c:if>
                                        <!--                                        <img src="images/defaultImage.png" alt="" class=" icon--hover">-->
                                        <input  class="d-none" required id="avt" type="file" name="Avatar" >

                                    </label>
                                    <span class="iconAbsolutee" >
                                        <input type="submit"  class=" icon" value="c"/>
                                    </span>
                                </form>
                            </span>

                            <div class="groupPersonal__item">
                                <div class="text-large ">${sessionScope.TenTK}</div>
                                <div class="group__friendInfo mg-top-10">
                                    <span class="quantity">${SLFriend}</span> bạn bè
                                </div>

                                <div class="group__friendAvatar mg-top-10 GroupRelative">
                                    <c:forEach items="${listfriend}" var="lf">
                                        <img src="images/${lf.getAvt()}" alt="" class="avatar-icon icon--hover">

                                    </c:forEach>

                                    <c:if test="${SLFriend > 5}">

                                        <div class="avatar-icon icon--hover" style="padding:15px 0;"><center>+ ${SLFriend - 5}</center></div>

                                    </c:if>
                                </div>

                            </div>

                        </div>

                    </div>
                    <div class="App__head__update__item">
                        <span class="btn-addStory icon--hover">
                            <i class="fas fa-plus-circle "></i> Thêm vào tin
                        </span>
                        <span class="btn-updatePersonalPage icon--hover mg-left-10">
                            <i class="fas fa-pen"></i> Chỉnh sửa trang cá nhân
                        </span>
                    </div>
                </div>

                <div class="App__head__groupBtn mg-top-10">
                    <span class="btn__item btn-active">Bài viết</span>
                    <span class="btn__item mg-left-10">Giới Thiệu</span>
                    <span class="btn__item mg-left-10">Bạn bè</span>
                    <span class="btn__item mg-left-10">Ảnh</span>
                    <span class="btn__item mg-left-10">Video</span>
                    <span class="btn__item mg-left-10">Check in</span>
                    <span class="btn__item mg-left-10">Xem Thêm <i class="fas fa-caret-down"></i></span>
                </div>
            </div>

            <div class="App__content__main">
                <div class="App__content">
                    <div class="App__content__left">
                        <div class="Introduction">
                            <h2>Giới thiệu</h2>
                            <div class="Introduction__btn mg-top-10">Thêm tiểu sử</div>
                            <div class="Introduction__btn mg-top-10">Chỉnh sửa chi tiết</div>
                            <div class="Introduction__btn mg-top-10">Thêm sở thích</div>
                            <div class="Introduction__btn mg-top-10">Thêm nội dung đáng chú ý</div>
                        </div>
                        <div class="ImageList mg-top-10">
                            <div class="ImageList__head">
                                <h2>Ảnh</h2>
                                <span class="viewAll icon--blue">Xem tất cả</span>
                            </div>
                            <div class="ImageList__body mg-top-10">
                                <img src="images/s.jfif" alt="" class="ImageList__body__item icon--hover">
                                <img src="images/aa.jfif" alt="" class="ImageList__body__item icon--hover">
                                <img src="images/pppp.jfif" alt="" class="ImageList__body__item icon--hover">
                                <img src="images/ssssssssss.jfif" alt="" class="ImageList__body__item icon--hover">
                                <img src="images/ppppppp.jfif" alt="" class="ImageList__body__item icon--hover">
                                <img src="images/p.jfif" alt="" class="ImageList__body__item icon--hover">

                            </div>
                        </div>
                        <div class="Friends mg-top-10">
                            <div class="Friend__head">
                                <h2>Bạn bè</h2>
                                <span class="viewAlL icon--blue">Xem tất cả bạn bè</span>
                            </div>
                            <div class="mg-top-10">
                                <span class="quantity">${SLFriend}</span>
                                người bạn
                            </div>
                            <div class="Friend__body">
                                <c:forEach items="${listfriend}" var="lf">
                                    <div class="Friend__body__item">
                                        <img src="images/${lf.getAvt()}" alt=""
                                             class="friend__img ImageList__body__item icon--hover">
                                        <p class="">${lf.getFullName()}</p>
                                    </div>
                                </c:forEach>
                                <c:if test="${SLFriend > 5}">
                                    <div class="Friend__body__item"> 
                                        <img src="images/plus.jpg" alt="" class="friend__img ImageList__body__item icon--hover"> 
                                        <p class="">${SLFriend - 5} Bạn Bè</p>
                                    </div> 
                                </c:if>

                            </div>
                        </div>
                    </div>

                    <div class="App__content__right mg-left-20">
                        <div class="App__content__right__item">
                            <div class="statusPersonal bd-bt p-10">
                                <c:if test="${sessionScope.Avt!=null}">
                                    <img src="images/${sessionScope.Avt}" alt="avatar" class="avatar-icon icon--hover">

                                </c:if>
                                <c:if test="${sessionScope.Avt==null}">
                                    <img src="images/defaultImage.png" alt="" class="avatar-icon icon--hover">
                                </c:if>
                                <div class="write-status" id="w-status">
                                    <span>${sessionScope.TenTK} ơi, bạn đang nghĩ gì thế ?</span>
                                </div>
                            </div>
                            <div class="crestatus"  id="crestatus">

                                <div style="text-align: center; ">
                                    <h3 >Tạo Bài Viết</h3>    
                                </div>
                                <div class="cre_tk">
                                    <img src="images/${sessionScope.Avt}" alt="" class="avatar-icon">
                                    <div class="tentk"><span><b>${sessionScope.TenTK}</b></span></div>
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
                                    <i class="fas fa-images icon icon--green"></i>
                                    <span class="mg-left-10">Ảnh/Video</span>

                                </div>
                                <div class="uploadStatus__item">
                                    <i class="fas fa-flag icon icon--blue"></i>
                                    <span class="mg-left-10">Sự kiện trong đời</span>
                                </div>
                            </div>
                        </div>

                        <div class="App__content__right__item mg-top-10">
                            <div class="App__content__right__item__head bd__bottom bd-bottom">
                                <h2 class="">Bài viết</h2>
                                <div class="group__item">
                                    <span class="btn__item">
                                        <i class="fas fa-sliders-h"></i> Bộ lọc
                                    </span>
                                    <span class="btn__item">
                                        <i class="fas fa-cog"></i> Quản lý bài viết
                                    </span>
                                </div>

                            </div>
                            <div class="App__content__right__item__head">
                                <span class="btn__item">
                                    <i class="fas fa-bars"></i> Xem theo danh sách
                                </span>
                                <span class="btn__item">
                                    <i class="fas fa-th"></i> Chế độ xem lưới
                                </span>
                            </div>
                        </div>




                        <c:forEach items="${liststatus}" var="ls">
                            <div class="container__center_item mg-top-10">
                                <div class="p-10">
                                    <div class="statusPersonal__items">
                                        <div class="statusPersonal__item">
                                            <img src="images/${sessionScope.Avt}" alt="" class="avatar-icon icon--hover">
                                            <div class="groupName">
                                                <span class="groupName__item__name">${sessionScope.TenTK}</span>
                                                <div class="groupName_item__time">${ls.getDateTimeUpload()}<i
                                                        class="fas fa-globe-asia icon--s"></i></div>
                                            </div>
                                        </div>
                                        <div class="statusPersonal__item">
                                            <i class="fas fa-ellipsis-h icon--s"></i>
                                        </div>
                                    </div>

                                    <p class="statusText">${ls.getStatusCaption()}</p>
                                    <div class="">
                                        <img src="images/${ls.getStatusImages()}" alt="" style="width: 100%;">

                                    </div>
                                    <div class="interactive mg-top-10">
                                        <div class="groupInteraction">
                                            <div class="groupInteraction__item">
                                                <i class="fas fa-thumbs-up icon--blue"></i>
                                                <i class="fas fa-heart icon--red"></i>

                                            </div>
                                            <div class="groupInteraction__item mg-left-10">
                                                ${ls.getLikes()}
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
                                            <a href="InsertLikes?StatusID=${ls.getStatusID()}">




                                                <i class="far fa-thumbs-up icon--md ${ls.getLike()}" ></i>
                                                <span class="${ls.getLike()}">Thích</span>

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
                                        <img src="images/${sessionScope.Avt}" alt="" class="avatar-icon icon--hover">
                                        <input type="text" class="write-status" placeholder="Viết bình luận đi...">
                                    </div>
                                    <div id="" class="commentList hide comments bd-bt p-10  ">
                                        <img src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover">
                                        <div class="comments__item mg-left-10">
                                            <span class="name">Hien Ca</span>
                                            <div class="comment__detail">Một mình anh trong đêm thâu</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>


        </div>
        <div class=" text-center d-none" style="position:fixed;
             width:100%;
             height:100vh;
             left:0;
             top:0;
             overflow-y: scroll;
             background-color: rgb(228, 230, 235);
             opacity: 0.8;
             ">
            <div class="w-50  rounded pb-4">
                <form action="" method="">
                    <div class="d-flex justify-content-between align-items-center p-3">
                        <h4></h4>
                        <h4>Chỉnh sửa trang cá nhân</h4>
                        <span class=""><i class="fas fa-times"></i></span>
                    </div>
                    <div class="p-3">
                        <div class="">
                            <h5>Họ tên</h5>
                            <div class="text-center">
                                <input type="text" class="p-3 bg-light border-0 w-50" placeholder="Nhập họ tên...">

                            </div>
                        </div>
                        <div class="mt-4">
                            <h5>Ảnh đại diện</h5>
                            <div class="text-center">
                                <img src="images/${sessionScope.Avt}" style="border-radius:50%; width: 400px;height: 400px;"
                                     class="" alt="">
                                <input type="file" name="avt" placeholder="Chọn ảnh">
                            </div>
                        </div>
                        <div class="mt-4">
                            <h5>Ảnh bìa</h5>
                            <div class="text-center">
                                <img src="images/${sessionScope.AnhBia}" style="border-radius:50%; width: 400px;height: 400px;"
                                     class="" alt="">
                                <input type="file" name="anhbia" placeholder="Đổi ảnh">

                            </div>

                        </div>
                        <div class="mt-4">
                            <h5>Email</h5>
                            <div class="text-center">
                                <input type="email" class="p-3 bg-light border-0 w-50" placeholder="Nhập Email thường dùng">
                            </div>
                            <div class="mt-4">
                                <h5>Mật khẩu</h5>
                                <div class="text-center">
                                    <input type="text" class="p-3 bg-light border-0 w-50" placeholder="Nhập mật khẩu mới">
                                </div>

                            </div>
                            <div class="mt-4">
                                <h5>Quê quán</h5>
                                <div class="text-center">
                                    <input type="text" class="p-3 bg-light border-0 w-50" placeholder="Nhập quê quán">

                                </div>
                            </div>
                            <div class="mt-4">
                                <h5>Trường học</h5>
                                <div class="text-center">
                                    <input type="text" class="p-3 bg-light border-0 w-50" placeholder="Nhập trường học">

                                </div>
                            </div>
                            <div class="mt-4">
                                <h5>Tình trạng mối quan hệ</h5>
                                <div class="text-center">
                                    <input type="text" class="p-3 bg-light border-0 w-50"
                                           placeholder="Nhập tình trạng mối quan hệ">

                                </div>
                            </div>
                            <div class="mt-4">
                                <h5>Sở thích</h5>
                                <div class="text-center">
                                    <input type="text" class="p-3 bg-light border-0 w-50" placeholder="Nhập sở thích">

                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="text-center mt-4">
                        <input type="submit" class="w-25 p-2 btn btn-primary" value="Cập nhật">
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
        <script type="text/javascript" src="Javascript/index.js"></script>
    </body>

</html>