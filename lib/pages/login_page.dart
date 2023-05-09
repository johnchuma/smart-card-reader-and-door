// ignore_for_file: must_be_immutable

import 'package:cardscanner/controller/client_controller.dart';
import 'package:cardscanner/pages/widgets/heading.dart';
import 'package:cardscanner/pages/widgets/paragraph.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          elevation: 1,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        heading("Cardscanner management system"),
                      ],
                    ),
                    heading("Login",
                        fontWeight: FontWeight.normal,
                        size: 14,
                        color: Colors.grey),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == "") {
                          return "Please enter email address";
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: "Email address"),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == "") {
                          return "Please enter password";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: "Password"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          ClientController().login(
                              emailController.text, passwordController.text);
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: paragraph("Login", color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
