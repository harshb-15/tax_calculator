import 'package:flutter/material.dart';

class NonTransport extends StatefulWidget {
  const NonTransport({Key? key}) : super(key: key);

  @override
  State<NonTransport> createState() => _NonTransportState();
}

class _NonTransportState extends State<NonTransport> {
  bool? isScheme = false;
  String toPrint = "";
  String? dropDownValue = "Motor Cycle";
  final items = ["Motor Cycle", "Motor Cab", "Bus"];

  String? dropDownValue2 = "3";
  final items2 = ["3", "4", "5"];

  double calc(String vehicleClass, bool isScheme, String drop2) {
    if (vehicleClass == "Motor Cab") {
      if (drop2 == '3') {
        return 320;
      } else if (drop2 == '4') {
        return 370;
      } else {
        return 425;
      }
    } else if (vehicleClass == "Bus") {
      return 2000;
    } else {
      if (isScheme) {
        return 1200;
      } else {
        return 150;
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
                value: "Annual",
                items: const [
                  DropdownMenuItem(
                    value: "Annual",
                    child: Text("Annual"),
                  )
                ],
                onChanged: (String? newValue) {},
              ),
            ],
          ),
          dropDownValue == "Motor Cycle"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isScheme,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isScheme = newValue;
                        });
                      },
                    ),
                    const Text("Rent a Motor Cycle Scheme, 1997"),
                  ],
                )
              : Container(),
          dropDownValue == "Motor Cab"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Seating Capacity"),
                    DropdownButton(
                      // icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                      value: dropDownValue2,
                      items: items2
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue2 = newValue;
                        });
                      },
                    ),
                  ],
                )
              : Container(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              setState(() {
                toPrint = calc(dropDownValue!, isScheme!, dropDownValue2!).toString();
              });
            },
            child: const Text("Calculate"),
          ),
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
