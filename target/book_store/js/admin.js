function login(){
    var username = $("#username").val();
    var pwd = $("#pwd").val();
    console.log(username,pwd);
    var urls = "/adminlogins?userName="+username+"&userPwd="+pwd;
    $.ajax({
        url:urls,
        contentType:"application/json;charset=utf-8",
        success:function(data){
            if(data==1){
                window.location.href = "../jsp/admin.jsp";
            }
            else{
                alert("密码或用户名错误");
                window.location.href = "../jsp/adminlogin.jsp";
            }
        }
    })

}
function changeImage() {

    $('#verifyCodeImage').attr('src', "/getVerifyCode"+'?t='+new Date().getTime()).show();

}
