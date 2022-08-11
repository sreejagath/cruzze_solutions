import 'package:cruzze_solutions/constants/color.dart';
import 'package:cruzze_solutions/controller/login_controller.dart';
import 'package:cruzze_solutions/controller/ticket_controller.dart';
import 'package:cruzze_solutions/view/forgotpass.dart';
import 'package:cruzze_solutions/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Row(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 30,
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.montserrat().fontFamily),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email, color: Colors.grey),
                    hintText: 'Enter email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mainColor, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mainColor, width: 1.0),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                    hintText: 'Enter password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mainColor, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mainColor, width: 1.0),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const ForgotPassword());
                      },
                      child: const Text('Forgot password?',
                          style: TextStyle(color: Colors.blue))),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  print(email.text);
                  email.text =='' && password.text==''?
                  Get.snackbar('Error', 'Please fill all fields',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      borderRadius: 10,
                      margin: EdgeInsets.all(10),
                      borderColor: Colors.red,
                      borderWidth: 1,
                      colorText: Colors.white,
                      duration: Duration(seconds: 2)):
                  auth.login(email.text, password.text).then((value) => {
                        if (value.status == 'Success')
                          {
                            auth
                                .fetchTickets(value.authorization)
                                .then((value) {
                              auth.tickets.value = value.data;
                              Get.offAll(HomePage(ticket: auth.tickets.value));
                            })
                          }
                        else
                          {
                            Get.snackbar('Error', value.message,
                                snackPosition: SnackPosition.BOTTOM)
                          }
                      });
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text('Login',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.montserrat().fontFamily)),
                ),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     auth.login(email.text, password.text).then((value) => {
      //           if (value.status == 'Success')
      //             {
      //               auth.fetchTickets(value.authorization).then((value) {
      //                 auth.tickets.value = value.data;
      //                 Get.offAll(HomePage(ticket: auth.tickets.value));
      //               })
      //             }
      //           else
      //             {
      //               Get.snackbar('Error', value.message,
      //                   snackPosition: SnackPosition.BOTTOM)
      //             }
      //         });
      //   },
      //   tooltip: 'Increment',
      //   backgroundColor: mainColor,
      //   child: const Icon(Icons.arrow_forward_ios),
      // ),
    );
  }
}
