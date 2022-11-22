<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" href="images/nvhh.jpg" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/style.css">
        <link rel="stylesheet" href="style/Friends.css">
        <link rel="stylesheet" href="style/Watch.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <title>Facebook</title>
    </head>

    <body>
        <div class="header">
            <div class="header__left">
                <a href="indexServlet" class="header__center__home "><img src="images/logocaca.jpg" class="avatar-icon" alt="alt"/></a>
                <span class="groupSearch">
                    <i class="fas fa-search icon--md icon--hover mg-left-10"></i>
                </span>
            </div>
            <div class="header__center ">
                <a href="indexServlet" class="header__center__home ">
                    <i class="fas fa-home-lg-alt icon icon--bg  hover"></i>
                </a>
                <a href="FriendsServlet" class="header__center__home">
                    <i class="fas fa-user-friends icon icon--bg  hover"></i>
                </a>
                <a href="Watch.jsp" class="header__center__home">
                    <i class="fas fa-play icon icon--bg icon--blue hover"></i>
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
                    <img src="images/${sessionScope.Avt}" alt="" class="avatar-icon icon--hover">
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
            <div class="groupSearch mg-top-10">
                <input type="text" class="search " placeholder="Tìm kiếm trên Messenger">
            </div>
            <c:forEach items="${listChat}" var="lc">
                <div class="statusPersonal__item mg-top-10">
                    <img src="images/${lc.getFriend().getAvt()}" alt="avatar" class="avatar-icon icon--hover">
                    <div class="groupName">
                        <span class="groupName__item__name icon--red">
                            ${lc.getConversation().getConversationName()} </span>
                        <div class="groupName_item__time">
                            <span class="name icon--blue">${lc.getFriend().getFullName()}</span>
                            <span class="mg-left-10px text-light">Haizz mệt mỏi quá đi...</span>
                        </div>

                    </div>
                    <i class="fas fa-bell-slash icon-w iconAbsoluteActiveMess icon--md icon--gray"></i>
                </div>
            </c:forEach>
            <!--        <div class="statusPersonal__item mg-top-10">
                        <img src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover">
                        <div class="groupName">
                            <span class="groupName__item__name icon--red">
                                Cưới Vợ Giàu Group </span>
                            <div class="groupName_item__time">
                                <span class="name icon--blue">Hien:</span>
                                <span class="mg-left-10px text-light">Haizz mệt mỏi quá đi...</span>
                            </div>
            
                        </div>
                        <i class="fas fa-bell-slash icon-w iconAbsoluteActiveMess icon--md icon--gray"></i>
                    </div>
            
                    <div class="statusPersonal__item mg-top-10">
                        <img src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover">
                        <div class="groupName">
                            <span class="groupName__item__name text--light">
                                Văn Hiền </span>
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
                <div class="container__left__item--head">
                    <h2 class="text-bold">Watch</h2>
                    <div>
                        <i class="fas fa-cog icon--md icon--hover"></i>
                    </div>
                </div>
                <div class="groupSearch">
                    <input type="text" class="search " placeholder="Tìm kiếm video">
                </div>
                <div class="container__left__item mg-top-10">
                    <a href="index.jsp">
                        <i class="fas fa-user-friends icon-w icon--md icon--blue"></i>
                        Trang chủ
                    </a>
                </div>
                <div class="container__left__item">
                    <i class="fas fa-video icon-w icon--md"></i>
                    Trực tiếp
                </div>
                <div class="container__left__item">
                    <i class="fas fa-tv icon-w icon--md"></i>
                    Chương Trình
                </div>
                <div class="container__left__item">
                    <i class="fas fa-bookmark icon-w icon--md "></i>
                    Video đã lưu
                </div>

            </div>

            <div class="container__center" style="padding-bottom: 20px">
                <div class="container__center__head">
                    <div class="">
                        <div class="container__center__head__content">
                            <div class="container__content">
                                <img src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover">
                                <div class="groupName">
                                    <span class="groupName__item__name">Văn Hiền</span> <span
                                        class="text--blue mg-left-10 icon--hover">Theo dõi</span>
                                    <div class="groupName_item__time">11 giờ <i class="fas fa-globe-asia icon--s"></i></div>
                                </div>
                            </div>
                            <div class="dot"><i class="fas fa-ellipsis-h"></i></div>
                        </div>
                        <p class="title">Hôm nay Hien Ca đang vui...</p>
                    </div>
                    <div class="container__center__head__content">
                        <video width="100%" height="500px" controls>
                            <source src="videos/dongtien.mp4" type="video/ogg">
                        </video>
                    </div>
                    <div class="groupBtn mg-top-10">
                        <div class="groupBtn__content">
                            <div class="groupBtn__item__left">
                                <i class="far fa-thumbs-up icon--md"></i> Thích
                            </div>
                            <div class="groupBtn__item__left">
                                <i class="far fa-comment-alt icon--md"></i></i> Bình luận
                            </div>
                            <div class="groupBtn__item__left">
                                <i class="fas fa-share-square icon--md"></i> Chia sẻ
                            </div>
                        </div>
                        <div class="groupBtn__content">
                            <div class="groupBtn__item">
                                <i class="fas fa-thumbs-up icon--blue"></i></i> 21k
                            </div>
                            <div class="groupBtn__item">
                                <span>2000</span><span class="mg-left-10">bình luận</span>
                            </div>
                            <div class="groupBtn__item">
                                <span>890k</span><span class="mg-left-10">lượt xem</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container__center__head mg-top-30">
                    <div class="">
                        <div class="container__center__head__content">
                            <div class="container__content">
                                <img src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover">
                                <div class="groupName">
                                    <span class="groupName__item__name">Văn Hiền</span> <span
                                        class="text--blue mg-left-10 icon--hover">Theo dõi</span>
                                    <div class="groupName_item__time">11 giờ <i class="fas fa-globe-asia icon--s"></i></div>
                                </div>
                            </div>
                            <div class="dot"><i class="fas fa-ellipsis-h"></i></div>
                        </div>
                        <p class="title">Hôm nay Hien Ca đang vui...</p>
                    </div>
                    <div class="container__center__head__content">
                        <video width="100%" height="500px" controls>
                            <source src="videos/anhbuongtayroido.mp4" type="video/mp4">
                            <source src="videos/dongtien.mp4" type="video/ogg">

                        </video>
                    </div>
                    <div class="groupBtn mg-top-10">
                        <div class="groupBtn__content">
                            <div class="groupBtn__item__left">
                                <i class="far fa-thumbs-up icon--md"></i> Thích
                            </div>
                            <div class="groupBtn__item__left">
                                <i class="far fa-comment-alt icon--md"></i></i> Bình luận
                            </div>
                            <div class="groupBtn__item__left">
                                <i class="fas fa-share-square icon--md"></i> Chia sẻ
                            </div>
                        </div>
                        <div class="groupBtn__content">
                            <div class="groupBtn__item">
                                <i class="fas fa-thumbs-up icon--blue"></i></i> 21k
                            </div>
                            <div class="groupBtn__item">
                                <span>2000</span><span class="mg-left-10">bình luận</span>
                            </div>
                            <div class="groupBtn__item">
                                <span>890k</span><span class="mg-left-10">lượt xem</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container__center__head mg-top-30">
                    <div class="">
                        <div class="container__center__head__content">
                            <div class="container__content">
                                <img src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover">
                                <div class="groupName">
                                    <span class="groupName__item__name">Văn Hiền</span> <span
                                        class="text--blue mg-left-10 icon--hover">Theo dõi</span>
                                    <div class="groupName_item__time">11 giờ <i class="fas fa-globe-asia icon--s"></i></div>
                                </div>
                            </div>
                            <div class="dot"><i class="fas fa-ellipsis-h"></i></div>
                        </div>
                        <p class="title">Hôm nay Hien Ca đang vui...</p>
                    </div>
                    <div class="container__center__head__content">
                        <img style="height: 600px;" src="images/nvhh.jpg" alt="">
                    </div>
                    <div class="groupBtn mg-top-10">
                        <div class="groupBtn__content">
                            <div class="groupBtn__item__left">
                                <i class="far fa-thumbs-up icon--md"></i> Thích
                            </div>
                            <div class="groupBtn__item__left">
                                <i class="far fa-comment-alt icon--md"></i></i> Bình luận
                            </div>
                            <div class="groupBtn__item__left">
                                <i class="fas fa-share-square icon--md"></i> Chia sẻ
                            </div>
                        </div>
                        <div class="groupBtn__content">
                            <div class="groupBtn__item">
                                <i class="fas fa-thumbs-up icon--blue"></i></i> 21k
                            </div>
                            <div class="groupBtn__item">
                                <span>2000</span><span class="mg-left-10">bình luận</span>
                            </div>
                            <div class="groupBtn__item">
                                <span>890k</span><span class="mg-left-10">lượt xem</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container__center__head">
                    <div class="">
                        <div class="container__center__head__content">
                            <div class="container__content">
                                <img src="images/nvhh.jpg" alt="" class="avatar-icon icon--hover">
                                <div class="groupName">
                                    <span class="groupName__item__name">Văn Hiền</span> <span
                                        class="text--blue mg-left-10 icon--hover">Theo dõi</span>
                                    <div class="groupName_item__time">11 giờ <i class="fas fa-globe-asia icon--s"></i></div>
                                </div>
                            </div>
                            <div class="dot"><i class="fas fa-ellipsis-h"></i></div>
                        </div>
                        <p class="title">Hôm nay Hien Ca đang vui...</p>
                    </div>
                    <div class="container__center__head__content">
                        <video width="100%" height="500px" controls>
                            <source src="videos/tontrong.mp4" type="video/mp4">
                            <source src="videos/dongtien.mp4" type="video/ogg">

                        </video>
                    </div>
                    <div class="groupBtn mg-top-10">
                        <div class="groupBtn__content">
                            <div class="groupBtn__item__left">
                                <i class="far fa-thumbs-up icon--md"></i> Thích
                            </div>
                            <div class="groupBtn__item__left">
                                <i class="far fa-comment-alt icon--md"></i></i> Bình luận
                            </div>
                            <div class="groupBtn__item__left">
                                <i class="fas fa-share-square icon--md"></i> Chia sẻ
                            </div>
                        </div>
                        <div class="groupBtn__content">
                            <div class="groupBtn__item">
                                <i class="fas fa-thumbs-up icon--blue"></i></i> 21k
                            </div>
                            <div class="groupBtn__item">
                                <span>2000</span><span class="mg-left-10">bình luận</span>
                            </div>
                            <div class="groupBtn__item">
                                <span>890k</span><span class="mg-left-10">lượt xem</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript" src="Javascript/index.js"></script>

    </body>

</html>