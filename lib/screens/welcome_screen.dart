import 'package:flutter/material.dart';
import 'package:rocket_io/screens/register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    
    final signInButton = SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 55.0,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Sign In', style: TextStyle(fontSize: 16.0),),
        ));

    final registrationButton = SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 55.0,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
          },
          child: const Text('Register', style: TextStyle(fontSize: 16.0),),
        ));

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.0,
              ),
              signInButton,
              SizedBox(
                height:30.0,
              ),
              registrationButton,
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
