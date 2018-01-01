import 'package:redstone/redstone.dart' as app;
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'dart:convert' show JSON;
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils.dart';
import 'dart:async';
import 'package:shelf_cors/shelf_cors.dart' as shelf_cors;

String ReturnString = '';

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
  ReturnString = '{"errorCode":' + errorCode + ', "errorMsg":' + errorMsg + ', "UsrType":' + UsrType + '}';
  return ReturnString;
}

main()
{
  Map corsHeaders1 = {
    "Access-Control-Allow-Methods": "POST",
    "Access-Control-Allow-Origin": "*",
  };
  shelf.Middleware middleware = shelf_cors.createCorsHeadersMiddleware(corsHeaders: corsHeaders1);
  app.setupConsoleLog();
  app.addShelfMiddleware(middleware);
  app.start();
}

