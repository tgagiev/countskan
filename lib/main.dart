import 'package:countskan/colors.dart';
import 'package:countskan/pages/ed_info_page.dart';
import 'package:countskan/pages/get_info_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: LandingPage(), debugShowCheckedModeBanner: false));
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsDefault.colorAppBar,
          title: const Center(
              child: Text(
            'CountArch',
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            ColorsDefault.primaryGray,
            ColorsDefault.secondaryGray
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: const SelectList(),
        ));
  }
}
// {Navigator.of(context).push(MaterialPageRoute(builder: (context) => EdInfoPage()));},
//-----WIDGETS-----

class SelectList extends StatelessWidget {
  const SelectList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(150, 50)),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const Color.fromARGB(255, 75, 17, 6);
                  }
                  return ColorsDefault.colorAppBar;
                }),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EdInfoPage()));
              },
              child: const Text("Записать")),
          ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(150, 50)),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const Color.fromARGB(255, 75, 17, 6);
                  }
                  return ColorsDefault.colorAppBar;
                }),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GetInfoPage()));
              },
              child: Text('Посмотреть')),
        ],
      ),
    );
  }
}
