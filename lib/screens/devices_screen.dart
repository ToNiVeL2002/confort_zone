import 'package:confort_zone/screens/fans_screen.dart';
import 'package:confort_zone/screens/heaters_screen.dart';
import 'package:confort_zone/screens/temperature_screen.dart';
import 'package:flutter/material.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  child: Text(
                    "Ventiladores",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    "Calefones",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    "Sensores de Temp.",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: const [
                FansScreen(),
                HeatersScreen(),
                TemperatureScreen(),
              ],
            ))
          ],
        )),
      ),
    );
  }
}
