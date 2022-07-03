part of 'screens.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Go To Sign in page"),
          onPressed: () {
            context.read<PageBloc>().add(GoToLoginPage());
          },
        ),
      ),
    );
  }
}
