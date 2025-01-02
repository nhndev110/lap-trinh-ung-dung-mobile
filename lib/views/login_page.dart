import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test1/models/user_data.dart';
import 'package:test1/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? checkboxValue = true;

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 30),
        children: [
          LoginHeader(),
          LoginContent(),
        ],
      ),
    );
  }

  Widget LoginHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Column(
        children: [
          Text(
            "Login to access",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            "Sign in with your email and password or continue with social media",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget LoginContent() {
    return Column(
      children: [
        SizedBox(height: 60),
        LoginForm(),
        SizedBox(height: 60),
        SocialLoginButtons(),
        SizedBox(height: 60),
        SignUpPrompt(),
      ],
    );
  }

  Widget LoginForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Username",
                hintText: "Enter your username",
                suffixIcon: Icon(Icons.account_circle_outlined),
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter username";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                suffixIcon: Icon(Icons.lock_outline),
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter password";
                }
                return null;
              },
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: checkboxValue,
                      onChanged: (bool? value) {
                        setState(() {
                          checkboxValue = value!;
                        });
                      },
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                    ),
                    InkWell(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          checkboxValue = !checkboxValue!;
                        });
                      },
                      child: Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Processing Data..."),
                    ),
                  );

                  try {
                    UserData userData = await AuthService.login(
                      usernameController.text,
                      passwordController.text,
                    );

                    AuthService.userData = userData;

                    Navigator.pushNamed(
                      context,
                      '/profile',
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Login failed: ${e}"),
                      ),
                    );
                  }
                }
              },
              child: Text(
                "Continue",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(60),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget SocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.g_mobiledata,
              color: Colors.red,
              size: 32,
            ),
          ),
        ),
        SizedBox(width: 24),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.facebook,
              color: Colors.blue,
              size: 32,
            ),
          ),
        ),
        SizedBox(width: 24),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.apple,
              color: Colors.black,
              size: 32,
            ),
          ),
        ),
      ],
    );
  }

  Widget SignUpPrompt() {
    return Container(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
          text: "Don't have an account? ",
          children: [
            TextSpan(
              text: "Sign Up",
              style: TextStyle(
                color: Colors.blue,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
