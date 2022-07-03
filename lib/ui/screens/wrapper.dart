part of 'screens.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);
    if (firebaseUser == null) {
      return SignInScreen();
    } else {
      return MainScreen();
    }
  }
}

// class Wrapper extends StatefulWidget {
//   const Wrapper({Key? key}) : super(key: key);

//   @override
//   _WrapperState createState() => _WrapperState();
// }

// class _WrapperState extends State<Wrapper> {
//   // User? user = FirebaseAuth.instance.currentUser;
//   User? user = Provider.of<User>(context);

//   @override
//   Widget build(BuildContext context) {
//     if (user == null) {
//       return SignInScreen();
//     } else {
//       return MainScreen();
//     }
//     //   if (user == null) {
//     //     if (!(prevPageEvent is GoToSplashPage)) {
//     //       prevPageEvent = GoToSplashPage();
//     //       context.read<PageBloc>().add(prevPageEvent!);
//     //     }
//     //   } else {
//     //     if (!(prevPageEvent is GoToMainPage)) {
//     //       context.read<PageBloc>().add(prevPageEvent!);
//     //     }
//     //   }
//     //   return BlocBuilder<PageBloc, PageState>(
//     //       builder: (_, pageState) => (pageState is OnSplashPage)
//     //           ? SplashPage()
//     //           : (pageState is OnLoginPage)
//     //               ? SignInScreen()
//     //               : MainScreen());
//     // }
//   }
// }
