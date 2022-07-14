import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guhtix/model/models.dart';
import 'package:guhtix/services/services.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  // UserBloc() : super(UserInitial());
  TicketBloc() : super(TicketState(tickets: []));

  // @override
  // TicketState get initialState => TicketState(tickets: []);

  @override
  Stream<TicketState> mapEventToState(
    TicketEvent event,
  ) async* {
    if (event is BuyTicket) {
      await TicketServices.saveTicket(event.userID, event.ticket);

      List<Ticket> tickets = state.tickets + [event.ticket];
      yield TicketState(tickets: tickets);
    } else if (event is GetTickets) {
      List<Ticket> tickets = await TicketServices.getTickets(event.userID);

      yield TicketState(tickets: tickets);
    }
  }
}
