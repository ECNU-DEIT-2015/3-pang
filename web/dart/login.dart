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
  querySelector('#loginbtn').onClick.listen(makePostRequest);
}

Future makePostRequest(Event e) async {     //changed by jyx at 2017.12.26

  var client = new BrowserClient();
  var url = 'http://0.0.0.0:8080/login';

  var response =
       await client.post(url,body: '{"Usrname":"10154507134","Password":"1234567"}');

  if(response.statusCode == 200){

    Map responseData = JSON.decode(response.body);
    window.alert("200!");
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

}

