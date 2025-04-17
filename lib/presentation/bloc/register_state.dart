part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();  

  @override
  List<Object> get props => [];
}
class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterEntity registerEntity;

  const RegisterSuccess({required this.registerEntity});

  @override
  List<Object> get props => [registerEntity];
}

class RegisterFailure extends RegisterState {
  final String error;

  const RegisterFailure({required this.error});

  @override
  List<Object> get props => [error];
}
