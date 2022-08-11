import 'dart:convert';

import 'package:cruzze_solutions/constants/url.dart';
import 'package:cruzze_solutions/model/forgotpassword.dart';
import 'package:cruzze_solutions/model/login.dart';
import 'package:cruzze_solutions/model/ticket.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Authentication extends GetxController {
  var token = ''.obs;
  var tickets = [].obs;
  Future login(String email, String password) async {
    var isLoggedIn = false.obs;
    var response = await http.post(Uri.parse(
        '$loginUrl?str_Domain=$str_Domain&email=$email&password=$password'));
    var login = Login.fromJson(json.decode(response.body));
    if (login.status == 'Success') {
      isLoggedIn.value = true;
      token.value = login.authorization!;
    } else {
      isLoggedIn.value = false;
    }
    print('login: ${login.status}');
    print('isLoggedIn: ${isLoggedIn.value}');
    print(token.value);
    return loginFromJson(response.body);
  }

  Future forgotPassword(String email) async{
    Map data = {
      'str_Domain': str_Domain,
      'email': email,
    };
    var response = await http.post(Uri.parse('$forgotPasswordUrl'),
        headers: {
          "Content-Type": "application/json"
        },
        body: json.encode(data)
    );
    print(response.body);
    //print('forgotPassword: ${login.message}');
    return forgotPasswordFromJson(response.body);
  }

  Future fetchTickets(String authToken) async {
    Map data = {
      "dataTableSearch": "",
      "end_date": "2022-06-30T18:29:59.000Z",
      "filter_by": "asc",
      "filter_column": 0,
      "org_id": 32,
      "page": 1,
      "priority_id": [1, 2, 3],
      "project_id": [2, 1],
      "row": 5,
      "search_text": "",
      "start_date": "2022-05-29T11:25:20.661Z",
      "status_id": [1, 2, 3, 5, 4, 6]
    };
    var response = await http.post(
        Uri.parse(
          ticketsUrl,
        ),
        headers: {
          'Authorization': authToken,
          "Content-Type": "application/json"
        },
        body: json.encode(data));
      
    print(response.body);
    return ticketFromJson(response.body);
  }
}
