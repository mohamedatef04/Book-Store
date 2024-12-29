import 'package:bookly_application/core/constants.dart';
import 'package:bookly_application/features/login/presentation/widgets/custom_signin_container.dart';
import 'package:bookly_application/features/login/presentation/widgets/custom_text_field.dart';
import 'package:bookly_application/features/onboarding/presentation/widgets/custom_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: IconButton(
                        onPressed: () => GoRouter.of(context).pop(),
                        icon: Icon(Icons.arrow_back_ios),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Welcome Back 👋',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Sign to your account',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hint: 'Your Email',
                      controller: emailController,
                      obsecureText: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This Field is Required';
                        } else if (!value.contains('@')) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hint: 'Your Password',
                      icon: IconButton(
                          onPressed: () {
                            obsecureText = !obsecureText;
                            setState(() {});
                          },
                          icon: obsecureText
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                      controller: passwordController,
                      obsecureText: obsecureText,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This Field is Required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () =>
                          GoRouter.of(context).push('/ResetPasswordView'),
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: CustomContainer(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            try {
                              await signIn();
                              GoRouter.of(context).push('/HomeView');
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'invalid-credential') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 1),
                                    backgroundColor: kPrimaryColor,
                                    content: Text(
                                      'Invalid Email or Password',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              }
                            }
                            isLoading = false;
                            setState(() {});
                          } else {}
                        },
                        containerText: 'LogIn',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account ? ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push('/SignupView');
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      thickness: 0.5,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomSigninContainer(
                      image: 'assets/images/Google - Original.png',
                      text: '   Sign in With Google',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomSigninContainer(
                      image: 'assets/images/Apple - Original.png',
                      text: '   Sign in With Apple',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
