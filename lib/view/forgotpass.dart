import 'package:cruzze_solutions/constants/color.dart';
import 'package:cruzze_solutions/constants/font.dart';
import 'package:cruzze_solutions/controller/login_controller.dart';
import 'package:cruzze_solutions/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  var email = TextEditingController();
  var auth = Authentication();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  montserrat('Forgot Password', size: 20, color: mainColor, fontWeight: FontWeight.bold),
                ],
              ),
              const SizedBox(
                height: 40,
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
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width*0.7,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(30)
                ),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    auth.forgotPassword(email.text).then((value){
                      Get.snackbar(value.message, value.message,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        borderRadius: 20,
                        margin: const EdgeInsets.all(10),
                        borderColor: Colors.green,
                        borderWidth: 2,
                        duration: const Duration(seconds: 2),
                        colorText: Colors.white,
                      );
                      // showToast(value.message.toString());
                    });
                  },
                  child: const Text('Submit', style: TextStyle(color: Colors.white, fontSize: 15)),
                )
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.offAll(() => const LoginPage());
                      },
                      child: const Text('Login',
                          style: TextStyle(color: Colors.blue))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }
}
