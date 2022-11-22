const messenger = document.getElementById('messenger');
const notification = document.getElementById('notification');
const messengerBox = document.getElementById('messengerBox');
const notificationBox = document.getElementById('notificationBox');

const commentAction = document.getElementsByClassName('commentAction');
const commentList = document.getElementsByClassName('commentList');

function CommentClick(){
    for (i = 0; i < commentAction.length; i++) {
        if (commentList[i].classList.contains("hide")) {
            commentList[i].classList.remove("hide");
            
        }
        else {
            commentList[i].classList.add("hide");
            
        }
    }
    
}



function ToggleMess() {
    if (messengerBox.classList.contains("hide")) {
        messengerBox.classList.remove("hide");
        if (!notificationBox.classList.contains("hide")) {
            notificationBox.classList.add("hide");
        }
    }
    else {
        messengerBox.classList.add("hide");
        if (!notificationBox.classList.contains("hide")) {
            notificationBox.classList.add("hide");
        }
    }
}
function checkClick() {
   if (cn.classList.contains("at")) {
      cn.classList.remove("at");
   }
   else {
      cn.classList.add("at");
   }
}


var avt = document.getElementById("avt");
var cn = document.getElementById("box");
avt.addEventListener("click", checkClick);

function check_Click() {
   if (crestatus.classList.contains("act")) {
      crestatus.classList.remove("act");
   }
   else {
      crestatus.classList.add("act");
   }
}


var write_status = document.getElementById("write-status");
var crestatus = document.getElementById("crestatus");
write_status.addEventListener("click", check_Click);
var exit = document.getElementById("exit");
exit.addEventListener("click", check_Click);

function Check_C() {
   if (crestatus.classList.contains("act")) {
      crestatus.classList.remove("act");
   }
   else {
      crestatus.classList.add("act");
   }
}


var a = document.getElementById("a");
var crestatus = document.getElementById("crestatus");
a.addEventListener("click", Check_C);


function Check() {
   if (cstatus.classList.contains("acti")) {
      cstatus.classList.remove("acti");
   }
   else {
      cstatus.classList.add("acti");
   }
}


var w_status = document.getElementById("w-status");
var cstatus = document.getElementById("cstatus");
w_status.addEventListener("click", Check);
var exit = document.getElementById("exit");
exit.addEventListener("click", Check);

function ToggleNoti() {
    if (notificationBox.classList.contains("hide")) {
        if (!messengerBox.classList.contains("hide")) {
            messengerBox.classList.add("hide");
        }
        notificationBox.classList.remove("hide");
    }
    else {
        if (!messengerBox.classList.contains("hide")) {
            messengerBox.classList.add("hide");
        }
        notificationBox.classList.add("hide");
    }
}


