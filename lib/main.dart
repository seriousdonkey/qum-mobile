import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qum/ui/bloc/fees/fees_bloc.dart';
import 'package:qum/ui/pages/dashboard.dart';
import 'package:qum/ui/pages/fees.dart';
import 'package:qum/ui/pages/meter_readings.dart';
import 'di.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<FeesBloc>()),
      ],
      child: MaterialApp(
        title: 'Qum',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [const Dashboard(), const MeterReadings(), const Fees()];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.space_dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.table_view), label: 'Zählerstand'),
          BottomNavigationBarItem(
              icon: Icon(Icons.description), label: 'Gebühren'),
        ],
      ),
    );
  }
}
