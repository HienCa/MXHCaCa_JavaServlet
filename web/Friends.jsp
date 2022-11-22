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
        <link rel="stylesheet" href="style/Friends.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <title>CaCa</title>
    </head>

    <body>
        <div class="header">
            <div class="header__left">
                <img src="images/logocaca.jpg" class="avatar-icon" alt="alt"/>
                <span class="groupSearch">

                    <input type="text" class="search" placeholder="Tìm kiếm trên Facebook">
                </span>
            </div>
            <div class="header__center ">
                <a href="indexServlet" class="header__center__home">
                    <i class="fas fa-home-lg-alt icon icon--bg "></i>
                </a>
                <a href="Friends.jsp" class="header__center__home icon--blue">
                    <i class="fas fa-user-friends icon icon--bg "></i>
                </a>
                <a href="Watch.jsp" class="header__center__home">
                    <i class="fas fa-play icon icon--bg"></i>
                </a>
                <a href="" class="header__center__home">
                    <i class="fas fa-store icon icon--bg"></i>
                </a>
                <a href="" class="header__center__home">
                    <i class="fas fa-users icon icon--bg"></i>
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
                    <a href="GetInfoDetailServlet">
                        <c:if test="${u.getAvt() != null}">
                            <img src="images/${u.getAvt()}" alt="" class="avatar-icon icon--hover">

                        </c:if>
                        <c:if test="${u.getAvt()==null}">
                            <img src="images/defaultImage.png" alt="" class="avatar-icon icon--hover">

                        </c:if>
                    </a>
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
                <!--            <div class="groupSearch mg-top-10">
                                <input type="text" class="search " placeholder="Tìm kiếm trên Messenger">
                            </div>
                            <div class="statusPersonal__item mg-top-10">
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
        </div>
        <div class="container">
            <div class="container__left">
                <div class="container__left__item--head">
                    <h2 class="text-bold">Bạn bè</h2>
                    <div>
                        <i class="fas fa-cog icon--md icon--hover"></i>
                    </div>
                </div>
                <div class="container__left__item">
                    <i class="fas fa-user-friends icon-w icon--md icon--blue"></i>
                    Trang chủ
                </div>
                <div class="container__left__item">
                    <i class="fas fa-users  icon-w icon--md icon--blue"></i>
                    Lời mời kết bạn
                </div>
                <div class="container__left__item">
                    <i class="fas fa-user-plus icon--md icon-w"></i>
                    Gợi ý
                </div>
                <div class="container__left__item">
                    <i class="fas fa-address-book icon--md icon-w"></i>
                    Tất cả bạn bè
                </div>
                <div class="container__left__item">
                    <i class="fas fa-gifts icon--md icon-w"></i>
                    Sinh nhật
                </div>
                <div class="container__left__item">
                    <i class="fas fa-address-book icon--md icon-w"></i>
                    Danh sách tùy chỉnh
                </div>

            </div>

            <div class="container__center">
                <div class="container__center__head">
                    <h3 class="title">Lời mời kết bạn</h3>
                    <div class="acceptFriendGroup">
                        <c:forEach items="${listfriend}" var="lf">

                            <div class="acceptFriendGroup__item">
                                <img src="images/${lf.getAvt()}" alt="" class="avatar">
                                <div class="acceptFriendGroup__item__content">
                                    <div class="name">${lf.getFullName()}</div>
                                    <a href="XacNhanKBServlet?FUserID=${lf.getUserID()}"><button class="btn--accept">Xác nhận</button></a>
                                    <a href="XoaXacNhanKBServlet?FUserID=${lf.getUserID()}"><button class="btn--delete">Xóa</button></a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
                <div class="container__center__head mg-top-30">
                    <h3 class="title">Gợi ý kết bạn</h3>
                    <div class="friendSuggestionGrouP">
                        <c:forEach items="${listuser}" var="lu">
                            <div class="friendSuggestionGrouP__item">
                                <img src="images/${lu.getAvt()}" alt="" class="avatar">
                                <div class="name">${lu.getFullName()}</div>
                                <a href="ThemKBServlet?FUserID=${lu.getUserID()}"><button  class="btn--accept ${sessionScope.hien}">Thêm bạn bè</button></a>
                                <a href=""><button  class="btn--delete ${sessionScope.hien}">Xóa, gỡ bỏ</button></a>
                                <a href="XoaXacNhanKBServlet?FUserID=${lu.getUserID()}"><button  class="btn--delete ${sessionScope.hide}">Hủy</button></a>
                            </div>
                        </c:forEach>
                        <c:forEach items="${listusernf}" var="lunf">
                            <div class="friendSuggestionGrouP__item">
                                <img src="images/${lunf.getAvt()}" alt="" class="avatar">
                                <div class="name">${lunf.getFullName()}</div>
                                <a href="ThemKBServlet?FUserID=${lunf.getUserID()}"><button  class="btn--accept ${sessionScope.hide}">Thêm bạn bè</button></a>
                                <a href=""><button  class="btn--delete ${sessionScope.hide}">Xóa, gỡ bỏ</button></a>
                                <a href="XoaXacNhanKBServlet?FUserID=${lunf.getUserID()}"><button  class="btn--delete ${sessionScope.hien}">Hủy</button></a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <script type="text/javascript" src="Javascript/index.js"></script>

    </body>

</html>