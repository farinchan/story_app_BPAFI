import 'package:dartz/dartz.dart';
import 'package:story_app_bpafi/domain/entities/register_entity.dart';

abstract class RepositoryDomain {
  Future<Either<String, RegisterEntity>> registerUser(
    String name,
    String email,
    String password,
  );
}
