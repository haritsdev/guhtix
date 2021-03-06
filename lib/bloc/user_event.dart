part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  final String id;

  LoadUser(this.id);

  @override
  List<Object> get props => [id];
}

class SignOut extends UserEvent {
  @override
  List<Object> get props => [];
}

class UpdateData extends UserEvent {
  final String name;
  final String profileImage;

  UpdateData({this.name = '', required this.profileImage});
  @override
  List<Object> get props => [];
}

class TopUp extends UserEvent {
  final int amount;
  TopUp({required this.amount});

  @override
  List<Object> get props => [amount];
}

class Purchase extends UserEvent {
  final int amount;
  Purchase({required this.amount});

  @override
  List<Object> get props => [amount];
}
