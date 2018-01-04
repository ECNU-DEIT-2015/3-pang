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
  querySelector('#addRecordBtn').onClick.listen(addRecord);
  querySelector('#class1Confirm').onClick.listen(ConfirmClick);
  querySelector('#class1Cancel').onClick.listen(CancelClick);
  querySelector('#class1ContentConfirm').onClick.listen(ContentConfirmClick);
  querySelector('#class1ContentCancel').onClick.listen(CancelClick);
}

loadSelect(int j){
    for(int i = 0; i < 24; i++){
      var optionHTML = '<option value="' + i.toString() + '" class = "class' + j.toString() + '-select-Beginhour" id="class' + j.toString() + '-select-Beginhour-' + i.toString() + '">' + i.toString() + '</option>';
      querySelector("#class" + j.toString() + "-selectBeginHourLabel").appendHtml(optionHTML);
      var optionHTML1 = '<option value="' + i.toString() + '" class = "class' + j.toString() + '-select-Endhour" id="class' + j.toString() + '-select-Endhour-' + i.toString() + '">' + i.toString() + '</option>';
      querySelector("#class" + j.toString() + "-selectEndHourLabel").appendHtml(optionHTML1);
    }
    for(int i = 0; i < 60; i++){
      var optionHTML = '<option value="' + i.toString() + '" class = "class' + j.toString() + '-select-Beginmin" id="class' + j.toString() + '-select-Beginmin-' + i.toString() + '">' + i.toString() + '</option>';
      querySelector("#class" + j.toString() + "-selectBeginMinLabel").appendHtml(optionHTML);
      var optionHTML1 = '<option value="' + i.toString() + '" class = "class' + j.toString() + '-select-Endmin" id="class' + j.toString() + '-select-Endmin-' + i.toString() + '">' + i.toString() + '</option>';
      querySelector("#class" + j.toString() + "-selectEndMinLabel").appendHtml(optionHTML1);
    }
}

addRecord(Event e){
  querySelector('#class1-selectBeginHourLabel').style.visibility = "visible";
  querySelector('#class1-selectBeginMinLabel').style.visibility = "visible";
  querySelector('#class1-selectEndHourLabel').style.visibility = "visible";
  querySelector('#class1-selectEndMinLabel').style.visibility = "visible";
  loadSelect(1);
  querySelector('#class1Confirm').style.visibility = "visible";
  querySelector('#class1Cancel').style.visibility = "visible";
  querySelector('.left-div p').style.visibility = "visible";
  querySelector('#Class1ManageContent').style.visibility = "visible";
  querySelector('#class1ContentConfirm').style.visibility = "visible";
  querySelector('#class1ContentCancel').style.visibility = "visible";
}

ConfirmClick(Event e) {
  querySelector('#class1Confirm').style.visibility = "hidden";
  querySelector('#class1Cancel').style.visibility = "hidden";
  querySelector('#class1-selectBeginHourLabel').setAttribute("disabled", "disabled");
  querySelector('#class1-selectBeginMinLabel').setAttribute("disabled", "disabled");
  querySelector('#class1-selectEndHourLabel').setAttribute("disabled", "disabled");
  querySelector('#class1-selectEndMinLabel').setAttribute("disabled", "disabled");

}

CancelClick(Event e){
  querySelector('#class1Confirm').style.visibility = "hidden";
  querySelector('#class1Cancel').style.visibility = "hidden";
  querySelector('.left-div p').style.visibility = "hidden";
  querySelector('#class1-selectBeginHourLabel').style.visibility = "hidden";
  querySelector('#class1-selectBeginMinLabel').style.visibility = "hidden";
  querySelector('#class1-selectEndHourLabel').style.visibility = "hidden";
  querySelector('#class1-selectEndMinLabel').style.visibility = "hidden";
  querySelector('#class1ContentConfirm').style.visibility = "hidden";
  querySelector('#class1ContentCancel').style.visibility = "hidden";
  querySelector('#Class1ManageContent').style.visibility = "hidden";
}

ContentConfirmClick(Event e){
  querySelector('#class1ContentConfirm').style.visibility = "hidden";
  querySelector('#class1ContentCancel').style.visibility = "hidden";
  querySelector('#Class1ManageContent').style.background = "transparent";
  querySelector('#Class1ManageContent').style.border = "none";
  querySelector('#Class1ManageContent').setAttribute("disabled", "disabled");
}