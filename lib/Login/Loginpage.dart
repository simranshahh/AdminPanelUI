// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously, sort_child_properties_last, unused_import, file_names, unused_local_variable

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Dashboard/Components/DashPage.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final emailctrl = TextEditingController();
    final passwordctrl = TextEditingController();
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                height: height * 0.4,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45))),
              ),
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: Image.asset(
              //     'assets/whitelogo.png',
              //     height: 300,
              //     width: 200,
              //   ),
              // ),
              Center(
                child: Card(
                  child: Container(
                    height: 350,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Text(
                            'Login Page',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            //  textInputAction: TextInputAction.next,
                            // onSaved: (input) => user!.email = input,
                            //  controller: emailctrl,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Email',
                            ),
                            // validator: FormBuilderValidators.compose(
                            //     [FormBuilderValidators.required()]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            // onSaved: (input) => user!.email = input,
                            controller: passwordctrl,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Password',
                            ),
                            // validator: FormBuilderValidators.compose(
                            //     [FormBuilderValidators.required()]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // User? user = await loginUsingEmailPassword(
                              //     email: emailctrl.text,
                              //     password: passwordctrl.text,
                              //     context: context);
                              // print(user);
                              // if (user != null) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => DashPage()));
                            },
                            child: Text('Login'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.deepPurpleAccent,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
