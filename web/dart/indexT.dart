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
import 'login.dart';

int CourseNum = 1;

main() async
{
  loadPage();
  querySelector('#addCourseBtn').onClick.listen(AddCourse);
  querySelector('#class1Confirm').onClick.listen(ConfirmClick);
  querySelector('#class1Cancel').onClick.listen(CancelClick);
  querySelector('#class2Confirm').onClick.listen(ConfirmClick);
  querySelector('#class2Cancel').onClick.listen(CancelClick);
  querySelector('#class3Confirm').onClick.listen(ConfirmClick);
  querySelector('#class3Cancel').onClick.listen(CancelClick);
  querySelector('#class4Confirm').onClick.listen(ConfirmClick);
  querySelector('#class4Cancel').onClick.listen(CancelClick);
  querySelector('#class1week1').onClick.listen(week11TableClick);
  querySelector('#class1week2').onClick.listen(week12TableClick);
  querySelector('#class1week3').onClick.listen(week13TableClick);
  querySelector('#class1week4').onClick.listen(week14TableClick);
  querySelector('#class1week5').onClick.listen(week15TableClick);
  querySelector('#class1week6').onClick.listen(week16TableClick);
  querySelector('#class1week7').onClick.listen(week17TableClick);
  querySelector('#class1week8').onClick.listen(week18TableClick);
  querySelector('#class1week9').onClick.listen(week19TableClick);
  querySelector('#class1week10').onClick.listen(week110TableClick);
  querySelector('#class1week11').onClick.listen(week111TableClick);
  querySelector('#class1week12').onClick.listen(week112TableClick);
  querySelector('#class1week13').onClick.listen(week113TableClick);
  querySelector('#class1week14').onClick.listen(week114TableClick);
  querySelector('#class1week15').onClick.listen(week115TableClick);
  querySelector('#class1week16').onClick.listen(week116TableClick);
  querySelector('#class1week17').onClick.listen(week117TableClick);
  querySelector('#class1week18').onClick.listen(week118TableClick);
  querySelector('#class2week1').onClick.listen(week21TableClick);
  querySelector('#class2week2').onClick.listen(week22TableClick);
  querySelector('#class2week3').onClick.listen(week23TableClick);
  querySelector('#class2week4').onClick.listen(week24TableClick);
  querySelector('#class2week5').onClick.listen(week25TableClick);
  querySelector('#class2week6').onClick.listen(week26TableClick);
  querySelector('#class2week7').onClick.listen(week27TableClick);
  querySelector('#class2week8').onClick.listen(week28TableClick);
  querySelector('#class2week9').onClick.listen(week29TableClick);
  querySelector('#class2week10').onClick.listen(week210TableClick);
  querySelector('#class2week11').onClick.listen(week211TableClick);
  querySelector('#class2week12').onClick.listen(week212TableClick);
  querySelector('#class2week13').onClick.listen(week213TableClick);
  querySelector('#class2week14').onClick.listen(week214TableClick);
  querySelector('#class2week15').onClick.listen(week215TableClick);
  querySelector('#class2week16').onClick.listen(week216TableClick);
  querySelector('#class2week17').onClick.listen(week217TableClick);
  querySelector('#class2week18').onClick.listen(week218TableClick);
  querySelector('#class3week1').onClick.listen(week31TableClick);
  querySelector('#class3week2').onClick.listen(week32TableClick);
  querySelector('#class3week3').onClick.listen(week33TableClick);
  querySelector('#class3week4').onClick.listen(week34TableClick);
  querySelector('#class3week5').onClick.listen(week35TableClick);
  querySelector('#class3week6').onClick.listen(week36TableClick);
  querySelector('#class3week7').onClick.listen(week37TableClick);
  querySelector('#class3week8').onClick.listen(week38TableClick);
  querySelector('#class3week9').onClick.listen(week39TableClick);
  querySelector('#class3week10').onClick.listen(week310TableClick);
  querySelector('#class3week11').onClick.listen(week311TableClick);
  querySelector('#class3week12').onClick.listen(week312TableClick);
  querySelector('#class3week13').onClick.listen(week313TableClick);
  querySelector('#class3week14').onClick.listen(week314TableClick);
  querySelector('#class3week15').onClick.listen(week315TableClick);
  querySelector('#class3week16').onClick.listen(week316TableClick);
  querySelector('#class3week17').onClick.listen(week317TableClick);
  querySelector('#class3week18').onClick.listen(week318TableClick);
  querySelector('#class4week1').onClick.listen(week41TableClick);
  querySelector('#class4week2').onClick.listen(week42TableClick);
  querySelector('#class4week3').onClick.listen(week43TableClick);
  querySelector('#class4week4').onClick.listen(week44TableClick);
  querySelector('#class4week5').onClick.listen(week45TableClick);
  querySelector('#class4week6').onClick.listen(week46TableClick);
  querySelector('#class4week7').onClick.listen(week47TableClick);
  querySelector('#class4week8').onClick.listen(week48TableClick);
  querySelector('#class4week9').onClick.listen(week49TableClick);
  querySelector('#class4week10').onClick.listen(week410TableClick);
  querySelector('#class4week11').onClick.listen(week411TableClick);
  querySelector('#class4week12').onClick.listen(week412TableClick);
  querySelector('#class4week13').onClick.listen(week413TableClick);
  querySelector('#class4week14').onClick.listen(week414TableClick);
  querySelector('#class4week15').onClick.listen(week415TableClick);
  querySelector('#class4week16').onClick.listen(week416TableClick);
  querySelector('#class4week17').onClick.listen(week417TableClick);
  querySelector('#class4week18').onClick.listen(week418TableClick);


}

