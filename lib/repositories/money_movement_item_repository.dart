import 'dart:async';

import 'package:my_budget/models/money_movement_item.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class MoneyMovementItemRepository {
  Future<List<MoneyMovementItem>> getMoneyMovementItem(Database db);
  Future<void> deleteMoneyMovementItem(Database db, int id);
  Future<void> editMoneyMovementItem(
      MoneyMovementItem moneyMovementItem, Database db);
  Future<void> createMoneyMovementItem(
      MoneyMovementItem moneyMovementItem, Database db);
}

class MoneyMovementItemLocalRepository implements MoneyMovementItemRepository {
  // Future<bool> databaseExists(String path) =>
  //     databaseFactory.databaseExists(path);

  // Future<Database> createDb() async {
  //   final String path = await getDatabasesPath();

  //   final Future<Database> database = openDatabase(
  //     join(path, 'money_movement.db'),
  //     onCreate: (db, version) {
  //       return db.execute(
  //         "CREATE TABLE moneyMovementItems(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)",
  //       );
  //     },
  //     version: 1,
  //   );

  //   return database;
  // }

  @override
  Future<void> createMoneyMovementItem(
      MoneyMovementItem moneyMovementItem, Database db) async {
    await db.insert(
      'moneyMovementItems',
      moneyMovementItem.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteMoneyMovementItem(Database db, int id) async {
    await db.delete(
      'moneyMovementItems',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  @override
  Future<void> editMoneyMovementItem(
      MoneyMovementItem moneyMovementItem, Database db) async {
    await db.update(
      'moneyMovementItems',
      moneyMovementItem.toMap(),
      // Ensure that the moneyMovementItem has a matching id.
      where: "id = ?",
      // Pass the moneyMovementItem's id as a whereArg to prevent SQL injection.
      whereArgs: [moneyMovementItem.id],
    );
  }

  @override
  Future<List<MoneyMovementItem>> getMoneyMovementItem(Database db) async {
    final List<Map<String, dynamic>> maps =
        await db.query('moneyMovementItems');
    return List.generate(maps.length, (i) {
      return MoneyMovementItem(
          id: maps[i]['id'],
          dateTime: maps[i]['dateTime'],
          moneyCount: maps[i]['moneyCount'],
          text: maps[i]['text']);
    });
  }
}
