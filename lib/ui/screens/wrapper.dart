part of 'screens.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);
    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        BlocProvider.of<PageBloc>(context).add(GoToSplashPage());
      }

      // context.watch<PageBlog>().add(GoToSplashPage());
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        BlocProvider.of<UserBloc>(context).add(LoadUser(firebaseUser.uid));
        prevPageEvent = GoToMainPage();
        BlocProvider.of<PageBloc>(context).add(GoToMainPage());
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashScreen()
            : (pageState is OnLoginPage)
                ? SignInScreen()
                : (pageState is OnRegistrationPage)
                    ? SignUpScreen(registrationData: pageState.registrationData)
                    : (pageState is OnPreferencePage)
                        ? PreferenceScreens(
                            registrationData: pageState.registrationData)
                        : (pageState is OnAccountConfirmationPage)
                            ? AccountConfirmationScreen(
                                registrationData: pageState.registrationData)
                            : (pageState is OnMovieDetailPage)
                                ? MovieDetailScreens(pageState.movie)
                                : (pageState is OnSelectScheduleScreen)
                                    ? SelectScheduleScreens(
                                        movieDetail: pageState.movieDetail)
                                    : (pageState is OnSelectSeatScreen)
                                        ? SelectSeatScreen(
                                            ticket: pageState.ticket)
                                        : (pageState is OnCheckoutScreen)
                                            ? CheckoutScreen(
                                                ticket: pageState.ticket)
                                            : (pageState is OnSuccessScreen)
                                                ? SuccessScreens(
                                                    ticket: pageState.ticket,
                                                    transaction:
                                                        pageState.transaction)
                                                : MainScreen());
  }
}
