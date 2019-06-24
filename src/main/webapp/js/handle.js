function testJson(){

    var username = $("#username").val();
    var pwd = $("#pwd").val();
    var ver = $("#verifyCode").val();
    console.log(username,pwd,ver);
    var urls = "/logins?userName="+username+"&userPwd="+pwd+"&verifiCode="+ver;
    $.ajax({
        url:urls,
        contentType:"application/json;charset=utf-8",

        success:function(data){
            if(data=="1"){
                console.log(132132);
                console.log(document.referrer);
                var Oldurl = document.referrer;
                console.log(Oldurl);
                if(Oldurl != "http://localhost:8080/jsp/register.jsp"){
                    window.location.href = document.referrer;

                }else {
                    window.location.href ="../jsp/index.jsp" ;
                }

            }
            else if(data == "2"){
                alert("验证码错误");
                window.location.href = "../jsp/login.jsp";
                $('#verifyCodeImage').attr('src', "${pageContext.request.contextPath }/getVerifyCode"+'?t='+new Date().getTime()).show();
            }
            else{
                alert("密码或用户名错误");
                window.location.href = "../jsp/login.jsp";
            }
        }
    })

}
function changeImage() {
    $('#verifyCodeImage').attr('src', "/getVerifyCode"+'?t='+new Date().getTime()).show();
}
