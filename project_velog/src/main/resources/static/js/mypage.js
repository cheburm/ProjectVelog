const modify = document.querySelectorAll('.info_modify_box');
const info_save = document.querySelectorAll('.info_save_box');

const info_creative = document.querySelector('.top_info_creative');
const top_info = document.querySelector('.top_info');

const contents_box = document.querySelector('.contents_box');
const title_box_hidden = document.querySelectorAll('.title_box_hidden');
const inputs = document.querySelectorAll('input');
const user_id = document.querySelector('#id');

modify[0].onclick = () => {
    top_info.style.display  = 'none';
    info_creative.style.display = 'block';
   
}
 // var FormData = new FormData(form);

info_save[0].onclick = () => {
    info_creative.style.display = 'none';
    top_info.style.display = 'block';
    user_info.name = inputs[0].value;
    user_info.conmment = inputs[1].value;
    mypage_profile();
}

var user_info = {
   name : '',
   conmment: ''
}

function mypage_profile() {
   $.ajax({
      type: "patch",
      url : "/mypage/profile/" + user_id.value,
      data : JSON.stringify(user_info),
      contentType: "application/json;charset=UTF-8",
      dataType: "text",
      success: function(data) {
         if(data == '2' || data == '1'){
         alert('정보 수정 완료');
         } else {
            alert('회원 정보 수정 실패');
         }
      },
      error: function() {
         alert('비동기 처리 오류');
      }
   })
}

var user_username = {
   username : ''
}

modify[1].onclick = () => {
    contents_box.style.display = 'none';
    modify[1].style.display = 'none';
    title_box_hidden[0].style.display = 'block';
}

info_save[1].onclick = () => {
    modify[1].style.display = 'block';
    contents_box.style.display = 'block';
    title_box_hidden[0].style.display = 'none';
    user_username.username = inputs[2].value;
    mypage_username();
}

function mypage_username() {
   
   $.ajax({
      type: "patch",
      url: "/mypage/username/" + user_id.value,
      data: JSON.stringify(user_username),
      contentType: "application/json;charset=UTF-8",
      dataType: "text",
      success: function(data){
         alert(data);
      },
      error: function(){
         alert('비동기 처리 오류');
      }
   })
};

const social = document.querySelectorAll('icon_box input');

modify[2].onclick = () => {  
    modify[2].style.display = 'none';
    title_box_hidden[1].style.display = 'block';
}

info_save[2].onclick = () => {
    modify[2].style.display = 'block';
    title_box_hidden[1].style.display = 'none';
    
}


// 스위치 온오프 기능
const switch_off = document.querySelectorAll('.switch_off');
const switch_on = document.querySelectorAll('.switch_on');
const circle = document.querySelectorAll('.circle');

switch_off[0].onclick = () => {
    switch_off[0].style.background = '#12b886';
}

switch_off[1].onclick = () => {
    switch_off[1].style.background = '#12b886';
}

/* 회원 탈퇴 msg */
const info_out = document.querySelector('.info_out');
const so_container = document.querySelector('.so_container');
const cancel = document.querySelector('.cancel');
const sign_out = document.querySelector('.signout');
so_container.style.display = 'none';

info_out.onclick = () => {
    if(so_container.style.display == 'none'){
        so_container.style.display = 'block';
    } else {
        so_container.style.display == 'none'
    }
}

cancel.onclick = () => {
    so_container.style.display = 'none';
}

sign_out.onclick = () => {
   $.ajax({
      type: 'delete',
      url: '/mypage/delete/' + user_id.value,
      success: function(data){
         if(data == '1'){
         alert('회원 탈퇴 완료');
         location.replace('/logout');
         } else {
         alert('회원 탈퇴 오류');
         }
      },
      error: function(){
            alert('비동기 처리 오류');
      }
   })
}
