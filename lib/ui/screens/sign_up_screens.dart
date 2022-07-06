part of 'screens.dart';

class SignUpScreen extends StatefulWidget {
  final RegistrationData registrationData;
  const SignUpScreen({Key? key, required this.registrationData})
      : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    context
        .read<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor1)));
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToSplashPage());
        return new Future(() => false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            //* TOP SAFE AREA COLOR
            Container(
              color: mainColor,
              width: double.infinity,
            ),
            //* SIGN UP CONTENT
            SafeArea(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 22),
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
                                  "Create New\nAccount",
                                  style: blackTextFont.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 104,
                          child: Stack(
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: (widget.registrationData
                                                    .profileImage ==
                                                null
                                            ? AssetImage("assets/user_pic.png")
                                                as ImageProvider
                                            : FileImage(widget.registrationData
                                                .profileImage!)))),
                              ),
                              //* PROFILE PICTURE
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  onTap: () async {
                                    if (widget.registrationData.profileImage ==
                                        null) {
                                      widget.registrationData.profileImage =
                                          await getImage();
                                    } else {
                                      widget.registrationData.profileImage =
                                          null;
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage((widget
                                                        .registrationData
                                                        .profileImage) ==
                                                    null
                                                ? "assets/btn_add_photo.png"
                                                : "assets/btn_del_photo.png"))),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Full Name",
                              hintText: "Full Name"),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Email",
                              hintText: "Email"),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Password",
                              hintText: "Password"),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          obscureText: true,
                          controller: retypeController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Confirm Password",
                              hintText: "Confirm password"),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        //* BUTTON NEXT STEP to SIGNUP
                        GestureDetector(
                          onTap: () {
                            if (!(nameController.text.trim() != "" &&
                                emailController.text.trim() != "" &&
                                passwordController.text.trim() != "" &&
                                retypeController.text.trim() != "")) {
                              Flushbar(
                                borderRadius: 5,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                message: 'Please Fill all the field',
                                flushbarPosition: FlushbarPosition.TOP,
                                duration: Duration(milliseconds: 2050),
                                backgroundColor: redColor,
                              )..show(context);
                            } else if (passwordController.text !=
                                retypeController.text) {
                              Flushbar(
                                borderRadius: 5,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                message:
                                    'Miss match password and confimation password',
                                flushbarPosition: FlushbarPosition.TOP,
                                duration: Duration(milliseconds: 2050),
                                backgroundColor: redColor,
                              )..show(context);
                            } else if (passwordController.text.length < 6) {
                              Flushbar(
                                borderRadius: 5,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                message: 'Minimal password is 6 Character',
                                flushbarPosition: FlushbarPosition.TOP,
                                duration: Duration(milliseconds: 2050),
                                backgroundColor: redColor,
                              )..show(context);
                            } else if (!EmailValidator.validate(
                                emailController.text)) {
                              Flushbar(
                                borderRadius: 5,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                message: 'Wrong Formatted email address',
                                flushbarPosition: FlushbarPosition.TOP,
                                duration: Duration(milliseconds: 2050),
                                backgroundColor: redColor,
                              )..show(context);
                            } else {
                              widget.registrationData.name =
                                  nameController.text;
                              widget.registrationData.email =
                                  emailController.text;
                              widget.registrationData.password =
                                  passwordController.text;
                              //* GO TO Preference page
                              context.read<PageBloc>().add(
                                  GoToPreferencePage(widget.registrationData));
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: mainColor,
                            ),
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 29,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
