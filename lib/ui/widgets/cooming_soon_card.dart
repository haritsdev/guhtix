part of 'widgets.dart';

class CoomingSoonCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;
  const CoomingSoonCard({Key? key, required this.movie, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(movie.title);
  }
}
