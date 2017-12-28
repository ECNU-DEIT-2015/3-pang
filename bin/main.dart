import 'package:redstone/redstone.dart' as app;
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'dart:convert' show JSON;
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils.dart';
import 'dart:async';
import 'package:shelf_cors/shelf_cors.dart';

var ReturnString;

@app.Route("/login", methods: const [app.POST])               //changed by jyx at 2017.12.27
login(@app.Body(app.TEXT) String userData) {
  Map data = JSON.decode(userData);
  var returnData = GetUsrinfo(data['Usrname'],data['Password']);
  return returnData;
}

Future<String> GetUsrinfo(String requestUsrname, String requestPassword) async   //获取用户名密码
{                                                      //changed by jyx at 2017.12.27
  var pool = new ConnectionPool(host: 'www.muedu.org',port: 3306, user: 'deit-2015', password: 'deit@2015!', db: 'project_2015_4', max: 5);
  var results = await pool.query('SELECT UsrName, PasWord,UsrType from UserInfo');
  var errorCode;
  var errorMsg;
  var UsrType;
  await results.forEach((row) {
       if(requestUsrname == row[0] && requestPassword == row[1]){
         errorCode = "0";
         errorMsg = "";
         UsrType = row[2];
       }
       else{
         errorCode = "1";
         errorMsg = "Wrong username or password!";
         UsrType = "";
       }
       ReturnString = '{"errorCode":' + errorCode + ', "errorMsg":' + errorMsg + ', "UsrType":' + UsrType + '}';
  });
  return ReturnString;
}

main()
{
  app.setupConsoleLog();
  app.start();
}

