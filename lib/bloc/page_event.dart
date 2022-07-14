part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistrationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToRegistrationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData registrationData;

  GoToPreferencePage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToAccountConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToMovieDetailPage extends PageEvent {
  final Movie movie;

  GoToMovieDetailPage({required this.movie});

  @override
  List<Object> get props => [movie];
}

class GoToSelectScheduleScreen extends PageEvent {
  final MovieDetail movieDetail;

  GoToSelectScheduleScreen({required this.movieDetail});

  @override
  List<Object> get props => [movieDetail];
}

class GoToSelectSeatScreen extends PageEvent {
  final Ticket ticket;

  GoToSelectSeatScreen({required this.ticket});

  @override
  List<Object> get props => [ticket];
}

class GoToCheckoutScreen extends PageEvent {
  final Ticket ticket;

  GoToCheckoutScreen({required this.ticket});

  @override
  List<Object> get props => [ticket];
}

class GoToSuccessScreen extends PageEvent {
  final Ticket ticket;
  final FlutixTransaction transaction;

  GoToSuccessScreen({required this.ticket, required this.transaction});

  @override
  List<Object> get props => [ticket, transaction];
}
