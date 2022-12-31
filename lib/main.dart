import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:video_streaming/models/video_model.dart';
import 'package:video_streaming/views/home_view.dart';

import 'widgets/colors.dart';

void addVideo(String name, String link){
  final newVideo = APIVideo()
    ..name = name
    ..link = link;

  final videoBox = Hive.box<APIVideo>("personalVideo");
  videoBox.add(newVideo);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  await Hive.initFlutter();
  Hive.registerAdapter(APIVideoAdapter());
  await Hive.openBox<APIVideo>('personalVideo');

  if(Hive.box<APIVideo>("personalVideo").isEmpty){
    addVideo("Bee Video", "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    addVideo("Butterfly Video", "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    addVideo("Rabbit Video", "https://mdn.github.io/learning-area/html/multimedia-and-embedding/video-and-audio-content/rabbit320.webm");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static MaterialColor generateMaterialColorFromColor(Color color) {
    return MaterialColor(color.value, {
      50: Color.fromRGBO(color.red, color.green, color.blue, 0.1),
      100: Color.fromRGBO(color.red, color.green, color.blue, 0.2),
      200: Color.fromRGBO(color.red, color.green, color.blue, 0.3),
      300: Color.fromRGBO(color.red, color.green, color.blue, 0.4),
      400: Color.fromRGBO(color.red, color.green, color.blue, 0.5),
      500: Color.fromRGBO(color.red, color.green, color.blue, 0.6),
      600: Color.fromRGBO(color.red, color.green, color.blue, 0.7),
      700: Color.fromRGBO(color.red, color.green, color.blue, 0.8),
      800: Color.fromRGBO(color.red, color.green, color.blue, 0.9),
      900: Color.fromRGBO(color.red, color.green, color.blue, 1.0),
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Medpock App',

        theme: ThemeData(
          useMaterial3: true,
          accentColor: greenColor,
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: Theme.of(context).disabledColor,
              selectionColor: darkBlueColor,
              selectionHandleColor: greenColor
          ),
          hintColor: greenColor,
          disabledColor: darkBlueColor,
          // cardColor: Colors.black12,
          primarySwatch: MyApp.generateMaterialColorFromColor(Colors.white),
          textTheme: TextTheme(
              headline6: TextStyle(color: greenColor)
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.grey),
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: Theme.of(context).disabledColor,
              selectionColor: greenColor,
              selectionHandleColor: greenColor
          ),
          colorScheme: ColorScheme.dark(primary: darkBlueColor),
          hintColor: darkBlueColor,
          disabledColor: greenColor,
          // cardColor: Colors.white12,
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(color: darkBlueColor)
          ),
          textTheme: TextTheme(
              headline6: TextStyle(color: greenColor)
          ),
        ),
        themeMode: ThemeMode.system,
        home: const HomePage()
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}