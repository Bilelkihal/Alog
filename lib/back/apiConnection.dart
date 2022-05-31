import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

String _localhost() {
  if (Platform.isAndroid) {
    return 'https://8e81-129-45-29-150.eu.ngrok.io';
  } else {
    // for iOS simulator{
    return 'http://localhost:8081';
  }
}

Future<List> getResponse(String uri) async {
  final url = Uri.parse(_localhost() + uri);
  Response response = await get(url);
  final jsonBody = json.decode(response.body) as List;
  return jsonBody;
}

Future<Response> postRequest(var jsonBody) async {
  final url = Uri.parse("https://c0be-129-45-33-208.eu.ngrok.io/users/loggin");
  log("url complete : " + url.toString());
  var response = await post(url, body: jsonBody);
  return response;
}

Future<Response> postRequestList(var jsonBody) async {
  final url = Uri.parse("https://c0be-129-45-33-208.eu.ngrok.io/users/loggin");
  log("url complete : " + url.toString());
  var response = await post(url, body: jsonBody);
  return response;
}
