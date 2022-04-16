import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rocket_io/utils/utils.dart';
import 'dart:typed_data';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  Uint8List? _profileImage;


  void SelectImage() async {
    // With this video https://youtu.be/mEPm9w5QlJM?t=5307
    Uint8List imageTemp = await pickerImage(ImageSource.gallery);
    setState(() {
      _profileImage = imageTemp;
    });
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      controller: nameController,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
        hintText: 'Enter your name',
        labelText: 'Name *',
      ),
      onSaved: (String? value) {
        nameController.text = value!;
      },
      validator: (String? value) {
        return (value != null || value!.contains('@'))
            ? 'Make sure to enter your name correctly.'
            : null;
      },
    );
    final emailField = TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
        hintText: 'Enter your email',
        labelText: 'Email *',
      ),
      onSaved: (String? value) {
        emailController.text = value!;
      },
      validator: (String? value) {
        return (value != null) ? 'Please fill our this field' : null;
      },
    );
    final passwordField = TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.password),
        border: OutlineInputBorder(),
        hintText: 'Enter your password',
        labelText: 'Password *',
      ),
      onSaved: (String? value) {
        passwordController.text = value!;
      },
      validator: (String? value) {
        return (value != null) ? 'Please fill our this field' : null;
      },
    );
    final passwordConfirmationField = TextFormField(
      obscureText: true,
      controller: passwordConfirmationController,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.password_rounded),
        border: OutlineInputBorder(),
        hintText: 'Confirm your password',
        labelText: 'Confirm Password *',
      ),
      onSaved: (value) {
        passwordConfirmationController.text = value!;
      },
      validator: (String? value) {
        return (value != null) ? 'Please fill our this field' : null;
      },
    );
    final formButton = SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 55.0,
        child: ElevatedButton(
          onPressed: () {
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Here we go')),
              );
            }
          },
          child: const Text('Sign-Up!'),
        ));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundImage: _profileImage != null ? MemoryImage(_profileImage!) : null,
                      radius: 80.0,
                    ),
                    Positioned(
                      bottom: -10,
                      left: 105,
                      child: IconButton(
                        onPressed: () {
                          SelectImage();
                        },
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.black,
                          size: 35.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                nameField,
                SizedBox(
                  height: 30.0,
                ),
                emailField,
                SizedBox(
                  height: 30.0,
                ),
                passwordField,
                SizedBox(
                  height: 30.0,
                ),
                passwordConfirmationField,
                SizedBox(
                  height: 60.0,
                ),
                formButton,
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
