part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistrationPage extends PageState {
  final RegistrationData registrationData;

  OnRegistrationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnPreferencePage extends PageState {
  final RegistrationData registrationData;

  OnPreferencePage(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;

  OnAccountConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnMovieDetailPage extends PageState {
  final Movie movie;

  OnMovieDetailPage(this.movie);

  @override
  List<Object> get props => [movie];
}

class OnSelectScheduleScreen extends PageState {
  final MovieDetail movieDetail;

  OnSelectScheduleScreen({required this.movieDetail});

  @override
  List<Object> get props => [movieDetail];
}

class OnSelectSeatScreen extends PageState {
  final Ticket ticket;

  OnSelectSeatScreen({required this.ticket});

  @override
  List<Object> get props => [ticket];
}

class OnCheckoutScreen extends PageState {
  final Ticket ticket;

  OnCheckoutScreen({required this.ticket});

  @override
  List<Object> get props => [ticket];
}

class OnSuccessScreen extends PageState {
  final Ticket ticket;
  final FlutixTransaction transaction;

  OnSuccessScreen({required this.ticket, required this.transaction});

  @override
  List<Object> get props => [ticket, transaction];
}
