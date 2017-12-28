import 'package:sqljocky5/sqljocky.dart';
import 'package:http/http.dart';
import '../bin/main.dart';
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
  querySelector('#btn1').onClick.listen(makePostRequest);

}

var wordList;

void handleError(Object error) {
  wordList.children.add(new LIElement()..text = 'Request failed.');
}

Future makeRequest(Event e) async {               //changed by jyx at 2017.12.26

  var path = '/login';
  try {
    processString(await HttpRequest.getString(path));
  } catch (e) {
    print('Couldn\'t open $path');
    handleError(e);
  }
}

void processString(String jsonString) {           //changed by jyx at 2017.12.26
  List<String> portmanteaux = JSON.decode(jsonString) as List<String>;
  for (int i = 0; i < portmanteaux.length; i++) {
    wordList.children.add(new LIElement()..text = portmanteaux[i]);
  }
}

Future makePostRequest(Event e) async {     //changed by jyx at 2017.12.26
  var client = new BrowserClient();
  var url = '/data/add';
  var response =
       await client.post(url,body: {"name":"123"});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}