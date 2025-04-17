
import 'package:equatable/equatable.dart';
import 'package:story_app_bpafi/domain/entities/register_entity.dart';

class RegisterModel extends Equatable {
  final bool error;
  final String message;
  const RegisterModel({
    required this.error,
    required this.message,
  });
  

  RegisterModel copyWith({
    bool? error,
    String? message,
  }) {
    return RegisterModel(
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      error: map['error'] as bool,
      message: map['message'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [error, message];

  RegisterEntity toEntity() {
    return RegisterEntity(
      error: error,
      message: message,
    );
  }
}
