import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

class MoneyMovementItem {
  final int id;
  final DateTime dateTime;
  final double moneyCount;
  final String text;

  MoneyMovementItem(
      {@required this.id,
      @required this.dateTime,
      @required this.moneyCount,
      @required this.text});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateTime': dateTime,
      'moneyCount': moneyCount,
      'text': text
    };
  }
}

// Define a function that inserts dogs into the database
// Future<void> insertMoneyMovementItem(MoneyMovementItem moneyMovementItem, Database db) async {
//   // final Database db = await database;
//   await db.insert(
//     'moneyMovementItems',
//     moneyMovementItem.toMap(),
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
// }

// await insertMoneyMovementItem(fido);
