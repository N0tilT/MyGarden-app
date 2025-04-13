import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/auth/data/models/user_model/account_model.dart';

part 'account_entity.freezed.dart';

@freezed
class AccountEntity with _$AccountEntity {
  const factory AccountEntity(
      {required String id,
      required String? userName,}) = _AccountEntity;

  factory AccountEntity.fromModel(AccountModel model) => AccountEntity(
      id: model.id,
      userName: model.userName,);
}
