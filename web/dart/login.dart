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

