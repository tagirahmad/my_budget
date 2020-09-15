import 'package:flutter/material.dart';
import 'package:my_budget/configs/size_config.dart';

abstract class Styles {
  static TextStyle availableBalanceText = TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 3.5,
    color: Colors.white,
  );

  static TextStyle availableBalanceDate = TextStyle(
    fontSize: SizeConfig.safeBlockHorizontal * 2.5,
    color: Colors.white,
  );

  static TextStyle availableBalanceCount = TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal * 7,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static TextStyle spentMoneyText = TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal * 2.5, color: Color(0xFFFF2D5E));

  static TextStyle spentMoneyCount = TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal * 3.5,
      fontWeight: FontWeight.bold);

  static TextStyle incomeMoneyText = TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal * 2.5, color: Color(0xFF24DF7B));

  static TextStyle incomeMoneyCount = TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal * 3.5,
      fontWeight: FontWeight.bold);

  static TextStyle welcomeHomeText =
      TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 4.5);

  static TextStyle dateSeparatorText = TextStyle(color: Color(0xFF3755FF));

  static TextStyle monthMMM =
      TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 2.5);

  static TextStyle moneyMovementItemText =
      TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3.5);

  static TextStyle moneyMovementItemTime =
      TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3);

  static TextStyle moneyMovementItemMoneyCount = TextStyle(
      fontSize: SizeConfig.blockSizeHorizontal * 5,
      fontWeight: FontWeight.bold);
}
