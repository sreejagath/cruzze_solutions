import 'package:cruzze_solutions/controller/login_controller.dart';
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
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: 'Enter email',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width*0.7,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
                ),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    auth.forgotPassword(email.text).then((value){
                      print(value.message);
                      Get.snackbar(value.message, value.message,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        borderRadius: 20,
                        margin: EdgeInsets.all(10),
                        borderColor: Colors.green,
                        borderWidth: 2,
                        duration: Duration(seconds: 2),
                        colorText: Colors.white,
                      );
                      // showToast(value.message.toString());
                    });
                  },
                  child: Text('Submit', style: const TextStyle(color: Colors.white, fontSize: 15)),
                )
              )
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
