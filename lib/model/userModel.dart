part of 'models.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String roles;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  UserModel(
      {required this.id,
      required this.email,
      this.name = '',
      required this.roles,
      this.profilePicture = '',
      this.selectedGenres = const [""],
      this.selectedLanguage = '',
      this.balance = 0});

  UserModel copyWith(
          {required String name,
          required String profilePicture,
          required int balance}) =>
      UserModel(
          id: this.id,
          email: this.email,
          roles: roles,
          name: name != "" ? name : this.name,
          profilePicture:
              profilePicture != "" ? profilePicture : this.profilePicture,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        selectedGenres,
        selectedLanguage,
        balance
      ];
}
