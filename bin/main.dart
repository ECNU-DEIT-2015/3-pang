import 'package:redstone/redstone.dart' as app;
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils.dart';
import 'dart:async';

@app.Route("/login")               //changed by jyx at 2017.12.26
login() {
  var usrinfo = GetUsrinfo();
  return usrinfo;
}

@app.Route("/data/add", methods: const [app.POST])      //changed by jyx at 2017.12.26
addUser(@app.Body(app.TEXT) String userData) {
  String data = userData;
  return data;
}

Future<String> GetUsrinfo() async   //获取用户名密码
{                                                      //changed by jyx at 2017.12.26
  var pool = new ConnectionPool(host: 'localhost',port: 3306, user: 'root', password: 'jyx720520', db: 'mysql', max: 5);
  var results = await pool.query('SELECT UsrName, PasWord,UsrType from UserInfo');
  var response;
  await results.forEach((row) {
       response[0] = row[0];
       response[1] = row[1];
       response[2] = row[2];

  });
  return response;

}

main()
{
  app.setupConsoleLog();
  app.start();
}

