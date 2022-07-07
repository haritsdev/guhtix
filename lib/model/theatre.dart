part of 'models.dart';

class Theater extends Equatable {
  final String name;

  Theater({required this.name});

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater(name: "CGV 23 Paskal Hyper Square"),
  Theater(name: "CGV Paris Van Java"),
  Theater(name: "XXI Cihampelas Walk"),
  Theater(name: "XXI Bandung Trade Center")
];
