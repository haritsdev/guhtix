part of 'screens.dart';

class AccountConfirmationScreen extends StatefulWidget {
  final RegistrationData registrationData;

  const AccountConfirmationScreen({Key? key, required this.registrationData})
      : super(key: key);

  @override
  State<AccountConfirmationScreen> createState() =>
      _AccountConfirmationScreenState();
}

class _AccountConfirmationScreenState extends State<AccountConfirmationScreen> {
  bool isSignUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .read<PageBloc>()
              .add(GoToPreferencePage(widget.registrationData));
          return false;
        },
        child: Scaffold(
            body: Stack(
          children: [
            Container(
              width: double.infinity,
              color: yellowColor,
            ),
            SafeArea(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: ListView(
                  children: [
                    //*HEADER
                    Column(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 20, bottom: 90),
                            height: 56,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                      onTap: () {
                                        context
                                            .read<PageBloc>()
                                            .add(GoToSplashPage());
                                      },
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,
                                      )),
                                ),
                                //* TITLE
                                Center(
                                  child: Text(
                                    "Confirm\nNew Account",
                                    style: blackTextFont.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.only(bottom: 25),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        (widget.registrationData.profileImage ==
                                                null)
                                            ? AssetImage("assets/user_pic.png")
                                                as ImageProvider
                                            : FileImage(widget.registrationData
                                                .profileImage!),
                                    fit: BoxFit.cover))),
                        Text(
                          "Welcome",
                          style: blackTextFont.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${widget.registrationData.name}',
                          textAlign: TextAlign.center,
                          style: blackTextFont.copyWith(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 110,
                        ),
                        (isSignUp)
                            ? SpinKitFadingCircle(
                                color: Color(0xFF3E9D9D),
                                size: 45,
                              )
                            : SizedBox(
                                width: 250,
                                height: 45,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      backgroundColor: Color(0xFF3E9D9D)),
                                  onPressed: () async {
                                    setState(() {
                                      isSignUp = true;
                                    });

                                    imageFileToUpload =
                                        widget.registrationData.profileImage;

                                    SignInSignUpResult result =
                                        await AuthServices.signUp(
                                            widget.registrationData.email,
                                            widget.registrationData.password,
                                            widget.registrationData.name,
                                            "user",
                                            widget.registrationData
                                                .selectedGenres,
                                            widget
                                                .registrationData.selectedLang);

                                    if (result.user == null) {
                                      setState(() {
                                        isSignUp = false;
                                      });

                                      Flushbar(
                                        borderRadius: 5,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 3),
                                        message: result.message,
                                        flushbarPosition: FlushbarPosition.TOP,
                                        duration: Duration(milliseconds: 2050),
                                        backgroundColor: redColor,
                                      )..show(context);
                                    }
                                  },
                                  child: Text(
                                    'Create My Account',
                                    style: whiteTextFont.copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
