# 产品创意
>你们需要在这里描述你们的产品创意的过程，包括你们的灵感来源，针对什么人群来设计这个产品，你们设计了哪些功能？一开始做的原型的样子（需要附图，要用markdown插入你的图片，关于图片可以在github中使用修改此文档的方式直接上传）  

>灵感来源：我们每个人从小学到现在，上过无数的课，而在课堂上课过程中，部分教师难以把控上课时间，可能会导致压堂、内容讲不完，从而耽误教学进度，这种情况既耽误了教师正常完成教学进度，也导致学生下课晚，无形中增加了每堂课的认知负荷。“课堂时间轴”是一款PC端的教学安排工具，教师登录后可以添加课程，并以分钟为单位，为每节课程安排好教学进度。

>针对人群：一线教师、在校学生。

>设计功能：
>1.登录：为简化设计，这里只设计了登录功能，而暂未设计注册功能。由系统管理员事先在数据库中录入了用户名和密码，用户只需登录即可。

>2.添加课程：教师可以根据自己的实际情况，在系统中为自己添加课程，需要输入课程名称即可，系统默认为18周的课程。将课程新建好，点击确定后即可在数据库中添加好课程，进而为每周的课程设置进度规划。

>3.课程进度规划：教师从添加课程界面点击到某一周后，即可跳入该周课程进度安排规划界面。在此界面中，教师点击添加记录功能即可插入一条新数据，最多可插入4条，每条数据包含开始时间、结束时间、具体安排规划内容，点击确认按钮后即可保存，并存入数据库中。

>你在创意阶段所做的贡献是什么？
>我在创意阶段的贡献：与同学讨论，从技术角度分析某些功能是否合理，例如点名到场功能，需要规避掉同学代点名的情况，就可以要限制ip地址等等，实现起较为复杂，故弃掉。诸如此类的决策。
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

>教师添加时间安排界面搭建：页面静态部分主要为html＋css，其中一些动态效果写在了该页面的客户端dart程序中。在html中，上部主要是课堂时间轴标题，下部一个大的div下面分为纵向4个小的div，每个小的div中又分为left-div、middle-div、right-div。left-div主要放入了选择时间的4个select标签、1个确认按钮、1个取消按钮，right-div主要放入了课程相应信息的输入框和确认按钮、取消按钮。在css中，主要设置各个标签的样式及初始状态（是否透明、是否隐藏等等）。
>教师添加课程的客户端、服务器端程序——添加课程：在教师添加课程界面加载完毕后，点击添加课程按钮触发该按钮点击事件，在点击事件的绑定函数中进行与服务器端程序的异步通信。点击按钮后，首先会查询改界面上是否已有课程信息，并在要插入的地方，将课程名称输入框、确认和取消按钮、课程信息等显示出来，用户输入课程名称后，点击确认提交。在确认按钮的点击事件中，首先获取课程名称输入框中的数据，并写成json格式的字符串，通过指定的url路由发送到服务器端，在服务器端程序相应的url下，首先解析传过来的字符串，通过JSON.decode()方法打包成json数据包，获取到其中内容。然后连接到服务器，先搜索已有的课程，根据已有的课程形成自己的id主键，防止主键重复，并通过INSERT语句插入数据库的表中。插入成功后返回{"errorCode":"0","errorMsg":""}给客户端程序。客户端收到errorCode为0后，修改界面元素，将确认按钮和取消按钮再次隐藏掉，完成一次添加课程的业务。



# 我在小组中的分工
>你在小组中主要负责那部分工作，如果小组其他成员相比，你感觉你完成的怎么样？你觉得你组那个组员完成的最好，工作量最大？如果按10分计算，
你给每个人（包括自己）各多少分，填写下表：
  
   组员|分数
 --|--
  姜宇轩|9
  于潇雪|8
  苏颖晞|7

# 我的编程实践活动
## 我的代码
>采用markdown 中代码标记来粘贴你完成的那些代码。  比如：
  
