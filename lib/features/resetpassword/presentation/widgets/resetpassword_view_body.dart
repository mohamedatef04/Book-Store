import 'package:bookly_application/features/login/presentation/widgets/custom_text_field.dart';
import 'package:bookly_application/features/onboarding/presentation/widgets/custom_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/quickalert.dart';

class ResetpasswordViewBody extends StatefulWidget {
  const ResetpasswordViewBody({super.key});

  @override
  State<ResetpasswordViewBody> createState() => _ResetpasswordViewBodyState();
}

class _ResetpasswordViewBodyState extends State<ResetpasswordViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
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
                    'Reset Password',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Please enter your email, we will send\nverification link to your email.',
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
                  Center(
                    child: CustomContainer(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});

                            try {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(
                                      email: emailController.text.trim());
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                text: 'Check Your Email',
                              );
                            } on Exception catch (e) {
                              print(e.toString());
                            }
                            isLoading = false;
                            setState(() {});
                          } else {}
                        },
                        containerText: 'Submit'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
