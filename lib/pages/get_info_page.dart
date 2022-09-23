import 'package:countskan/db/meter_database.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../model/meter.dart';
import 'package:countskan/colors.dart';

class GetInfoPage extends StatefulWidget {
  const GetInfoPage({super.key});

  @override
  _GetInfoPageState createState() => _GetInfoPageState();
}

class _GetInfoPageState extends State<GetInfoPage> {
  bool isLoading = false;
  late List<Meter> list;
  late Meter dropdownValue;

  @override
  void initState() {
    super.initState();
    refreshMeters();
  }

  /*@override
  void dispose() {
    MeterDatabase.instance.close();
    super.dispose();
  }*/

  Future refreshMeters() async {
    setState(() {
      isLoading = true;
    });
    list = await MeterDatabase.instance.readAllMeter();
    dropdownValue = list[0];
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsDefault.colorAppBar,
        centerTitle: true,
        title: const Text(
          'CountArch',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Column(children: [
                  DropdownButton(
                      value: dropdownValue,
                      items: list.map((Meter value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value.date),
                        );
                      }).toList(),
                      onChanged: (Meter? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      }),
                  Column(children: [
                    Text('Горячая вода: ${dropdownValue.hotWater} м^3'),
                    Text('Холодная вода: ${dropdownValue.coldWater} м^3'),
                    Text('Электричество: ${dropdownValue.electricity} кВт*ч')
                  ]),
                ]),
        ),
      ),
    );
  }
}
