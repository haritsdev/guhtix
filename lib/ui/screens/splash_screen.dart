part of 'screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<PageBloc>().add(GoToLoginPage());
          },
          child: Text('Go to sign in page'),
        ),
      ),
    );
  }
}
