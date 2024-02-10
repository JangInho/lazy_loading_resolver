import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LazyLoadingResolver(),
    );
  }
}

class LazyLoadingResolver extends StatefulWidget {
  const LazyLoadingResolver({super.key});

  @override
  State<LazyLoadingResolver> createState() => _LazyLoadingResolverState();
}

class _LazyLoadingResolverState extends State<LazyLoadingResolver> {
  @override
  Widget build(BuildContext context) {
    return ;
  }
}