loadPage() async{
  var client = new BrowserClient();

  var url = 'http://0.0.0.0:8080/select/selectClass';
  var response =
  await client.post(url,body: '{"TeacherID":"' + document.cookie.split(';')[0] + '"}');

  if(response.statusCode == 200) {
    Map responseData = JSON.decode(response.body);
    if (responseData["errorCode"] == "0") {
      var jsonjson = responseData["Classname"];
      int ClassNumber = int.parse(responseData["ClassNumber"]);
      var jsonsplit = jsonjson.split(']')[0].substring(1).split(',');
      for (int i = 1; i <= ClassNumber; i++) {
        querySelector('#class' + i.toString() + 'Name').style.visibility = "visible";
        querySelector('#class' + i.toString() + 'weekTable').style.visibility = "visible";
        querySelector('#class' + i.toString() + 'Name').innerHtml = jsonsplit[i-1];
        querySelector('#class' + i.toString() + 'Name').style.background = "transparent";
        querySelector('#class' + i.toString() + 'Name').style.border = "none";
        querySelector('#class' + i.toString() + 'Name').setAttribute("disabled", "disabled");
      }
    }
  }
}

AddCourse(Event e){
  for(int i = 1; i < 4; i++){
    if(querySelector('#class' + i.toString() + 'Name').style.visibility == "visible"){
      CourseNum++;
    }
  }
  querySelector('#class' + CourseNum.toString() + 'Confirm').style.visibility = "visible";
  querySelector('#class' + CourseNum.toString() + 'Cancel').style.visibility = "visible";
  querySelector('#class' + CourseNum.toString() + 'Name').style.visibility = "visible";
  querySelector('#class' + CourseNum.toString() + 'weekTable').style.visibility = "visible";

}

Future ConfirmClick(Event e) async {
  
  var client = new BrowserClient();

  var url = 'http://0.0.0.0:8080/addClass';
  TextAreaElement classname = querySelector('#class' + CourseNum.toString() + 'Name');
  String classnameValue = classname.value;
  var response =
      await client.post(url,body: '{"Teacherid":"' + document.cookie.split(';')[0] + '","Classname":"' + classnameValue + '"}');

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
  }
}

CancelClick(Event e){
  querySelector('#class' + CourseNum.toString() + 'Confirm').style.visibility = "hidden";
  querySelector('#class' + CourseNum.toString() + 'Cancel').style.visibility = "hidden";
  querySelector('#class' + CourseNum.toString() + 'Name').style.visibility = "hidden";
  querySelector('#class' + CourseNum.toString() + 'weekTable').style.visibility = "hidden";
  CourseNum = 1;

}


weekTableClickToDB(int course, int week){
  document.cookie = document.cookie.split(';')[0] + ";" + course.toString() + ";" + week.toString() + ";";
  window.open("ClassPageT.html","");
}











