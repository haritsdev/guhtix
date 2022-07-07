part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genre;
  const BrowseButton({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(genre);
  }
}
