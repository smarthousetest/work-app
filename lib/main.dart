import 'package:blogonomy/auth/auth_page.dart';
import 'package:blogonomy/cubit/locator_services.dart';
import 'package:blogonomy/cubit/network/card_cubitCateg.dart';
import 'package:blogonomy/cubit/panel_controller_cubit.dart';
//import 'package:blogonomy/librur/bottom_bar.dart';
import 'package:blogonomy/widget/blogers.dart';
import 'package:blogonomy/widget/profile.dart';
import 'package:blogonomy/widget/collections.dart';
import 'package:blogonomy/widget/sliding_up/bloger_panel.dart';
import 'package:blogonomy/widget/sliding_up/sliding_up_panel.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:blogonomy/cubit/locator_services.dart' as servic;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await servic.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SlidingUpCubit>(
              create: (context) => sl<SlidingUpCubit>()),
          BlocProvider<SlidingUpCubit2>(
              create: (context) => sl<SlidingUpCubit2>()),
          BlocProvider<CardCubit>(create: (context) => sl<CardCubit>()),
          BlocProvider<BlogersCubit>(create: (context) => sl<BlogersCubit>())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AuthPage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        onTap();
      }
    });
    print(_selectedIndex);
  }

  onTap() {
    context.read<SlidingUpCubit>().open();
  }

  final List<Widget> _widgetOptions = <Widget>[
    const CollectionsPage(),
    Blogers(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: FloatingNavbar(
          width: MediaQuery.of(context).size.width,
          elevation: 5,
          margin: const EdgeInsets.only(left: 18, right: 18),
          selectedBackgroundColor: Colors.blue,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          itemBorderRadius: 28,
          // iconSize: 50,
          items: [
            FloatingNavbarItem(
              customWidget: 'assets/icons/category_icon.svg',
            ),
            FloatingNavbarItem(
              customWidget: 'assets/icons/star_icon.svg',
            ),
            FloatingNavbarItem(
              customWidget: 'assets/icons/iconly_light_profile.svg',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) => _onItemTapped(index),
        ));
  }
}
