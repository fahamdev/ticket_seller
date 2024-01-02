import 'package:flutter/material.dart';
import 'package:ticket_seller/pages/circular_route.dart';
import 'package:ticket_seller/pages/city_bus.dart';
import 'package:ticket_seller/pages/ticket_checker.dart';

import 'components/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket Seller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void navigateToCircularRoute(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CircularRoutePage()),
    );
  }

  void navigateToChecker(context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TicketCheckerPage()),
    );
  }

  void navigateToCityBus(context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CityBusPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        title: const Text("Ticketing System"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100),

            Image.asset(
              'lib/images/datatech_logo_transparent.png',
              height: 60,
            ),
            const SizedBox(height: 60),

            MyButton(
                onTap: () => navigateToCircularRoute(context),
                buttonText: 'Circular Route Tickets',
                buttonColour: Colors.lightBlue),

            MyButton(
                onTap: () => navigateToCityBus(context),
                buttonText: 'City Bus Tickets',
                buttonColour: Colors.lightBlue),

            MyButton(
                onTap: () => navigateToChecker(context),
                buttonText: 'Ticket Checker',
                buttonColour: Colors.lightGreen),

          ],
        ),
      ),
    );
  }
}
