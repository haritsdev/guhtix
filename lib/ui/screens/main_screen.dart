part of 'screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocBuilder<AuthCubit, AuthState>(
            //   builder: (context, state) {
            //     if (state is AuthSuccess) {
            //       return Container(
            //         child: Text('Hello ${state.user.selectedGenres}'),
            //       );
            //     } else {
            //       return SizedBox();
            //     }
            //   },
            // ),
            ElevatedButton(
              onPressed: () {
                AuthServices.signOut();
                //context.read<AuthCubit>().signOut();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
      // body: BlocConsumer<AuthCubit, AuthState>(
      //   listener: (context, state) {
      //     if (state is AuthFailed) {
      //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //           backgroundColor: Colors.red, content: Text(state.error)));
      //     } else if (state is AuthInitial) {
      //       Navigator.pushNamedAndRemoveUntil(
      //           context, '/sign-in', (route) => false);
      //     }
      //   },
      //   builder: (context, state) {
      //     if (state is AuthLoading) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     return Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           BlocBuilder<AuthCubit, AuthState>(
      //             builder: (context, state) {
      //               if (state is AuthSuccess) {
      //                 return Container(
      //                   child: Text('Hello ${state.user.selectedGenres}'),
      //                 );
      //               } else {
      //                 return SizedBox();
      //               }
      //             },
      //           ),
      //           ElevatedButton(
      //             onPressed: () {
      //               context.read<AuthCubit>().signOut();
      //             },
      //             child: Text("Logout"),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
