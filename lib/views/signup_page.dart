// import 'package:chatapp3/views/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/views/signin_page.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import '../utils/colors/colors.dart';
import '../widgets/button.dart';
import '../widgets/text_form_widget.dart';
import '../widgets/textwidget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final validatorEmail = ValidationBuilder().email().maxLength(50).build();
  final validatorPassword = ValidationBuilder().required("This field is required").minLength(2,"Password should be more than 2 characters ").maxLength(20,"Too much characters").build();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: w,
          height: h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/simp.png'),
            ),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12.withOpacity(0.6),
                borderRadius: BorderRadius.circular(18),
              ),
              height: h * 0.7,
              width: w * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      FittedBox(
                        child: TextWidget(color: Colors.white, fontSize: 25, text: "Create an account",fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      TextFormWidget(
                        hintText: 'Username',
                        labelText: 'Username',
                        borderRadius: 10,
                        filled: true,
                        filledColor: Colors.white30,
                        prefixIcon: const Icon(Icons.account_circle),
                        controller: userNameController,
                      ),
                      const SizedBox(height: 20),
                      TextFormWidget(
                          hintText: 'E-mail',
                          labelText: 'E-mail',
                          borderRadius: 10,
                          filled: true,
                          filledColor: Colors.white30,
                          prefixIcon: const Icon(Icons.account_circle),
                          controller: emailController),
                      const SizedBox(height: 20),
                      TextFormWidget(
                        hintText: "Password",
                        labelText: "Password",
                        filled: true,
                        filledColor: Colors.white30.withOpacity(0.5),
                        borderRadius: 10,
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(()=>_isObscure =! _isObscure);
                          },
                          icon: Icon(_isObscure? Icons.visibility:Icons.visibility_off),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        controller: passwordController,
                        obscureText: _isObscure,
                      ),
                      const SizedBox(height: 10),
                      Button(
                          text: "Create account",
                          onTap: () {
                            RegisterUser();
                            Future.delayed(const Duration(seconds: 6), () {
                              Get.to(const SignInPage());
                            });
                          },
                          backgroundColor: AppColors.purpleColor,
                      ),
                      const SizedBox(height:10),
                      InkWell(
                        onTap: () {
                          Get.to(const SignInPage());
                        },
                        child: const Text('Go to Sign-in Page'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future RegisterUser() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          const snackBar = SnackBar(
              content: Text("User created successfully"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // Get.to(const SignInPage());
        }
        else if(user == null) {
          const snack = SnackBar(content: Text('User not created'));
          ScaffoldMessenger.of(context).showSnackBar(snack);
        }
        return;
      });
    }on FirebaseAuthException catch(e){
      showDialog(
        context: context,
        builder: (context)=>
            AlertDialog(
              title: const Text("Failed to create user"),
              content: Text(e.message!),
              actions: [
                TextButton(
                  onPressed: (){
                    Get.back();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    }
  }
}


