import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:istore/app.dart';

Future<void> main() async {
  // ensure initialized
  WidgetsFlutterBinding.ensureInitialized();

  // system style
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  // portrait screen
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // load env
  await dotenv.load(
    fileName: 'assets/.env',
  );

  // app
  runApp(
    const App(),
  );
}
