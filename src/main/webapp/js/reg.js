function checkUserName() {

    var value = document.getElementById("username").value;

    document.getElementById("checkStatus").innerText = "测试";

    if (!value || !value.match(/^[A-Za-z0-9]+$/))//只处验证不能为空并且只能为英文或者数字或者下划线组成的２－１５个字符
    {
        $("#checkStatus").html("用户名不能为空且只能为英文或者数字");
    }
    else {
        $("#checkStatus").html("正在验证用户名...");

        var dataString = 'username=' + value;

        // Sends ajax request to check the name is available or not.
        $.ajax({
            type: "POST",
            url: "checkUserName",
            data: dataString,
            success: function (json) {

                // When the checking completed, then loaded corresponding css style.
                $('#checkStatus').ajaxComplete(function (event, request, settings) {
                    if (json.status == 0) {
                        $('#checkStatus').html('OK');
                        return true;
                    }
                    else {
                        $('#checkStatus').html('用户名已经存在');
                        document.getElementById("username").setValue = "";
                        return false;
                    }
                });
            }
        });
    }
}

function register() {
    var username = document.getElementById("username").value;
    var pwd = document.getElementById("pwd").value;
    var repwd = document.getElementById("repwd").value;

    if ("" == username || null == username) {
        alert("用户名不能为空");
    }

    if (pwd != repwd) {
        document.getElementById("trm").innerText = "输入密码不一致，请重新输入";
    }

    if (pwd == repwd)
        var jsonData = {username: username, pwd: hex_md5(pwd)};
    var json = JSON.stringify(jsonData);
    alert(json);
    $.ajax({
        type: "POST",
        url: "register",
        data: json,
        success: function (data) {
            if (data == "success") {
                alert("注册成功!");
                location.href = "/private/mainView.jsp";
            } else {
                document.getElementById("registError").innerHTML = "注册失败，请重新注册";
            }
        }
    });
}