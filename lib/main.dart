import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guhtix/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    SignInSignUpResult result = await AuthServices.signUp(
                        "intan@gmail.com",
                        "123456",
                        "Intan Anisa",
                        "user",
                        ["Action", "Horror"],
                        "Bahasa");
                    if (result.user == null) {
                      print(result.message);
                    } else {
                      print(result.user.toString());
                    }
                  },
                  child: Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}