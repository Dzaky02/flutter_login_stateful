import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  var email = '';
  var password = '';
  var message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                emailField(),
                passwordField(),
                SizedBox(height: 25.0),
                submitButton(),
                SizedBox(height: 25.0),
                // Text('Email : $email\nPassword : $password'),
                Text('$message'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: (value) {
        // return null if valid
        // return string error message if not valid
        if (value != null) {
          if (value.isEmpty) {
            return 'Please enter a your email address';
          } else if (value.isNotEmpty && !value.contains('@')) {
            return 'Please enter a valid email';
          }
        }
      },
      onSaved: (newValue) {
        // setState(() {
        //   email = newValue!;
        // });
        email = newValue!;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter Password',
      ),
      validator: (value) {
        // return null if valid
        // return string error message if not valid
        if (value != null && value.length < 4) {
          return 'Password must be at least 4 characters';
        }
      },
      onSaved: (newValue) {
        // setState(() {
        //   password = newValue!;
        // });
        password = newValue!;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();

          setState(() {
            message = 'Time to post $email and $password to my API';
          });
        }
      },
      child: Text('Submit'),
      style: ElevatedButton.styleFrom(
        primary: Colors.teal,
      ),
    );
  }
}
