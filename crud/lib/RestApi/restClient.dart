import 'dart:convert';
import 'package:crud/Style/Style.dart';
import 'package:http/http.dart' as http;

Future<bool> productCreateRequest(Map<String, String> formValues) async {
  // url parse kore nite hobe
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  // json covert kore nite hobe
  var postBody = json.encode(formValues);
  var postHeader = {"Content-Type": "application/json"};
  var response = await http.post(url, headers: postHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody['status'] == "success") {
    successToast("Request Success");
    return true;
  } else {
    errorToast("Request fail ! try again");
    return false;
  }
}
