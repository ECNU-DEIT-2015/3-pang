# 产品创意
>你们需要在这里描述你们的产品创意的过程，包括你们的灵感来源，针对什么人群来设计这个产品，你们设计了哪些功能？一开始做的原型的样子（需要附图，要用markdown插入你的图片，关于图片可以在github中使用修改此文档的方式直接上传）  

>灵感来源：我们每个人从小学到现在，上过无数的课，而在课堂上课过程中，部分教师难以把控上课时间，可能会导致压堂、内容讲不完，从而耽误教学进度，这种情况既耽误了教师正常完成教学进度，也导致学生下课晚，无形中增加了每堂课的认知负荷。“课堂时间轴”是一款PC端的教学安排工具，教师登录后可以添加课程，并以分钟为单位，为每节课程安排好教学进度。

>针对人群：一线教师、在校学生。

>
设计功能：
>1.登录：为简化设计，这里只设计了登录功能，而暂未设计注册功能。由系统管理员事先在数据库中录入了用户名和密码，用户只需登录即可。

>2.添加课程：教师可以根据自己的实际情况，在系统中为自己添加课程，需要输入课程名称即可，系统默认为18周的课程。将课程新建好，点击确定后即可在数据库中添加好课程，进而为每周的课程设置进度规划。

>3.课程进度规划：教师从添加课程界面点击到某一周后，即可跳入该周课程进度安排规划界面。在此界面中，教师点击添加记录功能即可插入一条新数据，最多可插入4条，每条数据包含开始时间、结束时间、具体安排规划内容，点击确认按钮后即可保存，并存入数据库中。

>你在创意阶段所做的贡献是什么？
>我在创意阶段的贡献：与组员商讨系统功能，并根据设计的功能去查找类似网站与工具，根据它们的功能来修改我们现有的功能设计。
>*此部分每组同学之间可以有相同的内容*，总字数不能少于1000字。  

## 创意
> 由于日常生活中同学们总是抱怨一些老师压堂，而询问老师的时候，老师也表示控制不好时间，故做此项目。 

## 需求
>教师利用“课堂时间轴”工具将自己的教学安排写在系统内，便于时刻查看和共享给同学们，后续系统会加上诸如上课记时、到时提醒、压堂数据记录与分析等等功能。 

## 设计的功能列表以及其完成情况

 设计的功能|承担该功能的组员|任务完成度
 --|--|--
  登陆|苏颖晞|100%
  添加课程界面搭建＋页面加载部分程序|于潇雪|100%
  添加时间安排界面搭建＋课程添加部分程序|姜宇轩|100%

# 产品技术方案
> 描述你们的产品创意的技术思路，服务器端如何，客户端如何。不少于500字,可以配图描述，不允许粘贴复制网络资源，需要自己描述。
> **此部分每组同学之间不能相同**，你需要展现自己的理解。  

>产品技术方案（苏颖晞）
>登录界面搭建：登录界面前端分成两层，一层是后面的背景，也是由html＋css写的，通过css设置不同的颜色，表现出背景蒙板的效果；另一层是前面的登陆框，主要由用户名、密码输入框、登录按钮组成，因为默认的用户名密码登陆框带有默认样式，所以在css里要去掉默认样式，并设置成我们的透明样式。同时由于用户名和密码的label不好找同样的字体，就以截图添加图片的方式将图片作为用户名和密码的文字label。

>登录客户端和服务器端程序：在客户端点击登录按钮后，进入相应按钮点击事件中，在点击事件绑定的函数中，首先获取用户名和密码，作为参数通过指定route，打包成json格式的字符串，传递给服务器端。服务器端程序在接收到以后，会将字符串编码为json数据包，获取其中的username和password属性值，通过SELECT语句在数据库中进行查询和匹配，如果用户名密码匹配成功，则返回errorcode为0，否则为1，同样打包为json格式字符串，返回给客户端。客户端在收到返回数据后，如果errorcode为0，则把用户名（也就是数据库里的教师id）存入cookie，然后跳转到教师添加课程界面，否则弹出框“用户密码错误！”。



# 我在小组中的分工
>你在小组中主要负责那部分工作，如果小组其他成员相比，你感觉你完成的怎么样？你觉得你组那个组员完成的最好，工作量最大？如果按10分计算，
你给每个人（包括自己）各多少分，填写下表：
  
   组员|分数
 --|--
  姜宇轩|9
  于潇雪|9
  苏颖晞|9

# 我的编程实践活动
## 我的代码
>采用markdown 中代码标记来粘贴你完成的那些代码。  比如：
  
```dart
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/login.css" />
    <script type="application/dart" src="dart/login.dart"></script>
    <script type="application/dart" src="../bin/main.dart"></script>
</head>
<body>
<div class="title">
    <label>
        课堂时间轴
    </label>
</div>

<div class="mainbody">

    <!---changed by jyx at 2017.12.28--->
    <div class="class1">
        <div class="left-div">

        </div>
        <div class="middle-div">
            <img src="images/whiteLine.png" style="height: 100%; width: 100%">
        </div>
        <div class="right-div">

        </div>
    </div>
    <div class="class2">
        <div class="left-div">

        </div>
        <div class="middle-div">
            <img src="images/whiteLine.png" style="height: 100%; width: 100%">
        </div>
        <div class="right-div">

        </div>

    </div>

    <!---changed by jyx at 2017.12.28--->
    <div class="class3">
        <div class="left-div">

        </div>
        <div class="middle-div">
            <img src="images/whiteLine.png" style="height: 100%; width: 100%">
        </div>
        <div class="right-div">

        </div>

    </div>
    <div class="class4">
        <div class="left-div">

        </div>
        <div class="middle-div">
            <img src="images/whiteLine.png" style="height: 100%; width: 100%">
        </div>
        <div class="right-div">

        </div>

    </div>

    <!---changed by jyx at 2017.12.28--->
    <div class="login-div">
        <img src="images/login.png" style="height: 100%; width: 100%">
        <img class="usernameLabel" src="images/username.png" style="height: 30%; width: 60%">
        <img class="passwordLabel" src="images/password.png" style="height: 20%; width: 55%">
        <input class="usernameinput" id="username" type="text" value="" style="background:transparent; border:none;"/>
        <input class="passwordinput" id="password" type="password" value="" style="background:transparent; border:none;" />
        <button id="loginbtn">登录</button>
    </div>
</div>

</body>
</html>

```

