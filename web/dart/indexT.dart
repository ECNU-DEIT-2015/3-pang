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
  querySelector('#addCourseBtn').onClick.listen(makePostRequest);
}

Future<String> GetUsrinfo(String requestUsrname) async
{
  var pool = new ConnectionPool(host: 'www.muedu.org',port: 3306, user: 'deit-2015', password: 'deit@2015!', db: 'project_2015_4', max: 5);
  var results = await pool.query('SELECT * FROM Classes WHERE Teacherid=' + requestUsrname);
  var errorCode = "1";
  var errorMsg = "Not found Teacher!";
  var UsrType = '';
  String Manage = '"manage:{"';
  var num = 0;
  await results.forEach((row) {
    if(row.length != 0){
      num++;
      if(num == 1){
        Manage = Manage + '"manage"' + num + ':{"Manage1BT":' + row[3] + ',"Manage1ET":' + row[4] + ',"Manage1Text":' + row[5] + ',"Manage2BT":' + row[6] + ',"Manage2ET":' + row[7] + ',"Manage2Text":' + row[8] + ',"Manage3BT":' + row[9] + ',"Manage3ET":' + row[10] + ',"Manage3Text":' + row[11] + ',"Manage4BT":' + row[12] + ',"Manage4ET":' + row[13] + ',"Manage4Text":' + row[14] + '}';
      }
      else{
        Manage = Manage + ',"manage"' + num + ':{"Manage1BT":' + row[3] + ',"Manage1ET":' + row[4] + ',"Manage1Text":' + row[5] + ',"Manage2BT":' + row[6] + ',"Manage2ET":' + row[7] + ',"Manage2Text":' + row[8] + ',"Manage3BT":' + row[9] + ',"Manage3ET":' + row[10] + ',"Manage3Text":' + row[11] + ',"Manage4BT":' + row[12] + ',"Manage4ET":' + row[13] + ',"Manage4Text":' + row[14] + '}';
      }
      errorCode = "0";
      errorMsg = "";
    }
    ReturnString = '{"errorCode":' + errorCode + ', "errorMsg":' + errorMsg + ', "manage":{' + Manage + '}';
  });
  return ReturnString;
}

AddCourse(){
  querySelector('#class1Name').innerHtml = '';
}