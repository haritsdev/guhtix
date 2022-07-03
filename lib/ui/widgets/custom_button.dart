part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final double fontSize;
  final Function() onPressed;
  final EdgeInsets margin;
  const CustomButton(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      required this.onPressed,
      this.margin = EdgeInsets.zero,
      this.height = 50,
      this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: mainColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Text(
          title,
          style: whiteTextFont.copyWith(fontSize: fontSize),
        ),
      ),
    );
  }
}
