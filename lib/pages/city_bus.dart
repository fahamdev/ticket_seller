import 'package:flutter/material.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:sunmi_printer_plus/sunmi_style.dart';
import 'package:ticket_seller/constants/destinations.dart';
import 'package:ticket_seller/constants/stations.dart';
import 'package:ticket_seller/models/destination.dart';
import 'package:ticket_seller/models/station.dart';

import '../components/button.dart';
import '../components/divider_with_text.dart';

class CityBusPage extends StatefulWidget {
  const CityBusPage({super.key});

  @override
  State<CityBusPage> createState() => _CityBusPageState();
}

class _CityBusPageState extends State<CityBusPage> {
  bool printerBound = false;
  bool _isUpTrip = true;

  List<Destination> _destinations = mirpur12DestinationsUp;
  Station _currentStation = mirpur12Station;
  List<MyButton> buttonsList = [];

  @override
  void initState() {
    super.initState();
    _bindingPrinter().then((bool? isBound) async {
      setState(() {
        printerBound = isBound!;
      });
    });
  }

  Future<bool?> _bindingPrinter() async {
    final bool? result = await SunmiPrinter.bindingPrinter();
    return result;
  }

  void navigateToMenu() {
    Navigator.pop(context);
  }

  void onChanged(newValue) {
    Station station = getStationByName(newValue);
    setState(() {
      _currentStation = station!;
      _destinations =
          _isUpTrip ? station.destinationsUp : station.destinationsDown;
    });
  }

  Station getStationByName(String name) {
    return stations.lastWhere((Station station) => station.name == name);
  }

  List<Widget> _buildButtonsWithNames() {
    buttonsList.clear();
    for (int i = 0; i < _destinations.length; i++) {
      buttonsList.add(MyButton(
        onTap: () => printTicket(_destinations[i].name),
        buttonText: _destinations[i].name,
        buttonColour: Colors.lightBlue,
        buttonPadding: 15,
        buttonMarginVertical: 8,
      ));
    }
    return buttonsList;
  }

  String generateTicketNo(String destination) {
    final prefix = '${_currentStation.name[0]}${destination[0]}';
    final now = DateTime.now();
    final timeStamp = now.day.toString() +
        now.hour.toString() +
        now.minute.toString() +
        now.second.toString() +
        now.millisecond.toString();
    return '$prefix$timeStamp';
  }

  String getPrice(String destination) {
    if (_isUpTrip) {
      return (_currentStation.destinationsUp
              .firstWhere((Destination dest) => dest.name == destination))
          .price
          .toString();
    } else {
      return (_currentStation.destinationsDown
              .firstWhere((Destination dest) => dest.name == destination))
          .price
          .toString();
    }
  }

  void printTicket(String destination) async {
    final ticketNo = generateTicketNo(destination);
    final price = getPrice(destination);
    const operatorName = "City Bus Service";
    final qrCodeMessage =
        '{"operator": "$operatorName","onBoarding": "${_currentStation.name}","offBoarding": "$destination","ticketNo": "$ticketNo","price": "$price"}';
    print(ticketNo);
    print(price);

    await SunmiPrinter.initPrinter();
    await SunmiPrinter.startTransactionPrint(true);
    await SunmiPrinter.printText(
      operatorName,
      style: SunmiStyle(
          align: SunmiPrintAlign.CENTER,
          bold: true,
          fontSize: SunmiFontSize.LG),
    );
    await SunmiPrinter.printText(
      '${_currentStation.name} -> $destination',
      style: SunmiStyle(
          align: SunmiPrintAlign.CENTER,
          bold: true,
          fontSize: SunmiFontSize.MD),
    );
    await SunmiPrinter.printText(
      'Ticket Price - $price ৳',
      style: SunmiStyle(
          align: SunmiPrintAlign.CENTER,
          bold: true,
          fontSize: SunmiFontSize.MD),
    );
    await SunmiPrinter.lineWrap(1);
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    const options = {SunmiQrcodeLevel.LEVEL_H, 5};
    await SunmiPrinter.printQRCode(qrCodeMessage, size : 4);
    await SunmiPrinter.lineWrap(3);
    await SunmiPrinter.exitTransactionPrint(true);
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
          title: const Text("City Bus Tickets"),
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
                const SizedBox(height: 20),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: DividerWithText(
                      dividerText: 'Current Station',
                    )),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: DropdownButton(
                          value: _currentStation.name,
                          onChanged: onChanged,
                          items: stations.map((station) {
                            return DropdownMenuItem(
                              value: station.name,
                              child: Text(station.name),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Switch(
                          value: _isUpTrip,
                          activeColor: Colors.blueAccent,
                          thumbColor: const MaterialStatePropertyAll<Color>(
                              Colors.blue),
                          thumbIcon: _isUpTrip
                              ? const MaterialStatePropertyAll<Icon>(
                                  Icon(Icons.arrow_forward_ios_rounded))
                              : const MaterialStatePropertyAll<Icon>(
                                  Icon(Icons.arrow_back_ios_rounded)),
                          onChanged: (bool value) {
                            setState(() {
                              _isUpTrip = value;
                              _destinations = value
                                  ? _currentStation.destinationsUp
                                  : _currentStation.destinationsDown;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: DividerWithText(
                      dividerText: 'Select Destination',
                    )),
                const SizedBox(height: 20),
                Wrap(children: _buildButtonsWithNames())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
