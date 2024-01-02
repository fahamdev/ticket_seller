import 'package:flutter/material.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:sunmi_printer_plus/sunmi_style.dart';
import 'package:ticket_seller/components/divider_with_text.dart';
import '../components/button.dart';

class CircularRoutePage extends StatefulWidget {
  const CircularRoutePage({super.key});

  @override
  State<CircularRoutePage> createState() => _CircularRoutePageState();
}

class _CircularRoutePageState extends State<CircularRoutePage> {
  bool printerBound = false;
  final List<String> _locations = [
    'Rampura',
    'FDC',
    'Bow Bazar',
    'Police Plaza'
  ];
  List<String> _destinations = ['FDC', 'Bow Bazar', 'Police Plaza'];
  String _origin = 'Rampura';

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
    var destinations = ['Rampura', 'FDC', 'Bow Bazar', 'Police Plaza'];
    destinations.remove(newValue);
    setState(() {
      _origin = newValue!;
      _destinations = destinations;
    });
  }

  String generateTicketNo (String destination) {
    final prefix = '${_origin[0]}${destination[0]}';
    final now = DateTime.now();
    final timeStamp =now.day.toString()+now.hour.toString()+now.minute.toString()+now.second.toString()+now.millisecond.toString();
    return '$prefix$timeStamp';
  }

  String getPrice (String destination) {
    final originIndex = _locations.indexOf(_origin);
    final destinationIndex = _locations.indexOf(destination);
    final price = (originIndex - destinationIndex).abs() * 10;
    return price.toString();
  }

  void printTicket(String destination) async {
    var ticketNo = generateTicketNo(destination);
    var price = getPrice(destination);
    const operatorName = "Circular Bus Service";
    await SunmiPrinter.initPrinter();
    await SunmiPrinter.startTransactionPrint(true);
    await SunmiPrinter.printText(
      'Circular Bus Service',
      style: SunmiStyle(
          align: SunmiPrintAlign.CENTER,
          bold: true,
          fontSize: SunmiFontSize.LG),
    );
    await SunmiPrinter.printText(
      '$_origin -> $destination',
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
    await SunmiPrinter.setAlignment(
        SunmiPrintAlign.CENTER);
    await SunmiPrinter.printQRCode(
        '{"operator": "$operatorName","onBoarding": "$_origin","offBoarding": "$destination","ticketNo": "$ticketNo","price": "$price"}', size : 4);
    await SunmiPrinter.lineWrap(3);
    await SunmiPrinter.exitTransactionPrint(true);
  }

  List<Widget> _buildButtonsWithNames() {
    buttonsList.clear();
    for (int i = 0; i < _destinations.length; i++) {
      buttonsList.add(MyButton(
        onTap: () => printTicket(_destinations[i]),
        buttonText: _destinations[i],
        buttonColour: Colors.lightBlue,
      ));
    }
    return buttonsList;
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
          title: const Text("Circular Route Tickets"),
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
                const SizedBox(height: 50),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: DividerWithText(
                      dividerText: 'Current Station',
                    )),
                DropdownButton(
                  value: _origin,
                  onChanged: onChanged,
                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 50),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: DividerWithText(
                      dividerText: 'Select Destination',
                    )),
                const SizedBox(height: 50),
                Wrap(children: _buildButtonsWithNames())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
