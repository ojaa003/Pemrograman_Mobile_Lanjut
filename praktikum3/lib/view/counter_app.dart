import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum3/bloc/counter_bloc.dart';
import 'package:praktikum3/view/counter_page.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterBloc(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    ),);
  }
}