part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;
  final Color color;
  final MainAxisAlignment alignment;
  const RatingStars(
      {Key? key,
      this.color = Colors.amber,
      required this.voteAverage,
      required this.starSize,
      this.fontSize = 14,
      this.alignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

    List<Widget> widgets = List.generate(
        5,
        (index) => Icon(
              index < n ? MdiIcons.star : MdiIcons.starOutline,
              color: accentColor2,
              size: starSize,
            ));

    widgets.add(SizedBox(
      width: 3,
    ));
    widgets.add(Text(
      "$voteAverage",
      style: whiteNumberFont.copyWith(
          fontWeight: FontWeight.w500, fontSize: fontSize),
    ));
    return Row(
      mainAxisAlignment: alignment,
      children: widgets,
    );
  }
}
