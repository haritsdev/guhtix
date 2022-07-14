part of 'screens.dart';

class CheckoutScreen extends StatefulWidget {
  final Ticket ticket;
  const CheckoutScreen({Key? key, required this.ticket}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    int total = 25000 * widget.ticket.seats.length + 5000;
    return WillPopScope(
        onWillPop: () async {
          context
              .read<PageBloc>()
              .add(GoToSelectSeatScreen(ticket: widget.ticket));
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
                  Stack(
                    children: [
                      //* BACK BUTTON
                      Row(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: defaultMargin),
                            padding: EdgeInsets.all(1),
                            child: GestureDetector(
                              onTap: () {
                                context.read<PageBloc>().add(
                                    GoToSelectSeatScreen(
                                        ticket: widget.ticket));
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //* NOTE PAGE TITLE
                      BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                        UserModel user = (userState as UserLoaded).user;
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  "Checkout\nMovie",
                                  style: blackTextFont.copyWith(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              //* MOVIE DESCRIPTION
                              Row(
                                children: [
                                  Container(
                                    width: 70,
                                    height: 90,
                                    margin: EdgeInsets.only(
                                        left: defaultMargin, right: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: NetworkImage(imageBaseUrl +
                                                'w342' +
                                                widget.ticket.movieDetail
                                                    .posterPath),
                                            fit: BoxFit.cover)),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                90,
                                        child: Text(
                                          widget.ticket.movieDetail.title,
                                          style: blackTextFont.copyWith(
                                              fontSize: 18),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                90,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 6),
                                        child: Text(
                                          widget.ticket.movieDetail
                                              .genresAndLanguage,
                                          style: greyTextFont.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      RatingStars(
                                          color: accentColor3,
                                          voteAverage: widget
                                              .ticket.movieDetail.voteAverage,
                                          starSize: 20)
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: defaultMargin),
                                child: Divider(
                                  color: Color(0xFFE4E4E4),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Order ID',
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(widget.ticket.bookingCode,
                                        style: whiteNumberFont.copyWith(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Cinema',
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: Text(widget.ticket.theater.name,
                                          textAlign: TextAlign.end,
                                          style: whiteNumberFont.copyWith(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date & Time',
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(widget.ticket.time.dateAndTime,
                                        style: whiteNumberFont.copyWith(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Seat Number',
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: Text(widget.ticket.seatsInString,
                                          textAlign: TextAlign.end,
                                          style: whiteNumberFont.copyWith(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Price',
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: Text(
                                          "IDR 25.000 x ${widget.ticket.seats.length}",
                                          textAlign: TextAlign.end,
                                          style: whiteNumberFont.copyWith(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Fee',
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: Text("IDR 5.000",
                                          textAlign: TextAlign.end,
                                          style: whiteNumberFont.copyWith(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: Text(
                                          NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  decimalDigits: 0,
                                                  symbol: 'IDR ')
                                              .format(total),
                                          textAlign: TextAlign.end,
                                          style: whiteNumberFont.copyWith(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: defaultMargin),
                                child: Divider(
                                  color: Color(0xFFE4E4E4),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Your Wallet',
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: Text(
                                          NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  decimalDigits: 0,
                                                  symbol: 'IDR ')
                                              .format(user.balance),
                                          textAlign: TextAlign.end,
                                          style: whiteNumberFont.copyWith(
                                              color: (user.balance) >= total
                                                  ? Color(0xFF3E9D9D)
                                                  : Color(0xFFFF5C83),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 46,
                                margin: EdgeInsets.only(top: 36, bottom: 50),
                                child: TextButton(
                                  onPressed: () {
                                    if (user.balance >= total) {
                                      // * UANG CUKUP
                                      FlutixTransaction transaction =
                                          FlutixTransaction(
                                              userID: user.id,
                                              title: widget
                                                  .ticket.movieDetail.title,
                                              subtitle:
                                                  widget.ticket.theater.name,
                                              time: DateTime.now(),
                                              picture: widget.ticket.movieDetail
                                                  .posterPath);
                                      context.read<PageBloc>().add(
                                          GoToSuccessScreen(
                                              ticket: widget.ticket
                                                  .copyWith(totalPrice: total),
                                              transaction: transaction));
                                    } else {
                                      //* UANG TIDAK CUKUP
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      backgroundColor: user.balance >= total
                                          ? Color(0xFF3E9D9D)
                                          : mainColor),
                                  child: Text(
                                      user.balance >= 0
                                          ? 'Checkout Now'
                                          : 'Topup my wallet',
                                      style: whiteTextFont.copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                      )),
                                ),
                              )
                            ]);
                      }),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
