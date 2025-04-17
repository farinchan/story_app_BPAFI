import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:story_app_bpafi/domain/entities/register_entity.dart';
import 'package:story_app_bpafi/domain/usecases/get_register.dart';

import '../helper/test_helper.mocks.dart';

void main() {
  late GetRegister getRegister;
  late MockRepositoryDomain mockRegisterRepositoryDomain;

  setUp(() {
    mockRegisterRepositoryDomain = MockRepositoryDomain();
    getRegister = GetRegister(repository: mockRegisterRepositoryDomain);
  });
  final testRegister = RegisterEntity(error: false, message: 'success');

  test(
    'should return RegisterEntity when the call to repository is successful',
    () async {
      // Arrange
      when(
        mockRegisterRepositoryDomain.registerUser(any, any, any),
      ).thenAnswer((_) async => Right(testRegister));

      // Act
      final result = await getRegister.call('name', 'email', 'password');

      // Assert
      expect(result, Right(testRegister));
      verify(
        mockRegisterRepositoryDomain.registerUser('name', 'email', 'password'),
      );
      verifyNoMoreInteractions(mockRegisterRepositoryDomain);
    },
  );
}
