import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'di.dart';
import 'main.dart';

// DotEnv dotenv = DotEnv() is automatically called during import.
// If you want to load multiple dotenv files or name your dotenv object differently, you can do the following and import the singleton into the relavant files:
// DotEnv another_dotenv = DotEnv()

Future main() async {
  // To load the .env file contents into dotenv.
  // NOTE: fileName defaults to .env and can be omitted in this case.
  // Ensure that the filename corresponds to the path in step 1 and 2.
  await dotenv.load(fileName: "assets/env/.env_local");
  //...runapp
  WidgetsFlutterBinding.ensureInitialized();
  await DenpendencyInjection.init();

  runApp(App());
  configLoading();
}