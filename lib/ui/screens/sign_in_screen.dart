part of 'screens.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text("Sign in"),
            onPressed: () async {
              // context
              //     .read<AuthCubit>()
              //     .signIn(email: "intan@gmail.com", password: "123456");
              SignInSignUpResult result =
                  await AuthServices.signIn("intan@gmail.com", "123456");
              if (result.user != null) {
                print("Berhasil");
              } else {
                print("GAGAL");
              }
            },
          ),
          //SIGN IN BUTTON
          // child: BlocConsumer<AuthCubit, AuthState>(
          //   listener: (context, state) {
          //     if (state is AuthSuccess) {
          //       Navigator.pushNamedAndRemoveUntil(
          //           context, '/main-screen', (route) => false);
          //     } else if (state is AuthFailed) {
          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //           backgroundColor: Colors.red, content: Text(state.error)));
          //     }
          //   },
          //   builder: (context, state) {
          //     if (state is AuthLoading) {
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     return ElevatedButton(
          //       child: Text("Sign in"),
          //       onPressed: () {
          //         context
          //             .read<AuthCubit>()
          //             .signIn(email: "intan@gmail.com", password: "123456");
          //         // AuthServices.signIn("intan@gmail.com", "123456");
          //       },
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
