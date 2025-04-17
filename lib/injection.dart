import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:story_app_bpafi/data/datasources/remote/remote_datasource_impl.dart';
import 'package:story_app_bpafi/data/datasources/remote_datascource.dart';
import 'package:story_app_bpafi/data/repositories/register_repository_domain_impl.dart';
import 'package:story_app_bpafi/domain/repositories/repository_domain.dart';
import 'package:story_app_bpafi/domain/usecases/get_register.dart';
import 'package:story_app_bpafi/presentation/bloc/register_bloc.dart';

final getIt = GetIt.instance;

void init() {
  // Register the HTTP client
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  // Register Datasources
  getIt.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImpl(client: getIt<http.Client>()));

  // Register Repositories
  getIt.registerLazySingleton<RepositoryDomain>(() => RepositoryDomainImpl(remoteDatasource: getIt<RemoteDatasource>()));

  // Register Use Cases
  getIt.registerLazySingleton(() => GetRegister(repository: getIt<RepositoryDomain>()));

  // Register Bloc
  getIt.registerFactory(() => RegisterBloc(getRegister: getIt<GetRegister>()));

}