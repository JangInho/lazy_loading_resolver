import 'dart:developer';

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
  TextEditingController textEditingController = TextEditingController();
  List<GlobalKey> keys = List.generate(50, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lazy loading 을 없애보자!!'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                    controller: textEditingController,
                    keyboardType: TextInputType.number),
              ),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        log("scroll to target!!!!");
                        if (keys[int.parse(textEditingController.text)]
                                .currentContext ==
                            null) {
                          log("fail scroll to");
                          return;
                        }
                        Scrollable.ensureVisible(
                            keys[int.parse(textEditingController.text)]
                                .currentContext!,
                            duration: const Duration(microseconds:500 ));
                      },
                      child: const Text("start")))
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 50,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    key: keys[index],
                    title: Text('😄 $index'),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