```dart
.title{
    position: absolute;
    text-align: center;
    width: 100%;
    height: 70px;
    top:30px;
    font-size: 50px;
    letter-spacing: 20px;
}

.mainbody{
    position: absolute;
    width: 100%;
    height: 100%;
    top:100px;
}

.class1{
    position: relative;
    width: 100%;
    height: 25%;
    top:0;
    background-color: #ffffe4;
}

.class2{
    position: relative;
    width: 100%;
    height:25%;
    top:0;
    background-color: #95dcd9;
}

.class3{
    position: relative;
    width: 100%;
    height:25%;
    top:0;
    background-color: #96bcc8;
}

.class4{
    position: relative;
    width: 100%;
    height:25%;
    top:0;
    background-color: #97a6bb;
}

.left-div{
    position: absolute;
    width: 15%;
    height: 100%;
    top:0;
    left:0;
}

.middle-div{
    position: absolute;
    width:5%;
    height: 100%;
    top:0;
    left: 15%;
}

.right-div{
    position: absolute;
    width:80%;
    height: 100%;
    top:0;
    left: 20%;
}

.login-div{
    position: absolute;
    left: 25%;
    width: 50%;
    height: 40%;
    top:10%;
}

.usernameLabel{
    position: absolute;
    left:20%;
    top:15%;
}

.passwordLabel{
    position: absolute;
    left:22%;
    top:45%;
}

input:focus{
    outline: none;
}

.usernameinput{
    position: absolute;
    left: 45%;
    top:25%;
    width: 40%;
    height: 10%;
    font-size: 30px;
}

.passwordinput{
    position: absolute;
    left: 45%;
    top:50%;
    width: 40%;
    height: 10%;
    font-size: 30px;
}

#loginbtn{
    position: absolute;
    left: 40%;
    top:70%;
    width: 20%;
    height: 10%;
}
```


```dart
import 'package:sqljocky5/sqljocky.dart';
import 'package:http/http.dart';
import '../../bin/main.dart';
import 'package:http/browser_client.dart';
import 'package:redstone/redstone.dart' as app;
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:sqljocky5/utils.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:html';

InputElement username;
InputElement password;
String usernameValue;
String passwordValue;

main() async
{
  querySelector('#loginbtn').onClick.listen(makePostRequest);
}

Future makePostRequest(Event e) async {     //changed by jyx at 2017.12.26

  var client = new BrowserClient();
  var url = 'http://0.0.0.0:8080/login';
  username = querySelector('#username');
  password = querySelector('#password');
  usernameValue = username.value;
  passwordValue = password.value;
  document.cookie = usernameValue;
  var response =
       await client.post(url,body: '{"Usrname":"' + usernameValue + '","Password":"' + passwordValue + '"}');

  if(response.statusCode == 200){
    Map responseData = JSON.decode(response.body);
    if(responseData["errorCode"] == "0"){
      GotoindexPage();
    }
    else{
      window.alert("用户名或密码错误！");
    }
  }

  else{
    window.alert("无法连接服务器！");
  }
}

GotoindexPage(){
  window.open("indexT.html","");

}


```

```dart
@app.Route("/login", methods: const [app.POST])               //changed by jyx at 2017.12.27
login(@app.Body(app.TEXT) String userData) {
  Map data = JSON.decode(userData);
  var returnData = GetUsrinfo(data['Usrname'],data['Password']);
  return returnData;
}

Future<String> GetUsrinfo(String requestUsrname, String requestPassword) async   //获取用户名密码
{                                                      //changed by jyx at 2017.12.27
  var pool = new ConnectionPool(host: 'www.muedu.org',port: 3306, user: 'deit-2015', password: 'deit@2015!', db: 'project_2015_4', max: 5);
  var results = await pool.query('SELECT * from UserInfo');
  var errorCode = "1";
  var errorMsg = "Wrong Username or Password";
  var UsrType = '';
  await results.forEach((row) {
       if(requestUsrname == row[0] && requestPassword == row[1]){
         errorCode = "0";
         errorMsg = "";
         UsrType = row[2];
       }
});
  ReturnString = '{"errorCode":"' + errorCode + '", "errorMsg":"' + errorMsg + '", "UsrType":"' + UsrType + '"}';
  return ReturnString;
}
```
  
## 我的活动量化

>查询后作类似如下描述，即你做了多少次commit，修改增加了多少，修改删除了多少，做了多少次issues    

>  **苏颖晞/10154507132/0 commits / 250 ++ / 0 --/0 issues/**  

## 我的issue活动
>在这里列出所有你参与的issue活动，包括你发起的问题，你回答的问题，你可以使用贴图展示。

>无


# 我的自评
> 学习了dart的语法，理解了前后端的概念，理解了客户端程序和服务器端程序的区别，并动手写了登录界面的功能。

> 如果用**一整天8小时**时间计算，你有信心再用多少天完成你未目前完成的功能？
> 五天
