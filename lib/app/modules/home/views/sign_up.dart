import 'package:FLUTTERPROJECT/app/models/login_cred_model.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/home_views.dart';
import 'package:FLUTTERPROJECT/app/provider/auth_appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();
  final LoginCredModel _loginCredModel = LoginCredModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Signup'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                //email textfield
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _loginCredModel.email = newValue,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  onSaved: (newValue) => _loginCredModel.password = newValue,
                  validator: (value) => value!.length < 6
                      ? 'Password must be at least 6 characters'
                      : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Creating user...')),
                      );

                      try {
                        bool result =
                            await AuthHelper.instance.signUpEmailPassword(
                          _loginCredModel.email!,
                          _loginCredModel.password!,
                        );

                        if (result) {
                          // User created successfully, navigate to the home screen
                        ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Create account')));
                          Get.to(() => HomeScreen());
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      }
                    }
                  },
                  child: const Text('Create account'),
                ),
                
              ],
            ),
          ),
        ));
  }
}
