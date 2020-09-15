import 'dart:async';

import 'package:my_budget/models/money_movement_item.dart';
import 'package:path/path.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_budget/repositories/money_movement_item_repository.dart';
import 'package:sqflite/sqflite.dart';

part 'money_movement_item_event.dart';
part 'money_movement_item_state.dart';

class MoneyMovementItemBloc
    extends Bloc<MoneyMovementItemEvent, MoneyMovementItemState> {
  MoneyMovementItemBloc({this.moneyMovementItemLocalRepository, this.database})
      : super(MoneyMovementItemInitial());

  MoneyMovementItemState get initialState => MoneyMovementItemInitial();

  final MoneyMovementItemLocalRepository moneyMovementItemLocalRepository;
  final Future<Database> database;

  @override
  Stream<MoneyMovementItemState> mapEventToState(
    MoneyMovementItemEvent event,
  ) async* {
    if (event is AppStartedLoading) {
      yield* _getMoneyMovementItems();
    } else if (event is MoneyMovementItemCreate) {
      yield* _createMoneyMovementItem(event.moneyMovementItem);
      yield* _getMoneyMovementItems();
    } else if (event is MoneyMovementItemEdit) {
      yield* _editMoneyMovementItem(event.moneyMovementItem);
      yield* _getMoneyMovementItems();
    } else if (event is MoneyMovementItemDelete) {
      yield* _deleteMoneyMovementItem(event.id);
      yield* _getMoneyMovementItems();
    }
  }

  Stream<MoneyMovementItemState> _getMoneyMovementItems() async* {
    yield MoneyMovementItemStartedLoading();

    try {
      // final String path = await getDatabasesPath();
      // print(path);
      // // Future<bool> databaseExists(String path) =>
      // //     databaseFactory.databaseExists(path);
      // final bool dbExists =
      //     // await databaseExists(path);
      //     await moneyMovementItemLocalRepository.databaseExists(path);
      // print(dbExists);
      // Database database;

      // if (dbExists == false) {
      //   database = await moneyMovementItemLocalRepository.createDb();
      // }

      // database = await openDatabase(
      //   join(await getDatabasesPath(), 'money_movement.db'),
      // );

      final Database db = await database;

      List<MoneyMovementItem> moneyMovementItems =
          await moneyMovementItemLocalRepository.getMoneyMovementItem(db);

      yield MoneyMovementItemLoadingSuccess(
          moneyMovementItems: moneyMovementItems);
    } catch (e) {
      yield FailureState(error: e.toString());
    }
  }

  Stream<MoneyMovementItemState> _createMoneyMovementItem(
      MoneyMovementItem moneyMovementItem) async* {
    // final Future<Database> database = openDatabase(
    //   join(await getDatabasesPath(), 'money_movement.db'),
    // );
    final Database db = await database;

    moneyMovementItemLocalRepository.createMoneyMovementItem(
        moneyMovementItem, db);
  }

  Stream<MoneyMovementItemState> _editMoneyMovementItem(
      MoneyMovementItem moneyMovementItem) async* {
    try {
      yield MoneyMovementItemEditInProgress();

      // final Future<Database> database = openDatabase(
      //   join(await getDatabasesPath(), 'money_movement.db'),
      // );
      final Database db = await database;

      moneyMovementItemLocalRepository.editMoneyMovementItem(
          moneyMovementItem, db);

      yield MoneyMovementItemEditSuccess();
    } catch (e) {
      yield FailureState(error: e);
    }
  }

  Stream<MoneyMovementItemState> _deleteMoneyMovementItem(int id) async* {
    try {
      yield MoneyMovementItemDeleteInProgress();

      // final Future<Database> database = openDatabase(
      //   join(await getDatabasesPath(), 'money_movement.db'),
      // );
      final Database db = await database;

      moneyMovementItemLocalRepository.deleteMoneyMovementItem(db, id);

      yield MoneyMovementItemDeleteSuccess();
    } catch (e) {
      yield FailureState(error: e);
    }
  }
}
