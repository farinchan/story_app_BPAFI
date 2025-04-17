import 'package:dartz/dartz.dart';
import 'package:story_app_bpafi/data/datasources/remote_datascource.dart';
import 'package:story_app_bpafi/domain/entities/register_entity.dart';
import 'package:story_app_bpafi/domain/repositories/repository_domain.dart';

class RepositoryDomainImpl implements RepositoryDomain {
  final RemoteDatasource remoteDatasource;

  RepositoryDomainImpl({required this.remoteDatasource});

  @override
  Future<Either<String, RegisterEntity>> registerUser(
    String name,
    String email,
    String password,
  ) async {
    try {
      final result = await remoteDatasource.register(name, email, password);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
