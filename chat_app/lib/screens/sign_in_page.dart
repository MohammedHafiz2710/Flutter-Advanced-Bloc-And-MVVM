import 'package:chat_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/register_page.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInPage extends StatelessWidget {
  bool isLoading = false;
  static String id = 'SignInPage';

  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          isLoading = false;
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
        } else if (state is LoginFailure) {
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
                      "assets/images/scholar.png",
                      height: 100,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Scholar Chat",
                      style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Pacifico"),
                    ),
                    SizedBox(height: 70),
                    SizedBox(width: double.infinity, child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
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
                          BlocProvider.of<AuthBloc>(context).add(LoginEvent(email: email!, password: password!));
                        }
                      },
                      label: "Login",
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: TextStyle(color: Colors.white)),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, RegisterPage.id);
                            },
                            child: Text("Sign Up", style: TextStyle(color: Color(0xffC7EDE6), fontWeight: FontWeight.bold))),
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
