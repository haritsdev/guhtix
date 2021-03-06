part of 'screens.dart';

class SelectScheduleScreens extends StatefulWidget {
  final MovieDetail movieDetail;

  SelectScheduleScreens({required this.movieDetail});

  @override
  State<SelectScheduleScreens> createState() => _SelectScheduleScreensState();
}

class _SelectScheduleScreensState extends State<SelectScheduleScreens> {
  List<DateTime>? dates;
  DateTime? selectedDate;
  int? selectedTime;
  Theater? selectedTheater;
  bool isValid = false;

  @override
  void initState() {
    super.initState();

    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));

    selectedDate = dates![0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .read<PageBloc>()
            .add(GoToMovieDetailPage(movie: widget.movieDetail));
        return false;
      },
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            color: accentColor1,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          ListView(
            children: [
              //*note BACK BUTTON
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: defaultMargin),
                    padding: EdgeInsets.all(1),
                    child: GestureDetector(
                      onTap: () {
                        context.read<PageBloc>().add(
                            GoToMovieDetailPage(movie: widget.movieDetail));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              //*note CHOOSE DATE
              Container(
                  margin: EdgeInsets.fromLTRB(
                      defaultMargin, 20, defaultMargin, 16)),
              Container(
                margin: EdgeInsets.only(bottom: 24),
                height: 90,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates!.length,
                    itemBuilder: (_, index) => Container(
                          margin: EdgeInsets.only(
                              left: (index == 0) ? defaultMargin : 0,
                              right: (index < dates!.length - 1)
                                  ? 16
                                  : defaultMargin),
                          child: DateCard(
                            onTap: () {
                              setState(() {
                                selectedDate = dates![index];
                              });
                            },
                            date: dates![index],
                            isSelected: selectedDate == dates![index],
                          ),
                        )),
              )

              //*NOTE CHOOSE TIME
              ,
              generateTimeTable(),
              //*note NEXT BUTTON
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                    return FloatingActionButton(
                      elevation: 0,
                      onPressed: () {
                        if (isValid) {
                          context.read<PageBloc>().add(GoToSelectSeatScreen(
                              ticket: Ticket(
                                  movieDetail: widget.movieDetail,
                                  theater: selectedTheater!,
                                  time: DateTime(
                                      selectedDate!.year,
                                      selectedDate!.month,
                                      selectedDate!.day,
                                      selectedTime!),
                                  bookingCode: randomNumeric(12).toUpperCase(),
                                  seats: [],
                                  name: (userState as UserLoaded).user.name,
                                  totalPrice: 0)));
                        }
                      },
                      backgroundColor: mainColor,
                      child: Icon(Icons.arrow_forward,
                          color: isValid ? Colors.white : Color(0xFFBEBEBE)),
                    );
                  },
                ),
              )
            ],
          )
        ],
      )),
    );
  }

  Column generateTimeTable() {
    List<int> schedule = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];

    for (var theater in dummyTheaters) {
      widgets.add(Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
          child:
              Text(theater.name, style: blackTextFont.copyWith(fontSize: 20))));

      widgets.add(
        Container(
          height: 50,
          margin: EdgeInsets.only(
            bottom: 30,
          ),
          child: ListView.builder(
              itemCount: schedule.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.only(
                        left: (index == 0) ? defaultMargin : 0,
                        right:
                            (index < schedule.length - 1) ? 16 : defaultMargin),
                    child: SelectableBox(
                      text: "${schedule[index]}:00",
                      onTap: () {
                        setState(() {
                          selectedTheater = theater;
                          selectedTime = schedule[index];
                          isValid = true;
                        });
                      },
                      isSelected: selectedTheater == theater &&
                          selectedTime == schedule[index],
                      isEnabled: schedule[index] > DateTime.now().hour ||
                          selectedDate!.day != DateTime.now().day,
                    ),
                  )),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
