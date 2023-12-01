import 'package:flutter/material.dart';

class ListEmployeePage extends StatefulWidget {
  static const route = '/list-employee';

  const ListEmployeePage({Key? key}) : super(key: key);

  @override
  State<ListEmployeePage> createState() => _ListEmployeePageState();
}

class _ListEmployeePageState extends State<ListEmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Text('List Employee')
      ),
    );
  }
}