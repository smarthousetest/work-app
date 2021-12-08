import 'package:blogonomy/cubit/panel_controller_cubit.dart';
import 'package:blogonomy/screens/popular_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:provider/src/provider.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({Key? key}) : super(key: key);

  @override
  _CollectionsPageState createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  Map<int, Widget> children = <int, Widget>{
    0: const Text(
      'Популярные',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Roboto-Medium.ttf',
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Color(0xFF24282E),
      ),
    ),
    1: const Text(
      'Мои',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Roboto-Medium.ttf',
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Color(0xFF24282E),
      ),
    ),
  };
  List<Widget> images = [
    const Popular(),
    Center(
      child: Image.network(
          'https://lh3.googleusercontent.com/proxy/BCqgk3QaxD3U4JgGL2A84jdJyrmJSX6yA_LS_9a4_1gHzJw0-2dctYB94BQyIpss8toalUpX7mIuGMKKVp4BSLuJmUO3ycX-Rd8dg_AoBBWiXlXmxj3D7Hf3Us_hYE3crQNw3D6M-Sh8LO6LNroC0jqBOZEK'),
    )
  ];
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFFFFFFF)),
              child: ListView(children: [
                const SizedBox(height: 62.0),
                Container(
                  alignment: Alignment.center,
                  height: 20.0,
                  child: const Text(
                    'Категории',
                    style: TextStyle(
                      fontFamily: 'Roboto-Medium.ttf',
                      fontSize: 18.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF24282E),
                    ),
                  ),
                ),
                const SizedBox(height: 34.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LayoutBuilder(
                    builder: (context, constraints) =>
                        CustomSlidingSegmentedControl<int>(
                      radius: 30,
                      padding: 8,
                      innerPadding: 4,
                      fixedWidth: (constraints.maxWidth - 8) / 2,
                      backgroundColor: const Color(0xFFF0F2FE),
                      thumbColor: const Color(0xFFFFFFFF),
                      children: children,
                      initialValue: selectedValue,
                      onValueChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 26.0),
                Container(
                  child: images[selectedValue],
                )
              ]))),
    );
  }
}