week11TableClick(Event e){
  weekTableClickToDB(1,1);
}
week12TableClick(Event e){
  weekTableClickToDB(1,2);
}
week13TableClick(Event e){
  weekTableClickToDB(1,3);
}
week14TableClick(Event e){
  weekTableClickToDB(1,4);
}
week15TableClick(Event e){
  weekTableClickToDB(1,5);
}
week16TableClick(Event e){
  weekTableClickToDB(1,6);
}
week17TableClick(Event e){
  weekTableClickToDB(1,7);
}
week18TableClick(Event e){
  weekTableClickToDB(1,8);
}
week19TableClick(Event e){
  weekTableClickToDB(1,9);
}
week110TableClick(Event e){
  weekTableClickToDB(1,10);
}
week111TableClick(Event e){
  weekTableClickToDB(1,11);
}
week112TableClick(Event e){
  weekTableClickToDB(1,12);
}
week113TableClick(Event e){
  weekTableClickToDB(1,13);
}
week114TableClick(Event e){
  weekTableClickToDB(1,14);
}
week115TableClick(Event e){
  weekTableClickToDB(1,15);
}
week116TableClick(Event e){
  weekTableClickToDB(1,16);
}
week117TableClick(Event e){
  weekTableClickToDB(1,17);
}
week118TableClick(Event e){
  weekTableClickToDB(1,18);
}
week21TableClick(Event e){
  weekTableClickToDB(2,1);
}
week22TableClick(Event e){
  weekTableClickToDB(2,2);
}
week23TableClick(Event e){
  weekTableClickToDB(2,3);
}
week24TableClick(Event e){
  weekTableClickToDB(2,4);
}
week25TableClick(Event e){
  weekTableClickToDB(2,5);
}
week26TableClick(Event e){
  weekTableClickToDB(2,6);
}
week27TableClick(Event e){
  weekTableClickToDB(2,7);
}
week28TableClick(Event e){
  weekTableClickToDB(2,8);
}
week29TableClick(Event e){
  weekTableClickToDB(2,9);
}
week210TableClick(Event e){
  weekTableClickToDB(2,10);
}
week211TableClick(Event e){
  weekTableClickToDB(2,11);
}
week212TableClick(Event e){
  weekTableClickToDB(2,12);
}
week213TableClick(Event e){
  weekTableClickToDB(2,13);
}
week214TableClick(Event e){
  weekTableClickToDB(2,14);
}
week215TableClick(Event e){
  weekTableClickToDB(2,15);
}
week216TableClick(Event e){
  weekTableClickToDB(2,16);
}
week217TableClick(Event e){
  weekTableClickToDB(2,17);
}
week218TableClick(Event e){
  weekTableClickToDB(2,18);
}
week31TableClick(Event e){
  weekTableClickToDB(3,1);
}
week32TableClick(Event e){
  weekTableClickToDB(3,2);
}
week33TableClick(Event e){
  weekTableClickToDB(3,3);
}
week34TableClick(Event e){
  weekTableClickToDB(3,4);
}
week35TableClick(Event e){
  weekTableClickToDB(3,5);
}
week36TableClick(Event e){
  weekTableClickToDB(3,6);
}
week37TableClick(Event e){
  weekTableClickToDB(3,7);
}
week38TableClick(Event e){
  weekTableClickToDB(3,8);
}
week39TableClick(Event e){
  weekTableClickToDB(3,9);
}
week310TableClick(Event e){
  weekTableClickToDB(3,10);
}
week311TableClick(Event e){
  weekTableClickToDB(3,11);
}
week312TableClick(Event e){
  weekTableClickToDB(3,12);
}
week313TableClick(Event e){
  weekTableClickToDB(3,13);
}
week314TableClick(Event e){
  weekTableClickToDB(3,14);
}
week315TableClick(Event e){
  weekTableClickToDB(3,15);
}
week316TableClick(Event e){
  weekTableClickToDB(3,16);
}
week317TableClick(Event e){
  weekTableClickToDB(3,17);
}
week318TableClick(Event e){
  weekTableClickToDB(3,18);
}
week41TableClick(Event e){
  weekTableClickToDB(4,1);
}
week42TableClick(Event e){
  weekTableClickToDB(4,2);
}
week43TableClick(Event e){
  weekTableClickToDB(4,3);
}
week44TableClick(Event e){
  weekTableClickToDB(4,4);
}
week45TableClick(Event e){
  weekTableClickToDB(4,5);
}
week46TableClick(Event e){
  weekTableClickToDB(4,6);
}
week47TableClick(Event e){
  weekTableClickToDB(4,7);
}
week48TableClick(Event e){
  weekTableClickToDB(4,8);
}
week49TableClick(Event e){
  weekTableClickToDB(4,9);
}
week410TableClick(Event e){
  weekTableClickToDB(4,10);
}
week411TableClick(Event e){
  weekTableClickToDB(4,11);
}
week412TableClick(Event e){
  weekTableClickToDB(4,12);
}
week413TableClick(Event e){
  weekTableClickToDB(4,13);
}
week414TableClick(Event e){
  weekTableClickToDB(4,14);
}
week415TableClick(Event e){
  weekTableClickToDB(4,15);
}
week416TableClick(Event e){
  weekTableClickToDB(4,16);
}
week417TableClick(Event e){
  weekTableClickToDB(4,17);
}
week418TableClick(Event e){
  weekTableClickToDB(4,18);
}