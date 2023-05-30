import 'package:ephamarcyapp/controllers/authcontroller.dart';
import 'package:ephamarcyapp/pages/signin.dart';
import 'package:ephamarcyapp/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Register extends ConsumerStatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  String email="";
  String password="";
  GlobalKey _globalKey=GlobalKey<FormState>();
   signUpWithEmailAndPassword(
      BuildContext context, WidgetRef ref, String email, String password) {
    ref
        .read(authControllerProvider.notifier)
        .signUpWithEmailAndPassword(context, email, password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Welcome To ePhamarcy",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  enableSuggestions: true,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: ((value) {
                    setState(() {
                      email=value;
                    });
                  }),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Email:",
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 20,
                    ),
                    alignLabelWithHint: true,
                  ),
                  validator: ((value) {
                    if (value!.isEmpty || !value.contains("@")) {
                      return "Invalid email address";
                    }
                    return null;
                  }),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  enableSuggestions: true,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: ((value) {
                    setState(() {
                      password=value;
                    });
                  }),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Password:",
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.password_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                    alignLabelWithHint: true,
                  ),
                  validator: ((value) {
                    if (value!.isEmpty || value.length < 8) {
                      return "Password is invalid or characters are less than 8";
                    }
                    return null;
                  }),
                ),
              ),
              SizedBox(height: 32,),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  enableSuggestions: true,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: ((value) {
                    setState(() {
                      password=value;
                    });
                  }),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Confirm Password:",
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.password_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                    alignLabelWithHint: true,
                  ),
                  validator: ((value) {
                    if (value!=password) {
                      return "Passwords do not match";
                    }
                    return null;
                  }),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(onPressed: () {
                  signUpWithEmailAndPassword(context,ref,email.trim().toString(),password.trim().toString());

                  }, child: Text("Register")),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignIn(),), (route) => false);
                  },
                  child: Center(
                      child: Text("l already have an account ! Sign In",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold))),
                ),
              )
            ]),
          ),
        )));
  }
}