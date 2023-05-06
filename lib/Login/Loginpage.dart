// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously, sort_child_properties_last, unused_import, file_names, unused_local_variable, unrelated_type_equality_checks

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Aasidebar/Navbar.dart';
import '../Dashboard/Components/DashPage.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final String _email = 'simransah314@gmail.com';
  final String _password = 'S@imi12345';
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (emailCtrl.value.text == _email &&
          passwordCtrl.value.text == _password) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CustomNavigation()));
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Login Failed'),
            content: Text('Incorrect email or password'),
            actions: [
              ElevatedButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // _email = 'simransah314@gmail.com';
    // _password = 'S@imi12345';
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final emailctrl = TextEditingController();
    // final passwordctrl = TextEditingController();
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
                      child: Form(
                        key: _formKey,
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
                              // onSaved: (value) => _email = value!,

                              controller: emailCtrl,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.mail),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Email',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              // onSaved: (value) => _password = value!,
                              controller: passwordCtrl,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.mail),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              // validator: FormBuilderValidators.compose(
                              //     [FormBuilderValidators.required()]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _submit();
                                // _submit;
                                // print('a');
                                // // User? user = await loginUsingEmailPassword(
                                // //     email: emailctrl.text,
                                // //     password: passwordctrl.text,
                                // //     context: context);
                                // // print(user);
                                // // if (user != null) {
                                // Navigator.of(context).pushReplacement(
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             CustomNavigation()));
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
                ),
              )
            ],
          )),
    );
  }
}
