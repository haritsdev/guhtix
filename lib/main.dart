import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guhtix/bloc/blocs.dart';
import 'package:guhtix/services/services.dart';
import 'package:guhtix/ui/screens/screens.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Wrapper(),
    // );

    return StreamProvider<User?>.value(
      value: AuthServices.userStream,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider.value(
//         initialData: null,
//         value: AuthServices.userStream,
//         // providers: [BlocProvider(create: (_) => PageBloc(OnInitialPage()))],
//         child: MaterialApp(debugShowCheckedModeBanner: false, home: Wrapper()));
//   }
// }

