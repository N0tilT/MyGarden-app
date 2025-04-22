part of 'group_cubit.dart';

@freezed
class GroupState with _$GroupState {
  const factory GroupState.initial() = GroupInitial;
  const factory GroupState.loading() = GroupLoading;
  const factory GroupState.success(List<GroupEntity> plants) = GroupSuccess;
  const factory GroupState.remoteFail([
    @Default("Unknown error") String message,
  ]) = GroupFail;
  const factory GroupState.fail([
    @Default("Unknown error") String message,
  ]) = GroupLocalLoadingFail;
  const factory GroupState.localLoadingSuccess(
    List<GroupEntity> departments,
  ) = GroupLocalLoadingSuccess;
}
