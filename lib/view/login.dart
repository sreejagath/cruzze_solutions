import 'package:cruzze_solutions/controller/login_controller.dart';
import 'package:cruzze_solutions/controller/ticket_controller.dart';
import 'package:cruzze_solutions/view/forgotpass.dart';
import 'package:cruzze_solutions/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email = TextEditingController();
  var password = TextEditingController();
  var auth = Authentication();
  var ticketCtrl = TicketController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: 'Enter email',
                ),
              ),
              TextField(
                controller: password,
                decoration: const InputDecoration(
                  labelText: 'Enter password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                GestureDetector(
                  onTap: (){
                    Get.to(()=> const ForgotPassword());
                  },
                  child: const Text('Forgot password?', style: TextStyle(color: Colors.blue))),
              ],)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          auth.login(email.text, password.text).then((value) => {
                if (value.status == 'Success')
                  {
                    auth
                        .fetchTickets(value.authorization)
                        .then((value) {
                          auth.tickets.value = value.data;
                          Get.offAll(HomePage(ticket: auth.tickets.value));})
                  }
                else
                  {
                    Get.snackbar('Error', value.message,
                        snackPosition: SnackPosition.BOTTOM)
                  }
              });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
