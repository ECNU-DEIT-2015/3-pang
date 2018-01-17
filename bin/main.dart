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
  ReturnString = '{"errorCode":"' + errorCode + '", "errorMsg":"' + errorMsg + '", "UsrType":"' + UsrType + '"}';
  return ReturnString;
}


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

@app.Route("/addRecord/addTime",methods: const [app.POST])
addTime(@app.Body(app.TEXT) String TimeData){
  Map addtimedata = JSON.decode(TimeData);
  var returnData = addTimeData(addtimedata["ClassName"],addtimedata["weekNum"],addtimedata["ManageNum"],addtimedata["BT"],addtimedata["ET"]);
  return returnData;
}

Future<String> addTimeData(String ClassName, String weekNum, String ManageNum, String BT, String ET) async{
  var pool = new ConnectionPool(host: 'www.muedu.org',port: 3306, user: 'deit-2015', password: 'deit@2015!', db: 'project_2015_4', max: 5);
  int maxnum = 0;
  String classid;
  var result = await pool.query('update Classes set Manage' + ManageNum + 'BT = "' + BT + '",ET="' + ET + '" where Classname = "' + ClassName + '" AND weeknum="' + weekNum + '"');
  await result.forEach((row){

  });
  ReturnString = '{"errorCode":0,"errorMsg":""}';
  return ReturnString;
}

@app.Route("/select/selectClass",methods: const [app.POST])
load(@app.Body(app.TEXT) String loadData){
  Map addtimedata = JSON.decode(loadData);
  var returnData = loadPage(addtimedata["TeacherID"]);
  return returnData;
}

Future loadPage(String TeacherID) async{
  var pool = new ConnectionPool(host: 'www.muedu.org',port: 3306, user: 'deit-2015', password: 'deit@2015!', db: 'project_2015_4', max: 5);
  int i = 1;
  int j = 0;
  List Classname = [];
  var result = await pool.query('SELECT * FROM Classes WHERE Teacherid=' + TeacherID + ' AND weeknum=1');
  await result.forEach((row){
    Classname.add(row[1]);
  });
  ReturnString = '{"errorCode":"0","errorMsg":"","ClassNumber":"' + Classname.length.toString() + '","Classname":"' + Classname.toString() + '"}';

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

