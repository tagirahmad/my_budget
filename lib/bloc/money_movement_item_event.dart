part of 'money_movement_item_bloc.dart';

@immutable
abstract class MoneyMovementItemEvent {}

class AppStartedLoading extends MoneyMovementItemEvent {}

class MoneyMovementItemCreate extends MoneyMovementItemEvent {
  MoneyMovementItemCreate({@required this.moneyMovementItem});
  final MoneyMovementItem moneyMovementItem;
}

class MoneyMovementItemRead extends MoneyMovementItemEvent {}

class MoneyMovementItemEdit extends MoneyMovementItemEvent {
  MoneyMovementItemEdit({@required this.moneyMovementItem});
  final MoneyMovementItem moneyMovementItem;
}

class MoneyMovementItemDelete extends MoneyMovementItemEvent {
  MoneyMovementItemDelete({@required this.id});
  final int id;
}
