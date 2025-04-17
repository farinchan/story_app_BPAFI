import 'package:mockito/annotations.dart';
import 'package:story_app_bpafi/domain/repositories/repository_domain.dart';

@GenerateMocks(
  [RepositoryDomain],
  customMocks: [MockSpec<RepositoryDomain>(as: #MockHttpClient)],
)
void main() {}
