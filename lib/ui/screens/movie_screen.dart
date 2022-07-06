part of 'screens.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //NOTE HEADER
        Container(
          decoration: BoxDecoration(
              color: accentColor1,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 20),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) {
              if (userState is UserLoaded) {
                if (imageFileToUpload != null) {
                  uploadImage(imageFileToUpload!).then((downloadURL) {
                    context
                        .read<UserBloc>()
                        .add(UpdateData(profileImage: downloadURL));
                    imageFileToUpload = null;
                  });
                }
                return Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0xFF5F5588), width: 1)),
                      child: Stack(children: [
                        SpinKitFadingCircle(
                          color: accentColor2,
                          size: 55,
                        ),
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: (userState.user.profilePicture == ""
                                    ? AssetImage("assets/user_pic.png")
                                        as ImageProvider
                                    : NetworkImage(
                                        userState.user.profilePicture)),
                              )),
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              84,
                          child: Text(
                            userState.user.name + "Susanti susilo bolobol",
                            style: whiteTextFont.copyWith(fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            // softWrap: false,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            locale: "id_ID",
                            symbol: "Rp. ",
                            decimalDigits: 0,
                          ).format(userState.user.balance),
                          style: yellowNumberFont.copyWith(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                );
              } else {
                return SpinKitFadingCircle(
                  color: accentColor2,
                  size: 50,
                );
              }
            },
          ),
        ),

        //NOW PLAYING
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text(
            "Now Playing",
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<Movie> movies = movieState.movies.sublist(0, 10);

              return ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Container(
                        margin: EdgeInsets.only(
                            left: (index == 0) ? defaultMargin : 0,
                            right: (index == movies.length - 1)
                                ? defaultMargin
                                : 16),
                        // child: Text(movies[index].voteAverage.toString())
                        child: MovieCard(movie: movies[index], onTap: () {}),
                      ));
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          }),
        )
      ],
    );
  }
}