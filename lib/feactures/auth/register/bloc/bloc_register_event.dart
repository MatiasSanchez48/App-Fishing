part of 'bloc_register.dart';

abstract class BlocRegisterEvent extends Equatable {
  const BlocRegisterEvent();

  @override
  List<Object> get props => [];
}

class BlocRegisterEventRegister extends BlocRegisterEvent {
  const BlocRegisterEventRegister({
    required this.email,
    required this.password,
    required this.name,
  });

  ///
  final String name;

  ///
  final String email;

  ///
  final String password;
}
