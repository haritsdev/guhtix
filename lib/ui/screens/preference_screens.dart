part of 'screens.dart';

class PreferenceScreens extends StatefulWidget {
  final List<String> genres = [
    "Horror",
    "Music",
    "Action",
    "Drama",
    "War",
    "Crime"
  ];
  final List<String> language = ["Bahasa", "English", "Japanese", "Korean"];
  final RegistrationData registrationData;
  PreferenceScreens({Key? key, required this.registrationData})
      : super(key: key);

  @override
  State<PreferenceScreens> createState() => _PreferenceScreensState();
}

class _PreferenceScreensState extends State<PreferenceScreens> {
  final List<String> selectedGenres = [];
  String selectedLanguage = "English";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.registrationData.password = "";
        context
            .read<PageBloc>()
            .add(GoToRegistrationPage(widget.registrationData));
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: yellowColor,
              width: double.infinity,
            ),
            SafeArea(
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 56,
                          margin: EdgeInsets.only(top: 20, bottom: 4),
                          child: GestureDetector(
                              onTap: () {
                                widget.registrationData.password = "";
                                context.read<PageBloc>().add(
                                    GoToRegistrationPage(
                                        widget.registrationData));
                              },
                              child: Icon(Icons.arrow_back_rounded)),
                        ),
                        Text("Select Your Four\nFavourite Genres",
                            style: blackTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 16,
                        ),
                        Wrap(
                          spacing: 24,
                          runSpacing: 24,
                          children: generateGenreWidgets(context),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text("Movie Language\nYou Prefer?",
                            style: blackTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 16,
                        ),
                        Wrap(
                          spacing: 24,
                          runSpacing: 24,
                          children: generateLangWidgets(context),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        //* NEXT BUTTON REGISTER STEP
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              if (selectedGenres.length != 4) {
                                Flushbar(
                                  borderRadius: 5,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  message: 'Please select 4 genres',
                                  flushbarPosition: FlushbarPosition.TOP,
                                  duration: Duration(milliseconds: 2050),
                                  backgroundColor: redColor,
                                )..show(context);
                              } else {
                                widget.registrationData.selectedGenres =
                                    selectedGenres;
                                widget.registrationData.selectedLang =
                                    selectedLanguage;
                                context.read<PageBloc>().add(
                                    GoToAccountConfirmationPage(
                                        widget.registrationData));
                              }
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: mainColor),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateGenreWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.genres
        .map((e) => SelectableBox(
              text: e,
              onTap: () {
                onSelectGenre(e);
              },
              width: width,
              textStyle: blackTextFont,
              isSelected: selectedGenres.contains(e),
            ))
        .toList();
  }

  List<Widget> generateLangWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.language
        .map((e) => SelectableBox(
            text: e,
            width: width,
            textStyle: blackTextFont,
            isSelected: selectedLanguage == e,
            onTap: () {
              setState(() {
                selectedLanguage = e;
              });
            }))
        .toList();
  }

  void onSelectGenre(String genre) {
    if (selectedGenres.contains(genre)) {
      setState(() {
        selectedGenres.remove(genre);
      });
    } else {
      if (selectedGenres.length < 4) {
        setState(() {
          selectedGenres.add(genre);
        });
      }
    }
  }
}
