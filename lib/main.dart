import 'package:flutter/material.dart';
import 'package:utak_riscian/providers/audio_player_provider.dart';
import 'package:utak_riscian/providers/game_screen_provider.dart';
import 'package:utak_riscian/providers/theme_provider.dart';
import 'package:utak_riscian/question_bank.dart';
import 'package:utak_riscian/screens/splash_screen.dart';
import 'package:utak_riscian/screens/wrapper.dart';
import 'package:utak_riscian/services/storage_util.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  runApp(FourPicOneWordProviders());
}

class FourPicOneWordProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GameScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AudioPlayerProvider(),
        ),
      ],
      child: FourPicsOneWord(),
    );
  }
}

class FourPicsOneWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Loading is done, return the app:
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().themeData,
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      home: FutureBuilder(
        // Replace the 3 second delay with your initialization code:
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, AsyncSnapshot snapshot) {
          // Show splash screen while waiting for app resources to load:
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            return Wrapper();
          }
        },
      ),
    );
  }
}
