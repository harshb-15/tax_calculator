import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Transport extends StatefulWidget {
  const Transport({Key? key}) : super(key: key);

  @override
  State<Transport> createState() => _TransportState();
}

class _TransportState extends State<Transport> {
  TextEditingController costController = TextEditingController();
  String toPrint = "";
  String? dropDownValue = "Motor Cycle";
  final items = ["Motor Cycle", "Motor Car"];
  var cost = 0;

  double calc(String vehicleClass, int cost) {
    if (vehicleClass == "Motor Cycle") {
      if (cost > 300000) {
        return (double.parse("15") * cost / 100);
      } else if (cost > 150000) {
        return (double.parse("12") * cost / 100);
      } else {
        return (double.parse("9") * cost / 100);
      }
    } else {
      if (cost > 3500000) {
        return (double.parse("14") * cost / 100);
      } else if (cost > 1500000) {
        return (double.parse("13") * cost / 100);
      } else if (cost > 600000) {
        return (double.parse("11") * cost / 100);
      } else {
        return (double.parse("9") * cost / 100);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Vehicle Class"),
              DropdownButton(
                // icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                value: dropDownValue,
                items: items
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Tax Mode"),
              DropdownButton(
                value: "One Time",
                items: const [
                  DropdownMenuItem(
                    value: "One Time",
                    child: Text("One Time"),
                  )
                ],
                onChanged: (String? newValue) {},
              ),
            ],
          ),
          TextField(
            controller: costController,
            decoration: const InputDecoration(labelText: "Cost of Vehicle"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                setState(() {
                  toPrint = calc(
                    dropDownValue!,
                    int.parse(costController.text),
                  ).toString();
                });
              },
              child: const Text("Calculate")),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent[100],
              border: const Border(
                bottom: BorderSide(color: Colors.grey),
              )
            ),
            child: Text("Tax :  $toPrint "),
          ),
        ],
      ),
    );
  }
}
