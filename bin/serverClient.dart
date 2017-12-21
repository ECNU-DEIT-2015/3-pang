import 'package:redstone/redstone.dart' as app;
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils.dart';
import 'dart:async';

@app.Route("/login")
login() {
  return GetUsrinfo();
}

Future<String> GetUsrinfo() async   //获取用户名密码
{
  var pool = new ConnectionPool(host: 'localhost',port: 3306, user: 'root', password: 'jyx720520', db: 'mysql', max: 5);
  var results = await pool.query('SELECT UsrName, PasWord,UsrType from UserInfo');
  String response;
  await results.forEach((row) {
       response = 'UsrName: ${row[0]}, PasWord: ${row[1]}, UsrType: ${row[2]}';
  });
  return response;

}

