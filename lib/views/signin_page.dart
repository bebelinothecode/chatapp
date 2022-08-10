// import 'package:chatapp3/views/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/views/signup_page.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import '../utils/colors/colors.dart';
import '../widgets/button.dart';
import '../widgets/text_form_widget.dart';
import '../widgets/textwidget.dart';
import 'homepage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final validatorEmail = ValidationBuilder().email().maxLength(50).build();
  final validatorPassword = ValidationBuilder().required("This field is required").minLength(2,"Password should be more than 2 characters ").maxLength(20,"Too much characters").build();
  bool _isObscure = true;
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
      body: _isLoading? const Center(child: CircularProgressIndicator()):SingleChildScrollView(
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
              height: h * 0.5,
              width: w * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  // key: _globalKey,
                  child: Column(
                    children: <Widget>[
                      TextWidget(color: Colors.white, fontSize: 25, text: "Sign-In",fontWeight: FontWeight.bold),
                      const SizedBox(height: 10),
                      TextFormWidget(
                        validator: validatorEmail,
                        hintText: 'Email',
                        labelText: 'Email',
                        borderRadius: 10,
                        filled: true,
                        filledColor: Colors.white30,
                        prefixIcon: const Icon(Icons.account_circle),
                        controller: emailController,
                      ),
                      const SizedBox(height: 20),
                      TextFormWidget(
                        hintText: "Password",
                        obscureText: _isObscure,
                        labelText: "Password",
                        filled: true,
                        filledColor: Colors.white30.withOpacity(0.5),
                        borderRadius: 10,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure? Icons.visibility:Icons.visibility_off),
                          onPressed: () {
                            setState(()=>_isObscure =! _isObscure);
                          },
                        ),
                        controller: passwordController,
                      ),
                      const SizedBox(height: 10),
                      Button(
                          text: "Sign In",
                          onTap: (){
                            signIn();
                          },
                          backgroundColor: AppColors.purpleColor
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Center(child: TextWidget(color: AppColors.whiteColor, fontSize: 14, text: "Dont have an account?")),
                          const SizedBox(width: 7),
                          InkWell(
                            onTap: (){
                              Get.to(() => const SignUpPage());
                            },
                            child: TextWidget(fontSize: 14, text: 'Register', color:AppColors.blueColor),
                          ),
                        ],
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
  Future signIn() async {
    setState(()=>
    _isLoading = true);
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if(user != null) {
          Get.to(const HomePage());
        }
      });
    } on FirebaseAuthException catch(error) {
      showDialog(
        context: context,
        builder: (context)=>
            AlertDialog(
              title: const Text("Failed to sign in"),
              content: Text(error.message!),
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
    setState((){_isLoading = false;});
  }
}
