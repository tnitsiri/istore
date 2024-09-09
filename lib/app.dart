import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:istore/modules/home/pages/home.dart';
import 'package:istore/services/api.service.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  // ANCHOR App
  const App({
    super.key,
  });

  // ANCHOR Build
  @override
  Widget build(
    BuildContext context,
  ) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(
          create: (_) => ApiService(),
        ),
      ],
      child: const CupertinoApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('th', 'TH'),
        ],
        locale: Locale(
          'th',
          'TH',
        ),
        theme: CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: Color(0xFFFF038F),
          barBackgroundColor: CupertinoColors.white,
          scaffoldBackgroundColor: CupertinoColors.white,
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14.5,
              fontWeight: FontWeight.w400,
              color: CupertinoColors.black,
            ),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
