part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(UserModel user) async {
    // String genres = "";
    // for (var genre in user.selectedGenres) {
    //   genres += genre + ((genre != user.selectedGenres.last) ? ',' : '');
    // }

    try {
      _userCollection.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'roles': user.roles,
        'balance': user.balance,
        'selectedGenres': user.selectedGenres,
        'selectedLanguage': user.selectedLanguage,
        'profilePicture': user.profilePicture
      });
    } catch (e) {
      throw e;
    }
  }

  static Future<UserModel> getUser(String id) async {
    try {
      DocumentSnapshot snapshot = await _userCollection.doc(id).get();

      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        roles: snapshot['roles'],
        balance: snapshot['balance'],
        profilePicture: snapshot['profilePicture'],
        selectedGenres: (snapshot['selectedGenres'] as List)
            .map((e) => e.toString())
            .toList(),
      );
    } catch (e) {
      throw e;
    }
  }
}
