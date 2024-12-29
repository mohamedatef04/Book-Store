import 'package:bookly_application/core/constants.dart';
import 'package:bookly_application/features/login/presentation/widgets/custom_text_field.dart';
import 'package:bookly_application/features/onboarding/presentation/widgets/custom_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Create account and choose favorite menu',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      obsecureText: false,
                      hint: 'Your Name',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This Field is Required';
                        }
                        return null;
                      },
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
                      obsecureText: false,
                      hint: 'Your Email',
                      controller: emailController,
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
                      obsecureText: obsecureText,
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
                    Text(
                      'Password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      obsecureText: obsecureText,
                      hint: 'Confirm Password',
                      controller: confirmPasswordController,
                      icon: IconButton(
                          onPressed: () {
                            obsecureText = !obsecureText;
                            setState(() {});
                          },
                          icon: obsecureText
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This Field is Required';
                        } else if (value != passwordController.text.trim()) {
                          return 'Does\'t Match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CustomContainer(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              try {
                                await signup();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 1),
                                    backgroundColor: kPrimaryColor,
                                    content: Text(
                                      'Created Successfully',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 1),
                                      backgroundColor: kPrimaryColor,
                                      content: Text(
                                        'Week password',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  );
                                } else if (e.code == 'email-already-in-use') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 1),
                                      backgroundColor: kPrimaryColor,
                                      content: Text(
                                        'Already Exist',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  );
                                }
                              }
                              isLoading = false;
                              setState(() {});
                            }
                          },
                          containerText: 'Register'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account ? ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
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
    );
  }

  Future<void> signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