```dart
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/ClassPageT.css" />
    <script type="application/dart" src="../bin/main.dart"></script>
    <script type="application/dart" src="dart/ClassPageT.dart"></script>
</head>
<body>
<div class="title">
    <label>
        课堂时间轴
    </label>
</div>

<div class="mainbody">

    <!---changed by yxx at 2017.12.28--->
    <div class="class1">
        <div class="left-div">

            <label class="class-select-BeginHourLabel">
                <select id="class1-selectBeginHourLabel" style="background:transparent; border:none">
                </select>
            </label>

            <p class="left-div-p1">:</p>

            <label class="class-select-BeginMinLabel">
                <select id="class1-selectBeginMinLabel" style="background:transparent; border:none;">
                </select>
            </label>

            <label class="class-select-EndHourLabel">
                <select id="class1-selectEndHourLabel" style="background:transparent; border:none">
                </select>
            </label>

            <label class="class-select-EndMinLabel">
                <select id="class1-selectEndMinLabel" style="background:transparent; border:none;">
                </select>
            </label>

            <button id="class1Confirm" class="classConfirmBtn">确认</button>
            <button id="class1Cancel" class="classCancelBtn">取消</button>
        </div>

        <div class="middle-div">
            <img src="images/whiteLine.png" style="height: 100%; width: 100%">
        </div>

        <div class="right-div">
            <textarea class="Manage-Content" id="Class1ManageContent" style="text-align:center; resize: none;"></textarea>
            <button id="class1ContentConfirm" class="ContentConfirmBtn">确认</button>
            <button id="class1ContentCancel" class="ContentCancelBtn">取消</button>
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

    <!---changed by susu at 2017.12.28--->
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
</div>

<div>
    <button id="addRecordBtn">添加记录</button>
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
    background-color: #ffe5a7;
    text-align: center;
}

.class2{
    position: relative;
    width: 100%;
    height:25%;
    top:0;
    background-color: #009c95;
}

.class3{
    position: relative;
    width: 100%;
    height:25%;
    top:0;
    background-color: #026378;
}

.class4{
    position: relative;
    width: 100%;
    height:25%;
    top:0;
    background-color: #55c1ae;
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

#addRecordBtn{
    position: absolute;
    top:60px;
    left: 70%;
    width: 10%;
    height: 5%;

}

.classConfirmBtn{
    position: absolute;
    top:70%;
    left: 20%;
    width: 35%;
    height: 10%;
    visibility: hidden;
}

.classCancelBtn{
    position: absolute;
    top:70%;
    left:60%;
    width: 35%;
    height: 10%;
    visibility: hidden;
}

.class-select-BeginHourLabel select{
    position: absolute;
    top:15%;
    left:15%;
    width: 30%;
    height: 20%;
    visibility: hidden;
}

.class-select-EndHourLabel select{
    position: absolute;
    top:40%;
    left:15%;
    width: 30%;
    height: 20%;
    visibility: hidden;
}

.left-div-p1{
    position: absolute;
    top:12%;
    left:40%;
    width: 30%;
    height: 20%;
    visibility: hidden;
}

.class-select-BeginMinLabel select{
    position: absolute;
    top:15%;
    left:70%;
    width: 30%;
    height: 20%;
    visibility: hidden;
}

.class-select-EndMinLabel select{
    position: absolute;
    top:40%;
    left:70%;
    width: 30%;
    height: 20%;
    visibility: hidden;
}

.Manage-Content{
    position: absolute;
    top:25%;
    left:15%;
    width: 70%;
    height: 50%;
    visibility: hidden;
}

.ContentConfirmBtn{
    position: absolute;
    top:85%;
    left: 30%;
    width: 10%;
    height:10%;
    visibility: hidden;
}

.ContentCancelBtn{
    position: absolute;
    top:85%;
    left: 60%;
    width: 10%;
    height: 10%;
    visibility: hidden;
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

main() async
{
  querySelector('#addRecordBtn').onClick.listen(addRecord);
  querySelector('#class1Confirm').onClick.listen(ConfirmClick);
  querySelector('#class1Cancel').onClick.listen(CancelClick);
  querySelector('#class1ContentConfirm').onClick.listen(ContentConfirmClick);
  querySelector('#class1ContentCancel').onClick.listen(CancelClick);
}

loadSelect(int j){
    for(int i = 0; i < 24; i++){
      var optionHTML = '<option value="' + i.toString() + '" class = "class' + j.toString() + '-select-Beginhour" id="class' + j.toString() + '-select-Beginhour-' + i.toString() + '">' + i.toString() + '</option>';
      querySelector("#class" + j.toString() + "-selectBeginHourLabel").appendHtml(optionHTML);
      var optionHTML1 = '<option value="' + i.toString() + '" class = "class' + j.toString() + '-select-Endhour" id="class' + j.toString() + '-select-Endhour-' + i.toString() + '">' + i.toString() + '</option>';
      querySelector("#class" + j.toString() + "-selectEndHourLabel").appendHtml(optionHTML1);
    }
    for(int i = 0; i < 60; i++){
      var optionHTML = '<option value="' + i.toString() + '" class = "class' + j.toString() + '-select-Beginmin" id="class' + j.toString() + '-select-Beginmin-' + i.toString() + '">' + i.toString() + '</option>';
      querySelector("#class" + j.toString() + "-selectBeginMinLabel").appendHtml(optionHTML);
      var optionHTML1 = '<option value="' + i.toString() + '" class = "class' + j.toString() + '-select-Endmin" id="class' + j.toString() + '-select-Endmin-' + i.toString() + '">' + i.toString() + '</option>';
      querySelector("#class" + j.toString() + "-selectEndMinLabel").appendHtml(optionHTML1);
    }
}

addRecord(Event e){
  querySelector('#class1-selectBeginHourLabel').style.visibility = "visible";
  querySelector('#class1-selectBeginMinLabel').style.visibility = "visible";
  querySelector('#class1-selectEndHourLabel').style.visibility = "visible";
  querySelector('#class1-selectEndMinLabel').style.visibility = "visible";
  loadSelect(1);
  querySelector('#class1Confirm').style.visibility = "visible";
  querySelector('#class1Cancel').style.visibility = "visible";
  querySelector('.left-div p').style.visibility = "visible";
  querySelector('#Class1ManageContent').style.visibility = "visible";
  querySelector('#class1ContentConfirm').style.visibility = "visible";
  querySelector('#class1ContentCancel').style.visibility = "visible";

}

ConfirmClick(Event e) async{
  querySelector('#class1Confirm').style.visibility = "hidden";
  querySelector('#class1Cancel').style.visibility = "hidden";
  querySelector('#class1-selectBeginHourLabel').setAttribute("disabled", "disabled");
  querySelector('#class1-selectBeginMinLabel').setAttribute("disabled", "disabled");
  querySelector('#class1-selectEndHourLabel').setAttribute("disabled", "disabled");
  querySelector('#class1-selectEndMinLabel').setAttribute("disabled", "disabled");
  var client = new BrowserClient();

  /*var url = 'http://0.0.0.0:8080/addRecord/addTime';
  TextAreaElement classname = querySelector('#class' + CourseNum.toString() + 'Name');
  String classnameValue = classname.value;
  var response =
      await client.post(url,body: '{"ClassName":"' + document.cookie.split(';')[1] + '","weekNum":"' + document.cookie.split(';')[1] + '","ManageNum":' + ManageNum + '","BT":' + BT + '","ET":' + ET + '}');

  if(response.statusCode == 200){
    Map responseData = JSON.decode(response.body);
    if(responseData["errorCode"] == "0"){

      querySelector('#class' + CourseNum.toString() + 'Confirm').style.visibility = "hidden";
      querySelector('#class' + CourseNum.toString() + 'Cancel').style.visibility = "hidden";
      querySelector('#class' + CourseNum.toString() + 'Name').style.background = "transparent";
      querySelector('#class' + CourseNum.toString() + 'Name').style.border = "none";
      querySelector('#class' + CourseNum.toString() + 'Name').setAttribute("disabled", "disabled");
      CourseNum = 1;

    }
    else{
      window.alert("添加失败！");
    }
  }

  else{
    window.alert("无法连接服务器！");
  }*/

}

CancelClick(Event e){
  querySelector('#class1Confirm').style.visibility = "hidden";
  querySelector('#class1Cancel').style.visibility = "hidden";
  querySelector('.left-div p').style.visibility = "hidden";
  querySelector('#class1-selectBeginHourLabel').style.visibility = "hidden";
  querySelector('#class1-selectBeginMinLabel').style.visibility = "hidden";
  querySelector('#class1-selectEndHourLabel').style.visibility = "hidden";
  querySelector('#class1-selectEndMinLabel').style.visibility = "hidden";
  querySelector('#class1ContentConfirm').style.visibility = "hidden";
  querySelector('#class1ContentCancel').style.visibility = "hidden";
  querySelector('#Class1ManageContent').style.visibility = "hidden";
}

ContentConfirmClick(Event e){
  querySelector('#class1ContentConfirm').style.visibility = "hidden";
  querySelector('#class1ContentCancel').style.visibility = "hidden";
  querySelector('#Class1ManageContent').style.background = "transparent";
  querySelector('#Class1ManageContent').style.border = "none";
  querySelector('#Class1ManageContent').setAttribute("disabled", "disabled");
}

```

