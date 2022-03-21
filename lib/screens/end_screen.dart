import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utak_riscian/fact.dart';
import 'package:utak_riscian/providers/game_screen_provider.dart';
import 'package:utak_riscian/widgets/dialog_widget.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = context.watch<GameScreenProvider>().name!;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (builder) => DialogWidget(
        title: 'DID YOU KNOW?',
        text: facts.last.text,
        image: 'assets/icons/warn.svg',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    return Scaffold(
      body: Center(
        child: Text(
          'Thank you for participating, $name You may now claim your E-Certificate through the QR Code Button located at the Menu.',
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
