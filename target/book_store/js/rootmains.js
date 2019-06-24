
//
// var tab = document.getElementById("tts");
// if (null != tab) {
//     tab.onchange = function () {
//         alert(123);
//         var index = tab.selectedIndex;
//         var value = tab.options[index].value;
//         console.log(value);
//         alert(value);
//         value = parseInt(value)
//         var findUrl = "/finduser?x=" + value;
//         $.ajax({
//             url: findUrl,
//             type: "post",
//             contentType: "application/json;charset=utf-8",
//             success: function (data) {
//                 window.location.href = data;
//             }
//         })
//
//     }
//
// }
// else{
// alert(123123);
// }
//搜索书
function searchs(){
    var name= $("#name").val();
    var str = encodeURI(name);
    var urls ="/searchs?name="+str;
    $.ajax({
        url:urls,
        type:"get",
        contentType:"application/json;charset=utf-8",
        success:function(data){
            if (data!=null){
                window.location.href = data;
            }
            else{
                alert("没有找到，请重新输入");
            }
        }
    });
}

//查找书本
function findBooks() {
    var  btnVal = $("#find").val();
    var findUrl = "/findbook";
    $.ajax({
        url:findUrl,
        type:"post",
        contentType:"application/json;charset=utf-8",
        success:function(data){
            window.location.href =data;
        }
    })
}
//删除书
function delBooks(id) {

    if(confirm('确定删除吗')){
        var delUrl = "/delBook?id="+id;
        $.ajax({
            url:delUrl,
            type:"post",
            contentType:"application/json;charset=utf-8",
            success:function(data){
                alert("删除成功");
                window.location.href = data;
            }
        })
    }else{
        window.location.href = document.referrer;
    }

}
//更新书本
function updateBooks(is) {
    var updateUrl = "/updateBooks?bookId="+is;
    $.ajax({
        url:updateUrl,
        type:"post",
        contentType:"application/json;charset=utf-8",
        success:function(data){
            window.location.href = data;

        }
    })
}

function toIndex() {
    window.location.href = "../jsp/addbook.jsp";
}
function toIndex1() {
    window.location.href = "../librarys/insertIndex1.jsp";
}



//删除书
function delusers(id) {
    var delUrl = "/deluser?id="+id;
    $.ajax({
        url:delUrl,
        type:"post",
        contentType:"application/json;charset=utf-8",
        success:function(data){
            alert("删除成功");
            window.location.href = "../librarys/rootmain.jsp";
        }
    })
}


var t = document.getElementById("ttts");
if (null!=t){
    t.onchange=function() {
        var index = t.selectedIndex;
        var value = t.options[index].value;
        value = parseInt(value);
        console.log(value);
        var findUrl = "/findbook?x=" + value;
          $.ajax({
              url: findUrl,
              type: "post",
              contentType: "application/json;charset=utf-8",
              success: function (data) {
                  var num = data.split('=')[1];
                  t.options[index].value = num;
                  window.location.href = data;
              }
          })
    }
}

    $(".tabbs").mouseenter(function () {

        var x = $(this).attr("id");
        var tab = document.getElementById(x);
        var rows = tab.getElementsByTagName("tr");
        for (var i = 0; i < rows.length; i++) {
            rows[i].onmouseover = function () {
                this.style.color = "yellow";

            };
            rows[i].onmouseout = function () {
                this.style.color = "";
            };
        }


    })
// changeTabColor("table2")
// changeTabColor("tab2");
// changeTabColor("tab1");

