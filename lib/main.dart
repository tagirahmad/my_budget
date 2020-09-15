import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_budget/repositories/money_movement_item_repository.dart';
import 'package:my_budget/screens/home_page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'bloc/money_movement_item_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Future<bool> databaseExists(String path) =>
  //     databaseFactory.databaseExists(path);

  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'money_movement.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE moneyMovementItems(id INTEGER PRIMARY KEY AUTOINCREMENT, dateTime TEXT, moneyCount REAL, text TEXT)",
      );
    },
    version: 1,
  );

  MoneyMovementItemLocalRepository moneyMovementItemLocalRepository =
      MoneyMovementItemLocalRepository();
  runApp(MyApp(
    moneyMovementItemLocalRepository: moneyMovementItemLocalRepository,
    database: database,
  ));
}

class MyApp extends StatelessWidget {
  MyApp(
      {@required this.moneyMovementItemLocalRepository,
      @required this.database});
  final MoneyMovementItemLocalRepository moneyMovementItemLocalRepository;
  final Future<Database> database;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => MoneyMovementItemBloc(
            moneyMovementItemLocalRepository: moneyMovementItemLocalRepository,
            database: database)
          ..add(AppStartedLoading()),
        child: HomePage(),
      ),
    );
  }
}
