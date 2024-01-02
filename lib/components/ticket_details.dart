import 'package:flutter/material.dart';

class TicketDetails extends StatelessWidget {
  final String operator;
  final String onBoarding;
  final String offBoarding;
  final String ticketNo;
  final String price;

  const TicketDetails({
    super.key,
    required this.operator,
    required this.onBoarding,
    required this.offBoarding,
    required this.ticketNo,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Row(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Operator',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  operator,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Row(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Ticket No',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  ticketNo,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Row(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'OnBoarding',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  onBoarding,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Row(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'OffBoarding',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  offBoarding,
                  style: const TextStyle(color: Colors.black,),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        Text(price != ''? "$price ৳" : "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),

        const SizedBox(height: 30),
      ],
    );
  }
}