part of 'screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 136,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/logo.png'))),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: Text(
                "New Experience",
                style: blackTextFont.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Watch a new movie much\neasier than any before",
              style: greyTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 25),
              child: CustomButton(
                title: 'Get Started',
                onPressed: () {
                  context
                      .read<PageBloc>()
                      .add(GoToRegistrationPage(RegistrationData()));
                },
                fontSize: 16,
                width: 250,
                height: 46,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: greyTextFont.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<PageBloc>().add(GoToLoginPage());
                  },
                  child: Text(
                    "Sign in",
                    style: purpleTextFont.copyWith(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
