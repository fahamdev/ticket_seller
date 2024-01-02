import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunmi_scanner/sunmi_scanner.dart';
import 'package:ticket_seller/components/ticket_details.dart';
import '../components/button.dart';

class TicketCheckerPage extends StatefulWidget {
  const TicketCheckerPage({super.key});

  @override
  State<TicketCheckerPage> createState() => _TicketCheckerPageState();
}

class _TicketCheckerPageState extends State<TicketCheckerPage> {
  String _operator = '';
  String _onBoarding = '';
  String _offBoarding = '';
  String _ticketNo = '';
  String _price = '';
  bool _isConsumed = false;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    SunmiScanner.onBarcodeScanned().listen((event) {
      _setScannedValue(event);
    });
  }

  void navigateToMenu() {
    Navigator.pop(context);
  }

  void _setScannedValue(String value) async {
    final scannedData = jsonDecode(value);
    print(scannedData);
    final operator = scannedData['operator'] ?? "";
    final onBoarding = scannedData['onBoarding'] ?? "";
    final offBoarding = scannedData['offBoarding'] ?? "";
    final ticketNo = scannedData['ticketNo'] ?? "";
    final price = scannedData['price'] ?? "";

    if (!isValidTicket(operator, onBoarding, offBoarding, ticketNo, price)) {
      clearDetails();
      return;
    }

    final SharedPreferences prefs = await _prefs;
    final String? ticket = prefs.getString(scannedData['ticketNo']);

    setState(() {
      _operator = operator;
      _onBoarding = onBoarding;
      _offBoarding = offBoarding;
      _ticketNo = ticketNo;
      _price = price;
      _isConsumed = ticket == null ? false : true;
    });

    if (ticket != null) {
      setState(() {
        _isConsumed = true;
      });
    }
  }

  void consumeTicket() async {
    if (isConsumptionDisabled()) {
      return;
    }
    final SharedPreferences prefs = await _prefs;
    prefs.setString(_ticketNo,
        '$_onBoarding "->" $_offBoarding "-" $_price "-" $_operator');
    clearDetails();
  }

  void clearDetails() {
    setState(() {
      _operator = '';
      _onBoarding = '';
      _offBoarding = '';
      _ticketNo = '';
      _price = '';
      _isConsumed = false;
    });
  }

  String getConsumeButtonText() {
    if (_ticketNo == '') {
      return "Scan Ticket to Consume";
    }
    if (_isConsumed) {
      return "Ticket Already Consumed";
    }
    return "Consume";
  }

  Color getConsumeButtonColour() {
    if (isConsumptionDisabled()) {
      return Colors.grey;
    }
    return Colors.lightGreen;
  }

  bool isConsumptionDisabled() {
    if (_ticketNo == '' || _isConsumed) {
      return true;
    }
    return false;
  }

  bool isValidTicket(String operator, String onBoarding, String offBoarding,
      String ticketNo, String price) {
    if (operator != '' &&
        onBoarding != '' &&
        offBoarding != '' &&
        ticketNo != '' &&
        price != '') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightBlueAccent,
          title: const Text("Verify Tickets"),
          actions: [
            IconButton(
                onPressed: navigateToMenu, icon: const Icon(Icons.arrow_back))
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 90),
                const Text(
                  "Ticket Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 30),
                TicketDetails(
                    operator: _operator,
                    onBoarding: _onBoarding,
                    offBoarding: _offBoarding,
                    ticketNo: _ticketNo,
                    price: _price),
                MyButton(
                    onTap: consumeTicket,
                    buttonText: getConsumeButtonText(),
                    buttonColour: getConsumeButtonColour()),
                MyButton(
                  onTap: clearDetails,
                  buttonText: "Clear Details",
                  buttonColour: Colors.white38,
                  textColour: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
