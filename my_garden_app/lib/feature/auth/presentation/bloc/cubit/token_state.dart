part of 'token_cubit.dart';

@freezed
class TokenState with _$TokenState {
  const factory TokenState.initial() = _Initial;
  const factory TokenState.authorized(SecurityResponseModel token) =
      _Authorized;
  const factory TokenState.fail([@Default("Unknown error") String message]) =
      _Fail;
  const factory TokenState.tokenSuccess(SecurityResponseModel token) =
      _TokenSuccess;
  const factory TokenState.unauthorized() = _Unauthorized;
}
