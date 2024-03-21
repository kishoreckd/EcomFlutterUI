import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:ecomflutter/common_widgets/primary_button.dart';
import 'package:ecomflutter/screens/Auth/login/loggin_success.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String routeName = '/sign_in';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignIn'),
      ),
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Sign in with your email and pasword',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(height: screenHeight * 0.06),
                const SignUpForm(),
                SizedBox(height: screenHeight * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: 'google-icon',
                      onPressed: () {},
                    ),
                    SocialCard(
                      icon: 'twitter',
                      onPressed: () {},
                    ),
                    SocialCard(
                      icon: 'facebook-2',
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an Account ?',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'SignUp',
                      style: TextStyle(
                        fontSize: 12,
                        color: primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final String icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(12),
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
              color: Color(0xFFF5F6F9), shape: BoxShape.circle),
          child: SvgPicture.asset("assets/icons/$icon.svg"),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;
  late bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter Your Email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                  child: SvgPicture.asset(
                    "assets/icons/Mail.svg",
                    height: 18,
                  ),
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              if (!EmailValidator.validate(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (value) {
              email = value!;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: _formKey.currentState?.validate() ?? false
                          ? Colors.green
                          : Colors.red),
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: "Password",
                hintText: "Enter Your Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                  child: SvgPicture.asset(
                    "assets/icons/Lock.svg",
                    height: 18,
                  ),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                activeColor: primaryColor,
                value: remember,
                onChanged: (onChanged) {
                  setState(() {
                    remember = onChanged!;
                  });
                },
              ),
              const Text("Remember Me"),
              const Spacer(),
              const Text(
                "ForgotPassword ?",
                style: TextStyle(decoration: TextDecoration.underline),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          PrimaryButton(
            text: 'Sign In',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamed(context, LogInSuccess.routeName);
              }
            },
          )
        ],
      ),
    );
  }
}
