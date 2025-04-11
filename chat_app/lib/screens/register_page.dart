import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  static String id = 'RegisterPage';
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          isLoading = false;
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
        } else if (state is RegisterFailure) {
          isLoading = false;
          showSnackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    SizedBox(height: 70),
                    Image.asset(
                      kLogo,
                      height: 100,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Scholar Chat",
                      style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Pacifico"),
                    ),
                    SizedBox(height: 70),
                    SizedBox(width: double.infinity, child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
                    SizedBox(height: 10),
                    MyTextFormField(
                      onChanged: (data) {
                        email = data;
                      },
                      label: "Email",
                    ),
                    SizedBox(height: 10),
                    MyTextFormField(
                      onChanged: (data) {
                        password = data;
                      },
                      label: "Password",
                    ),
                    SizedBox(height: 10),
                    MyButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).registerUser(email: email!, password: password!);
                        }
                      },
                      label: "Sign in",
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have account? ", style: TextStyle(color: Colors.white)),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text("LogIn", style: TextStyle(color: Color(0xffC7EDE6), fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
