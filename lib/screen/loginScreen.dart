import 'dart:convert';
import 'dart:html';
import 'dart:math';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odoo/odoo.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

enum LoginStatus {notSignIn , signIn}


class _LoginScreen extends State<LoginScreen> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;


  // final _key = new GlobalKey<FormState>();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool hidePassword = true;
  bool isApiCallProcess = false;

  late String email;
  late String password;

  // check() {
  //   final FormState form = _key.currentState;
  //   if (form.validate()) {
  //     form.save();
  //     login();
  //   }
  // }

  // login() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   final response = await http.get(
  //       Uri.parse("http://localhost:8069/api/auth/token"),
  //       headers: {"login": email, "password": password, "db": "test"});
  //
  //   final data = jsonDecode(response.body);
  //   String auth_token = data['access_token'];
  //   String name = data['name'];
  //   String phone = data['phone'].toString();
  //   String city = data['city'].toString();
  //   String street = data['street'].toString();
  //   int partnerid = data['partner_id'];
  //   // double coins = data['wk_website_loyalty_points'];
  //
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("connexion réussie"), backgroundColor: Colors.green));
  //     final result = response.body;
  //     print(result);
  //     setState(() {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => HomeScreen()),
  //       );
  //       savePref(auth_token);
  //       savePrefs(name);
  //       saveMail(email);
  //       savePass(password);
  //       savePhone(phone);
  //       saveCity(city);
  //       saveStreet(street);
  //       savePartner(partnerid);
  //       // saveCoin(coins);
  //     });
  //     loginToast("Bienvenue chez Wamia Tjik ");
  //   } else if (response.statusCode == 400) {
  //     // loginToast("Vérifier votre email et password");
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("connexion réussie"), backgroundColor: Colors.green));
  //   } else {
  //     // loginToast("Vérifier votre email et password");
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Les champs ne doit pas etre vide"), backgroundColor: AppColor.red));
  //   }
  // }

  login() async {
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Vérifier votre mail et votre mot de passe "), backgroundColor: Colors.red));
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Les champs ne doit pas etre vide"), backgroundColor: AppColor.red));
    }
  }
  loginToast(String toast) {
    return showTopSnackBar(
      context,
      toast == "Bienvenue chez Wamia Tjik "
          ? CustomSnackBar.success(
        message: toast,
      )
          : CustomSnackBar.error(
        message: toast,
      ),
    );
  }


  savePref(String auth_token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("auth_token", auth_token);
      preferences.commit();
    });
  }

  savePrefs(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("name", name);
      preferences.commit();
    });
  }

  saveMail(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("email", email);
      preferences.commit();
    });
  }

  savePass(String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("password", password);
      preferences.commit();
    });
  }

  savePhone(String phone) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("phone", phone);
      preferences.commit();
    });
  }

  saveCity(String city) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("city", city);
      preferences.commit();
    });
  }

  saveStreet(String street) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("street", street);
      preferences.commit();
    });
  }

  savePartner(int partnerid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("partner_id", partnerid);
      preferences.commit();
    });
  }

  // saveCoin(double coin) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     preferences.setDouble("wk_website_loyalty_points", coin);
  //     preferences.commit();
  //   });
  // }

  var value;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }


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


  // @override
  // Widget build(BuildContext context) {
  //   return ProgressHUD(
  //     child: _uiSetup(context),
  //     inAsyncCall: isApiCallProcess,
  //     opacity: 0.3,
  //   );
  // }

  @override
  // Widget _uiSetup(BuildContext context) {
  Widget build(BuildContext context) {
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
                    children: <Widget>[
                      Text(
                        "Login",
                        style: Helper
                            .getTheme(context)
                            .headline6,
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
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Entrer votre Email";
                            }
                          },
                          onSaved: (e) => email = e!,
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
                              contentPadding: const EdgeInsets.only(
                                  left: 50, top: 15),
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
                          validator: (e) {
                            if (e!.isEmpty) {
                              return "Entrer votre Password";
                            }
                          },
                          onSaved: (e) => password = e!,
                          controller: passwordControllor,
                          keyboardType: TextInputType.text,
                          // onSaved: (input) => requestModel!.password = input!,
                          // validator: (input) => input!.length < 3
                          //     ? "password should be more than 3 characters"
                          //     : null,
                          obscureText: hidePassword,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Entrer votre Password",
                              hintStyle: TextStyle(color: AppColor.placeholder),
                              contentPadding: const EdgeInsets.only(
                                  left: 40, top: 15),
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
                                icon: Icon(
                                    hidePassword ? Icons.visibility_off : Icons
                                        .visibility),

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
                            Text("vous n'avez pas de compte ?"),
                            RaisedButton(
                              onPressed: () {

                              },
                              child: Text(
                                "   Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
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
}
