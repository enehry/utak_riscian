import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utak_riscian/providers/game_screen_provider.dart';
import 'package:utak_riscian/screens/home_screen.dart';
import 'package:utak_riscian/screens/input_name_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Theme.of(context).backgroundColor,
                content: Text('Are you sure you want to exit?',
                    style: Theme.of(context).textTheme.bodyText1),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      'No',
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            });

        return value == true;
      },
      child: context.watch<GameScreenProvider>().name != null
          ? HomeScreen()
          : InputNameScreen(),
    );
  }
}
