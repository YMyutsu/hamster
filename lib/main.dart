import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HamsterGacha()));
class HamsterGacha extends StatefulWidget {
  const HamsterGacha({super.key});

  @override
  State<HamsterGacha> createState() => _HamsterGachaState();
}

class _HamsterGachaState extends State<HamsterGacha> {
  int n = 0, e = 0;
  bool loading = false;
  final emojis = ['🐧', '🐉', '🐢', '🧢','🐬','🦁'];
  final images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqSLy3quHNZ6Nbokti0l47rzaIPKD47SSUr_8UyYDNrw&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbK-ROdokKHKs-vM7qEKxpupAxHxCMfRcD-NHuVqaplw&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE6388_qW01cPwMjqZfiEVS2h8VXo_BjY35xEtWpie7Q&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUtNQGs8fsFrZRUoDi4ayrhbH14f3e4gFdCtABkB4rYQ&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJe9q2KC3XoLjvReIEE27DQMNQsmnNya4K3yop6hsQdA&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB_o9sFVDJTc49oVlCgYGE65DMmtIF7bxDnOgzECbb7A&s=10"

  ];

  Future<void> gacha() async {
    setState(() => loading = true);
        for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() => e = (e + 1) % emojis.length);
    }
    setState(() {
      n = Random().nextInt(images.length);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('🅱️ BE:FIRST Gacha')),
    body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                    SizedBox(
            width: 300,
            height: 450,
            child: loading
                ? Center(
                    child: Text(
                      emojis[e],
                      style: const TextStyle(fontSize: 100),
                    ),
                  )
                : Image.network(images[n], fit: BoxFit.cover),
          ),
          const SizedBox(height: 30),
          const Text('1️⃣', style: TextStyle(fontSize: 72)),
          ElevatedButton(
            onPressed: loading ? null : gacha,
            child: const Text('自引きできますように！'),
          ),
        ],
       ),
     ),

  );
}