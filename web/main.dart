import 'package:sqljocky5/sqljocky.dart';
import 'package:http/http.dart';
import '../bin/serverClient.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:http/browser_client.dart';

main() async
{
  querySelector('#btn1').onClick.listen(makePostRequest);
}

var wordList;

void handleError(Object error) {
  wordList.children.add(new LIElement()..text = 'Request failed.');
}

Future makeRequest(Event e) async {
  var path = 'http://localhost:90/login';
  try {
    processString(await HttpRequest.getString(path));
  } catch (e) {
    print('Couldn\'t open $path');
    handleError(e);
  }
}

void processString(String jsonString) {
  List<String> portmanteaux = JSON.decode(jsonString) as List<String>;
  for (int i = 0; i < portmanteaux.length; i++) {
    wordList.children.add(new LIElement()..text = portmanteaux[i]);
  }
}

Future makePostRequest(Event e) async {
  String url = 'http://localhost:80/login';
  HttpRequest
      .request(url, method: 'POST')
      .then((HttpRequest resp) {
    // Do something with the response.
    querySelector('#hulalala').text = resp.responseText;
  });
}