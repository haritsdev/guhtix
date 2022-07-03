part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(
      String email,
      String password,
      String name,
      String roles,
      List<String> selectedGenres,
      String selectedLanguage) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
          id: userCredential.user!.uid,
          email: email,
          name: name,
          roles: 'user',
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage,
          balance: 30000);

      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(']')[1]);
    }
  }

  static Future<UserModel> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserModel user = await UserServices.getUser(userCredential.user!.uid);

      // return SignInSignUpResult(user: user);
      return user;
    } catch (e) {
      throw e;
      // return SignInSignUpResult(message: e.toString().split(']')[1]);
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<User?> get userStream => _auth.authStateChanges();
}

class SignInSignUpResult {
  final UserModel? user;
  final String message;

  SignInSignUpResult({this.user, this.message = ''});
}