```dart
@app.Route("/addClass",methods: const [app.POST])
addClass(@app.Body(app.TEXT) String ClassData){
  Map classdata = JSON.decode(ClassData);
  var returnData = addClassData(classdata["Classname"], classdata["Teacherid"]);
  return returnData;
}

Future<String> addClassData(String Classname, String Teacherid) async{
  var pool = new ConnectionPool(host: 'www.muedu.org',port: 3306, user: 'deit-2015', password: 'deit@2015!', db: 'project_2015_4', max: 5);
  int maxnum = 0;
  String classid;
  var result = await pool.query('SELECT * FROM Classes WHERE Teacherid=' + Teacherid);
  await result.forEach((row){
    if(row.length != 0 ){
      if(int.parse(row[0]) > maxnum){
        maxnum = int.parse(row[0]);
      }
    }
  });
  for(int weeknumber = 1; weeknumber < 19; weeknumber++){
     maxnum++;
     classid = maxnum.toString();
     await pool.query('INSERT INTO Classes (ClassId, Classname, Teacherid, weeknum) VALUES ("' + classid + '", "' + Classname + '","' + Teacherid + '","' + weeknumber.toString() + '")');
  }
  ReturnString = '{"errorCode":"0","errorMsg":""}';
  return ReturnString;
}

```
  
## 我的活动量化

>查询后作类似如下描述，即你做了多少次commit，修改增加了多少，修改删除了多少，做了多少次issues    

>  **姜宇轩/10154507134/5 commits / 250 ++ / 0 --/1 issues/**  

## 我的issue活动
>在这里列出所有你参与的issue活动，包括你发起的问题，你回答的问题，你可以使用贴图展示。

>回答了Yuxiaoxue2015提出的问题：教师界面点击添加按钮后，弹出框显示所要添加的课程信息，回答结果：和在页面上做异步交互是异曲同工的，可参考https://www.cnblogs.com/wildfox/p/5852998.html


# 我的自评
> 由于自己之前有开发经验，所以写得没那么困难，通过这个项目，再次明确了异步通信的规范，对于dart语言有了比较深刻的认识，对客户端程序和服务器端程序的写法更为熟练了！

> 如果用**一整天8小时**时间计算，你有信心再用多少天完成你未目前完成的功能？
> 十天
