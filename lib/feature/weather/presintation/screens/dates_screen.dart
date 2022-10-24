import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../config/routes/app_routes.dart';

class DatesScreen extends StatefulWidget {
  const DatesScreen({super.key});

  @override
  State<DatesScreen> createState() => _DatesScreenState();
}

class _DatesScreenState extends State<DatesScreen> {
  final _currentDate = DateTime.now();
  final _dayFormatter = DateFormat('d');
  final _monthFormatter = DateFormat('MMM');
  @override
  Widget build(BuildContext context) {
    final dates = <Widget>[];

    for (int i = 0; i < 6; i++) {
      final date = _currentDate.add(Duration(days: i));
      dates.add(GestureDetector(
        onTap: () => Navigator.pushNamed(context, Routes.weatherRoute),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _dayFormatter.format(date),
              style: const TextStyle(color: Colors.white70, fontSize: 36),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              _monthFormatter.format(date),
              style: const TextStyle(color: Colors.white70, fontSize: 36),
            ),
          ],
        ),
      ));
    }

    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent.shade100,
        elevation: 0,
        title: const Text('Choose a date'),
      ),
      body: Center(
        child: Column(
          children: dates.map((widget) => Expanded(child: widget)).toList(),
        ),
      ),
    );
  }
}
