import 'package:countskan/db/meter_database.dart';
import 'package:countskan/model/meter.dart';
import 'package:countskan/text_field_ed.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class EdInfoPage extends StatefulWidget {
  const EdInfoPage({super.key});

  @override
  State<EdInfoPage> createState() => _EdInfoPageState();
}

class _EdInfoPageState extends State<EdInfoPage> {
  late TextEditingController controler1;
  late TextEditingController controler2;
  late TextEditingController controler3;
  late TextEditingController controler4;

  @override
  void initState() {
    controler1 = TextEditingController();
    controler2 = TextEditingController();
    controler3 = TextEditingController();
    controler4 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controler1.dispose();
    controler2.dispose();
    controler3.dispose();
    controler4.dispose();
    super.dispose();
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
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [ColorsDefault.primaryGray, ColorsDefault.secondaryGray],
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFieldEd(lableText: "Дата", controller: controler4),
                  TextFieldEd(
                      lableText: "Горячая вода", controller: controler1),
                  TextFieldEd(
                      lableText: "Холодная вода", controller: controler2),
                  TextFieldEd(
                      lableText: "Электричество", controller: controler3),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const Color.fromARGB(255, 75, 17, 6);
                          }
                          return ColorsDefault.colorAppBar;
                        }),
                      ),
                      onPressed: () {
                        if ((controler1.text != '' ||
                                controler2.text != '' ||
                                controler3.text != '') &&
                            controler4.text != '') {
                          MeterDatabase.instance.create(Meter(
                              hotWater: int.parse(controler1.text),
                              coldWater: int.parse(controler2.text),
                              electricity: int.parse(controler3.text),
                              date: controler4.text));
                        }
                      },
                      child: const Text("Отправить"))
                ]),
          ),
        ));
  }
}
