import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guhtix/model/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc(OnInitialPage initialState) : super(initialState);

  // @override
  // PageState get initialState => OnInitialPage();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToRegistrationPage) {
      yield OnRegistrationPage(event.registrationData);
    } else if (event is GoToPreferencePage) {
      yield OnPreferencePage(event.registrationData);
    } else if (event is GoToAccountConfirmationPage) {
      yield OnAccountConfirmationPage(event.registrationData);
    } else if (event is GoToMovieDetailPage) {
      yield OnMovieDetailPage(event.movie);
    } else if (event is GoToSelectScheduleScreen) {
      yield OnSelectScheduleScreen(movieDetail: event.movieDetail);
    }
  }
}
