part of 'screens.dart';

class SuccessScreens extends StatelessWidget {
  final Ticket ticket;
  final FlutixTransaction transaction;
  const SuccessScreens(
      {Key? key, required this.ticket, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: FutureBuilder(
            future: ticket != null
                ? processingTicketOrder(context)
                : processingTopUp(),
            builder: (_, snapshot) =>
                (snapshot.connectionState == ConnectionState.done)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            margin: EdgeInsets.only(bottom: 70),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ticket == null
                                        ? "assets/top_up_done.png"
                                        : "assets/ticket_done.png"))),
                          ),
                          Text(
                            (ticket == null) ? "Emm Yummy!" : "Happy Watching!",
                            style: blackTextFont.copyWith(fontSize: 20),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            (ticket == null)
                                ? "You have successfully\ntop up the wallet"
                                : "You have successfully\nbought the ticket",
                            textAlign: TextAlign.center,
                            style: blackTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                          Container(
                            height: 45,
                            width: 250,
                            margin: EdgeInsets.only(top: 70, bottom: 20),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              child: Text(
                                (ticket == null) ? "My Wallet" : "My Tickets",
                                style: whiteTextFont.copyWith(fontSize: 16),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Discover new movie?',
                                style: greyTextFont.copyWith(
                                    fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<PageBloc>().add(GoToMainPage());
                                },
                                child: Text(
                                  "Back to Home",
                                  style: purpleTextFont,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    : Center(
                        child: SpinKitFadingCircle(
                          color: mainColor,
                          size: 50,
                        ),
                      )),
      ),
    );
  }

  Future<void> processingTicketOrder(BuildContext context) async {
    context.read<UserBloc>().add(Purchase(amount: ticket.totalPrice));
    context
        .read<TicketBloc>()
        .add(BuyTicket(ticket: ticket, userID: transaction.userID));

    await FlutixTransactionServices.saveTransaction(transaction);
  }

  Future<void> processingTopUp() async {}
}
