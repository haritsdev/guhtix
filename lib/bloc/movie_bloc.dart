import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guhtix/model/models.dart';
import 'package:guhtix/services/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial());
  // MovieBloc(MovieState initialState) : super(initialState);

  @override
  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is FetchMovies) {
      List<Movie> movies = await MovieServices.getMovies(1);

      yield MovieLoaded(movies: movies);
    }
  }
}
