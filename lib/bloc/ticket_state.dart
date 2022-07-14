part of 'ticket_bloc.dart';

class TicketState extends Equatable {
  final List<Ticket> tickets;
  const TicketState({required this.tickets});

  @override
  List<Object> get props => [tickets];
}
