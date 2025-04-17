import 'package:dartz/dartz.dart';
import 'package:story_app_bpafi/domain/entities/register_entity.dart';
import 'package:story_app_bpafi/domain/repositories/repository_domain.dart';

class GetRegister {
  final RepositoryDomain repository;

  GetRegister({required this.repository});

  Future<Either<String, RegisterEntity>> call(
    String name,
    String email,
    String password,
  ) async {
    return await repository.registerUser(name, email, password);
  }
}
