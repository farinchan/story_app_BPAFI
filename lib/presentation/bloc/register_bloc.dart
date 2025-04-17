import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app_bpafi/domain/entities/register_entity.dart';
import 'package:story_app_bpafi/domain/usecases/get_register.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final GetRegister getRegister;
  RegisterBloc({required this.getRegister}) : super(RegisterInitial()) {
    on<RegisterButtonEvent>((event, emit) async {
      emit(RegisterLoading());

      final result = await getRegister.call(
        event.name,
        event.email,
        event.password,
      );
      result.fold(
        (l) {
          emit(RegisterFailure(error: l));
        },
        (r) {
          if (r.error) {
            emit(RegisterFailure(error: r.message));
          } else {
            emit(RegisterSuccess(registerEntity: r));
          }
        },
      );
    });
  }
}
