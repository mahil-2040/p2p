import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:p2p/screens/info_screen.dart';
import 'package:p2p/screens/socket_service.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketService()..connect()),
      ],
      child: const MyApp(),
    ),
  );

  doWhenWindowReady(() {
    final win = appWindow;
    win.size = const Size(600, 600);   
    win.minSize = const Size(600, 600); 
    // win.maxSize = const Size(600, 600); 
    win.alignment = Alignment.center;
    win.title = 'P2P';
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: InfoScreen(),
    );
  }
}
