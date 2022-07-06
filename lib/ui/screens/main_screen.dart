part of 'screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //
        Container(
          color: accentColor1,
        ),
        //*main content
        SafeArea(
            child: Container(
          color: backgroundColor,
        )),
        //*CONTENT SCREENS
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            MoviePage(),
            Center(
              child: Text("My Tickets"),
            )
          ],
        ),

        //*BOTTOM NAVIGATION
        Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: BottomNavigationBarClipper(),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: BottomNavigationBar(
                  elevation: 0,
                  currentIndex: _selectedIndex,
                  backgroundColor: Colors.transparent,

                  type: BottomNavigationBarType.fixed, // This is all you need!
                  selectedItemColor: mainColor,
                  unselectedItemColor: Color(0XFFE5E5E5),
                  unselectedLabelStyle: GoogleFonts.raleway(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  selectedLabelStyle: GoogleFonts.raleway(
                      fontSize: 15, fontWeight: FontWeight.bold),

                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                      pageController.jumpToPage(index);
                    });
                  },
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Container(
                          margin: EdgeInsets.only(bottom: 6),
                          height: 20,
                          child: Image.asset((_selectedIndex == 0)
                              ? "assets/ic_movie.png"
                              : "assets/ic_movie_grey.png"),
                        ),
                        label: "New Movies"),
                    BottomNavigationBarItem(
                        icon: Container(
                          margin: EdgeInsets.only(bottom: 6),
                          height: 20,
                          child: Image.asset((_selectedIndex == 1)
                              ? "assets/ic_tickets.png"
                              : "assets/ic_tickets_grey.png"),
                        ),
                        label: "My Tickets")
                  ],
                ),
              ),
            )),

        //*WALLET
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 57,
              width: 57,
              margin: EdgeInsets.only(bottom: 50),
              child: FloatingActionButton(
                elevation: 0.0,
                backgroundColor: accentColor2,
                child: Container(
                  height: 33,
                  width: 33,
                  child: Icon(
                    MdiIcons.walletPlus,
                    color: mainColor,
                    size: 30,
                  ),
                ),
                onPressed: () {
                  context.read<UserBloc>().add(SignOut());
                  AuthServices.signOut();
                },
              ),
            ))
      ],
    ));
  }

  Widget createCustomBottomNavbar() => Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: BottomNavigationBarClipper(),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _selectedIndex,
            backgroundColor: Colors.transparent,

            type: BottomNavigationBarType.fixed, // This is all you need!
            selectedItemColor: mainColor,
            unselectedItemColor: Color(0XFFE5E5E5),
            unselectedLabelStyle:
                GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.w600),
            selectedLabelStyle:
                GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.bold),

            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                print(index);
                print("===INDEX ");
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    height: 20,
                    child: Image.asset((_selectedIndex == 0)
                        ? "assets/ic_movie.png"
                        : "assets/ic_movie_grey.png"),
                  ),
                  label: _selectedIndex == 0 ? "Kontorl" : "New Movies"),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    height: 20,
                    child: Image.asset((_selectedIndex == 1)
                        ? "assets/ic_tickets.png"
                        : "assets/ic_tickets_grey.png"),
                  ),
                  label: "My Tickets")
            ],
          ),
        ),
      ));
}

class BottomNavigationBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 36, 0);
    path.quadraticBezierTo(size.width / 2 - 36, 34, size.width / 2, 34);
    path.quadraticBezierTo(size.width / 2 + 36, 34, size.width / 2 + 36, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
