import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utak_riscian/providers/game_screen_provider.dart';
import 'package:utak_riscian/screens/about_screen.dart';
import 'package:utak_riscian/screens/game_screen.dart';
import 'package:utak_riscian/screens/qr_code_screen.dart';
import 'package:utak_riscian/screens/settings_screen.dart';
import 'package:utak_riscian/screens/stages_screen.dart';
import 'package:utak_riscian/widgets/dialog_widget.dart';
import 'package:provider/provider.dart';
import 'package:utak_riscian/widgets/long_button_wdiget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int stage = context.watch<GameScreenProvider>().stage;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 100.0,
                  maxWidth: 100.0,
                ),
                child: Hero(
                    tag: 'logo',
                    child: SvgPicture.asset('assets/icons/logo.svg')),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LongButtonWidget(
                      onPressed: () {
                        stage > 0
                            ? showDialog(
                                context: context,
                                builder: (builder) => DialogWidget(
                                    onPressed: () {
                                      context
                                          .read<GameScreenProvider>()
                                          .clearData();
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => GameScreen(),
                                        ),
                                      );
                                    },
                                    isOkCancel: true,
                                    title: 'WARNING',
                                    image: 'assets/icons/warn.svg',
                                    text:
                                        'Are you sure you want a new game ? \n This will delete your progress.'),
                              )
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameScreen(),
                                ),
                              );
                      },
                      title: 'NEW GAME',
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    stage > 0
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: LongButtonWidget(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GameScreen(),
                                  ),
                                );
                              },
                              title: 'CONTINUE',
                            ),
                          )
                        : Container(),
                    stage > 0
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: LongButtonWidget(
                              onPressed: () async {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => StagesScreen(),
                                  ),
                                );
                              },
                              title: 'STAGES',
                            ),
                          )
                        : Container(),
                    LongButtonWidget(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SettingsScreen(),
                          ),
                        );
                      },
                      title: 'SETTINGS',
                    ),
                    context.watch<GameScreenProvider>().question.level >= 2
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: LongButtonWidget(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => QRCodeScreen(),
                                  ),
                                );
                              },
                              title: 'QR CODE',
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 20.0,
                    ),
                    LongButtonWidget(
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AboutScreen(),
                          ),
                        );
                      },
                      title: 'ABOUT',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
