part of 'services.dart';

class MovieServices {
  static Future<List<Movie>> getMovies(int page, {http.Client? client}) async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page&with_watch_monetization_types=flatrate',
    );

    var response = await http.get(url);

    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];

    return result.map((e) => Movie.fromJson(e)).toList();
  }

  static Future<MovieDetail> getDetails(Movie movie,
      {int? movieID, http.Client? client}) async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/movie/${movie.id}?api_key=$apiKey&language=en-US");

    var response = await client!.get(url);
    var data = json.decode(response.body);

    List genres = (data as Map<String, dynamic>)['genres'];
    String language;

    switch ((data as Map<String, dynamic>)['original_language'].toString()) {
      case 'ja':
        language = 'Japanese';
        break;
      case 'id':
        language = 'Indonesia';
        break;
      case 'ko':
        language = 'Korean';
        break;
      case 'en':
        language = 'English';
        break;
      default:
        language = 'Bahasa';
        break;
    }

    return movieID != null
        ? MovieDetail(movie,
            language: language,
            genres: genres
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList())
        : MovieDetail(movie,
            language: language,
            genres: genres
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList());
  }

  static Future<List<Credit>> getCredits(int movieID,
      {http.Client? client}) async {
    String url_ink =
        "https://api.themoviedb.org/3/movie/$movieID/credits?api_key=$apiKey";

    Uri url = Uri.parse(url_ink);

    client ??= http.Client();

    var response = await client.get(url);
    var data = json.decode(response.body);

    return ((data as Map<String, dynamic>)['cast'] as List)
        .map((e) => Credit(
            name: (e as Map<String, dynamic>)['name'],
            profilePath: (e as Map<String, dynamic>)['profile_path']))
        .take(8)
        .toList();
  }

  // static Future<List<Credit>> getCredits(int movieID,
  //     {http.Client? client}) async {
  //   Uri url = Uri.parse(
  //       "https://api.themoviedb.org/3/movie/$movieID/credits?api_key=$apiKey");

  //   var response = await client!.get(url);
  //   var data = json.decode(response.body);

  //   return ((data as Map<String, dynamic>)['cast'] as List)
  //       .map((e) => Credit(
  //             name: (e as Map<String, dynamic>)['name'],
  //             // ignore: unnecessary_cast
  //             profilePath: (e as Map<String, dynamic>)['profile_path'],
  //           ))
  //       .take(8)
  //       .toList();
  // }
}
