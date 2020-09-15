part of 'money_movement_item_bloc.dart';

@immutable
abstract class MoneyMovementItemState {}

class MoneyMovementItemInitial extends MoneyMovementItemState {}

class MoneyMovementItemStartedLoading extends MoneyMovementItemState {}

class MoneyMovementItemLoadingSuccess extends MoneyMovementItemState {
  MoneyMovementItemLoadingSuccess({@required this.moneyMovementItems});
  final List<MoneyMovementItem> moneyMovementItems;
}

class MoneyMovementItemEditInProgress extends MoneyMovementItemState {}

class MoneyMovementItemEditSuccess extends MoneyMovementItemState {}

class MoneyMovementItemDeleteInProgress extends MoneyMovementItemState {}

class MoneyMovementItemDeleteSuccess extends MoneyMovementItemState {}

class FailureState extends MoneyMovementItemState {
  FailureState({@required this.error});
  final String error;
}
