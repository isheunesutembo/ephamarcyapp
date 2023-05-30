import 'package:ephamarcyapp/controllers/authcontroller.dart';
import 'package:ephamarcyapp/pages/home.dart';
import 'package:ephamarcyapp/pages/register.dart';
import 'package:ephamarcyapp/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignIn extends ConsumerStatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  String email = "";
  String password = "";
  final  _formKey = GlobalKey<FormState>();
  signInWithEmailAndPassword( context,
       ref, String email, String password)  {
    ref
        .read(authControllerProvider.notifier)
        .signInWithEmailAndPassword(context,email, password);
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
            key: _formKey,
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
                    email=value;
                  }),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Email:",
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: const Icon(
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
                    password=value;
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
              SizedBox(
                height: 32,
              ),
              Center(
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        
                        
                        signInWithEmailAndPassword(context,ref,
                            email.trim(), password.trim());
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                            (route) => false);
                      },
                      child: Text("Sign In")),
                ),
              ),
            const  SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                        (route) => false);
                  },
                  child: Center(
                      child: Text(
                          "You have no account ? Click here to register",
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
