import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'firebase/firebase_options.dart';
import 'package:flutter/material.dart';
import 'show_data.dart';
import 'tools/navigation.dart';

@override
void initState() {
  OneSignal.initialize("56c94a7a-618b-41d6-8db3-955968baf359");
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initState();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const ShowData(),
      home: AnimatedSplashScreen(
        splash: Image.asset('img/infinity.gif', fit: BoxFit.cover),
        splashIconSize: 200,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.black,
        duration: 2000,
        nextScreen: const MyHomePage(title: "Welcome ashore !!",),
      ),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to job shore. Here is where you can, as a community, work to get a job!!',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => goTo(const ShowData(), context),
        tooltip: 'Lets start!',
        child: const Icon(Icons.play_arrow_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
