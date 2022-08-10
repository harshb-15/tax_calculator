import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tax_calculator/providers/lists.dart';
import 'package:tax_calculator/widgets/non_transport.dart';
import 'package:tax_calculator/widgets/transport.dart';
// import 'package:tax_calculator/widgets/drop_down.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ListData(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green,
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              fontSize: 18,
            ),
            bodyText1: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        title: 'Flutter Demo',
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController costController = TextEditingController();
    final data = Provider.of<ListData>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Know your MV Tax"),
        ),
        body: Container(
          color: Color(0xffF4FCD9),
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("State"),
                  DropdownButton(
                    value: "Goa",
                    items: const [
                      DropdownMenuItem(
                        value: "Goa",
                        child: Text("Goa"),
                      )
                    ],
                    onChanged: (String? newValue) {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: FlatButton(
                      color: Colors.lightGreenAccent[200],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      onPressed: () {
                        data.toTransport();
                      },
                      child: const Text(
                        "NON TRANSPORT",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: FlatButton(
                      color: Colors.lightGreenAccent[200],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      onPressed: () {
                        data.toNonTransport();
                      },
                      child: const Text(
                        "TRANSPORT",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                ],
              ),
              data.showTransport == true
                  ? const Transport()
                  : const NonTransport(),
            ],
          ),
        ),
      ),
    );
  }
}
