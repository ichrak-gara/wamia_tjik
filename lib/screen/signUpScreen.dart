import 'dart:convert';

import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customTextInput.dart';
import 'HomeScreen.dart';
import 'landingScreen.dart';
import 'loginScreen.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hidePassword = true;
  bool isApiCallProcess = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.bgcolor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(LandingScreen.routeName);
            },
          ),
        ),
        body: Container(
          width: Helper.getScreenWidth(context),
          height: Helper.getScreenHeight(context),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: Helper.getTheme(context).headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Ajoutez vos coordonnées pour vous inscrire",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: AppColor.placeholderBg,
                      shape: StadiumBorder(),
                    ),
                    child: new TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Entrer votre Nom",
                          hintStyle: TextStyle(color: AppColor.placeholder),
                          contentPadding:
                              const EdgeInsets.only(left: 50, top: 15),
                          prefixIcon: Icon(
                            Icons.person_rounded,
                            color: AppColor.red,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: AppColor.placeholderBg,
                      shape: StadiumBorder(),
                    ),
                    child: new TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Entrer votre Email",
                          hintStyle: TextStyle(color: AppColor.placeholder),
                          contentPadding:
                              const EdgeInsets.only(left: 50, top: 15),
                          prefixIcon: Icon(
                            Icons.email,
                            color: AppColor.red,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: AppColor.placeholderBg,
                      shape: StadiumBorder(),
                    ),
                    child: new TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Entrer votre Numéro de téléphone",
                          hintStyle: TextStyle(color: AppColor.placeholder),
                          contentPadding:
                              const EdgeInsets.only(left: 50, top: 15),
                          prefixIcon: Icon(
                            Icons.call,
                            color: AppColor.red,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: AppColor.placeholderBg,
                      shape: StadiumBorder(),
                    ),
                    child: new TextFormField(
                      controller: addressController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Entrer votre Adresse",
                          hintStyle: TextStyle(color: AppColor.placeholder),
                          contentPadding:
                              const EdgeInsets.only(left: 50, top: 15),
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: AppColor.red,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: AppColor.placeholderBg,
                      shape: StadiumBorder(),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      // onSaved: (input) => requestModel!.password = input!,
                      validator: (input) => input!.length < 3
                          ? "le mot de passe doit comporter plus de 3 caractères"
                          : null,
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Entrer votre Password",
                          hintStyle: TextStyle(color: AppColor.placeholder),
                          contentPadding:
                              const EdgeInsets.only(left: 40, top: 15),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColor.red,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            color: AppColor.red.withOpacity(0.4),
                            icon: Icon(hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      color: AppColor.placeholderBg,
                      shape: StadiumBorder(),
                    ),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.text,
                      // onSaved: (input) => requestModel!.password = input!,
                      validator: (input) => input!.length < 3
                          ? "le mot de passe doit comporter plus de 3 caractères"
                          : null,
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confirmer votre Password",
                          hintStyle: TextStyle(color: AppColor.placeholder),
                          contentPadding:
                              const EdgeInsets.only(left: 40, top: 15),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColor.red,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            color: AppColor.red.withOpacity(0.4),
                            icon: Icon(hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(const StadiumBorder(
                          side: BorderSide(color: AppColor.red, width: 1.5),
                        )),
                      ),
                      onPressed: () {
                        Signup();
                      },
                      child: Text("Sign Up"),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Vous avez déjà un compte?",
                        ),
                        Text(
                          "   Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  Future<void> Signup() async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      var response = await http.post(
        Uri.parse('http://localhost:8069/register_user'),
        //var response = await http.post(Uri.parse('https://reqres.in/api/login'),
        // x@x.c
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          // 'db': 'test',
          'name': nameController.text,
          'login': emailController.text,
          'phone': phoneController.text,
          'address': addressController.text,
          'password': passwordController.text,
          'confirmPassword': confirmPasswordController.text
        }),
      );
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Bienvenue chez Wamia Food"),
            backgroundColor: Colors.green));
        final result = response.body;
        print(result);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("les champs sont invalid"),
            backgroundColor: AppColor.red));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Les champs ne doit pas etre vide"),
          backgroundColor: AppColor.red));
    }
  }
}
