import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/auth/data/models/security_request_model.dart';
import 'package:my_garden_app/feature/auth/domain/entities/account_entity.dart';
import 'package:my_garden_app/feature/auth/domain/usecases/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Auth authUseCase;
  AccountEntity? user;

  AuthBloc({required this.authUseCase}) : super(const _Initial()) {
    on<_Auth>(
      (event, emit) async {
        emit(const AuthState.authLoading());
        final result = await authUseCase(event.authRequest);
        result.fold(
          (l) => emit(
            AuthState.authFail(l.message),
          ),
          (r) {
            user = AccountEntity.fromModel(r.user);
            emit(
              AuthState.authSuccess(user),
            );
          },
        );
      },
    );
  }
}
