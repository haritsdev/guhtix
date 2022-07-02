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
      return SignInSignUpResult(message: e.toString());
    }
  }
}

class SignInSignUpResult {
  final UserModel? user;
  final String message;

  SignInSignUpResult({this.user, this.message = ''});
}
