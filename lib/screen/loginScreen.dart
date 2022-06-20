import 'dart:convert';
import 'dart:html';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odoo/odoo.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:signin_signup/const/colors.dart';
import 'package:signin_signup/models/login_model.dart';
import 'package:signin_signup/screen/HomeScreen.dart';
import 'package:signin_signup/screen/signUpScreen.dart';
import 'package:signin_signup/services/login_service.dart';
import 'package:signin_signup/utils/helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../main.dart';
import '../widgets/ProgressHUD.dart';
import '../widgets/customTextInput.dart';
import 'forgetPwScreen.dart';
import 'introScreen.dart';
import 'landingScreen.dart';
import 'package:form_field_validator/form_field_validator.dart';


var session = FlutterSession();

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  // static final GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;

  // @override
  // void initState() {
  //   super.initState();
  //   loginRequestModel = new LoginRequestModel();
  // }

  // Future<UserLogin> getId() async {
  //   http.Response futureId = await http.get('http://localhost:8069/api/auth/token');
  //   if(futureId.statusCode ==200){
  //     return UserLogin.fromJson(json.decoder(futureId.body));
  //   } else{
  //     throw Exception('error');
  //   }
  // }


  bool _validate = false;
  var emailController = TextEditingController();
  var passwordControllor = TextEditingController();

  UserLogin get partnerId => partnerId;


  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  @override
  Widget _uiSetup(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.bgcolor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ),
        body: Container(
          height: Helper.getScreenHeight(context),
          width: Helper.getScreenWidth(context),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 40,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  child: Column(
                    children:<Widget> [
                      Text(
                        "Login",
                        style: Helper.getTheme(context).headline6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Add your details to Login'),
                      SizedBox(height: 50),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: AppColor.placeholderBg,
                          shape: StadiumBorder(),
                        ),
                        child: new TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          // onSaved: (input) => requestModel!.email = input!,
                          // validator: (input) => input!.contains('@')
                          //     ? "email Id should be valid"
                          //     : null,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Entrer votre Email",
                              hintStyle: TextStyle(color: AppColor.placeholder),
                              contentPadding: const EdgeInsets.only(left: 50, top: 15),
                              prefixIcon: Icon(
                                Icons.email,
                                color: AppColor.red,
                              )),
                        ),
                      ),
                      // CustomTextInput(
                      //   hintText: "Your Email",
                      //
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: AppColor.placeholderBg,
                          shape: StadiumBorder(),
                        ),
                        child: new TextFormField(
                          controller: passwordControllor,
                          keyboardType: TextInputType.text,
                          // onSaved: (input) => requestModel!.password = input!,
                          validator: (input) => input!.length < 3
                              ? "password should be more than 3 characters"
                              : null,
                          obscureText: hidePassword,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Entrer votre Password",
                              hintStyle: TextStyle(color: AppColor.placeholder),
                              contentPadding: const EdgeInsets.only(left: 40, top: 15),
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
                              icon: Icon(hidePassword? Icons.visibility_off: Icons.visibility),

                            )
                          ),
                        ),
                      ),
                      // CustomTextInput(
                      //   hintText: "Your Password",
                      // ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(StadiumBorder(
                              side: BorderSide(color: AppColor.red, width: 1.5),
                            )),
                          ),
                          onPressed: () {
                            login();

                          },
                          // onPressed: () async {
                          //   // Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
                          //   try {
                          //     final session = await orpc.authenticate('test',
                          //         'ichrakgara3012@gmail.com', 'ichrak3012');
                          //
                          //     //odoo.connect(Credential("ichrakgara3012@gmail.com", "ichrak3012"));
                          //     Navigator.of(context)
                          //         .pushReplacementNamed(IntroScreen.routeName);
                          //   } catch (e) {
                          //     print('error');
                          //   }
                          // },
                          //******
                          // onPressed: () {
                          //   if (usernameController != null &&
                          //       usernameController.text == "a@aa.com" &&
                          //       passwordControllor != null &&
                          //       passwordControllor.text == "1234") {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => IntroScreen()));
                          //   } else {
                          //     print('erreur');
                          //   }
                          // },


                          //****************** request response methode ****************
                          // onPressed: () {
                          //   if(validateAndSave()){
                          //     print(requestModel!.toJson());
                          //     setState(() {
                          //       isApiCallProcess = true;
                          //     });
                          //     ApiService apiService = new ApiService();
                          //     apiService.login(requestModel!).then((value) {
                          //       setState(() {
                          //         isApiCallProcess = false;
                          //       });
                          //       if (value.token.isNotEmpty){
                          //         final snackBar = SnackBar(content: Text("login Successfull"),
                          //         );
                          //         scaffoldKey.currentState?.showSnackBar(snackBar);
                          //       }
                          //       else {
                          //         final snackBar = SnackBar(content: Text(value.error),
                          //         );
                          //         scaffoldKey.currentState?.showSnackBar(snackBar);
                          //       }
                          //     });
                          //     print(requestModel!.toJson());
                          //   }
                          // },
                          child: Text("Login"),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(ForgetPwScreen.routeName);
                        },
                        child: Text(
                          "Forget your password",
                          style: TextStyle(
                            color: Color(0xFF367FC0),
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Or Login With",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                              Color(0xFF367FC0),
                            )),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/fb.png"),
                                SizedBox(
                                  width: 30,
                                ),
                                Text("Login With Facebook")
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                              Colors.lightGreen,
                            )),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/google.png"),
                                SizedBox(
                                  width: 30,
                                ),
                                Text("Login With Google")
                              ],
                            )),
                      ),
                      SizedBox(height: 150),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(SignUpScreen.routeName);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have an Account ?"),
                            Text(
                              "   Sign Up",
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
            ),
          ),
        )
    );
  }

  Future<void> login() async {
    if(passwordControllor.text.isNotEmpty && emailController.text.isNotEmpty){
      var response = await http.post(Uri.parse('http://localhost:8069/api/auth/token'),
      //var response = await http.post(Uri.parse('https://reqres.in/api/login'),
        headers: <String, String>{
          'db': 'test',
          'login': emailController.text,
          'password': passwordControllor.text,
        },
      );
      if(response.statusCode==200){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("connexion réussie"), backgroundColor: Colors.green));
        final result = response.body;
        print(result);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("les champs sont invalid"), backgroundColor: AppColor.red));
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Les champs ne doit pas etre vide"), backgroundColor: AppColor.red));
    }
  }
}
