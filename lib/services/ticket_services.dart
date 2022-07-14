part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection =
      FirebaseFirestore.instance.collection('tickets');
  static Future<void> saveTicket(String id, Ticket ticket) async {
    await ticketCollection.doc().set({
      'movieID': ticket.movieDetail.id,
      'userID': id,
      'theaterName': ticket.theater.name,
      'time': ticket.time.millisecondsSinceEpoch,
      'bookiingCode': ticket.bookingCode,
      'seats': ticket.seatsInString,
      'name': ticket.name,
      'totalPrice': ticket.totalPrice
    });
  }

  static Future<List<Ticket>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.get();

    var documents =
        snapshot.docs.where((document) => document.get('userID') == userId);

    List<Ticket> tickets = [];

    for (var document in documents) {
      MovieDetail movieDetail =
          await MovieServices.getDetails(document.get('movieID'));
      tickets.add(Ticket(
          seats: document.get('seats').toString().split(','),
          movieDetail: movieDetail,
          theater: Theater(name: document.get('theaterName')),
          time: DateTime.fromMicrosecondsSinceEpoch(document.get('time')),
          bookingCode: document.get('time'),
          totalPrice: document.get('totalPrice'),
          name: document.get('name')));
    }

    return tickets;
  }
}
