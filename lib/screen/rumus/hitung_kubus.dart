import 'package:flutter/material.dart';
import 'package:calculator_luas/model/geometry.dart';

class HitungKubus extends StatefulWidget {
  final GeometryModel model;
  const HitungKubus({super.key, required this.model});

  @override
  State<HitungKubus> createState() => _HitungKubusState();
}

class _HitungKubusState extends State<HitungKubus> {
  final TextEditingController sisiController = TextEditingController();
  double? hasil;

  void hitungVolume() {
    final sisi = double.tryParse(sisiController.text);

    if (sisi == null || sisi <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Masukkan nilai sisi yang valid")),
      );
      return;
    }

    setState(() {
      hasil = sisi * sisi * sisi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _templateHalaman(
      context,
      widget.model,
      [_inputField("Masukkan Sisi", sisiController)],
      hitungVolume,
      hasil,
    );
  }
}

Widget _templateHalaman(
  BuildContext context,
  model,
  List<Widget> inputs,
  VoidCallback onPressed,
  double? hasil,
) {
  return Scaffold(
    appBar: AppBar(title: Text(model.title), centerTitle: true),
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Rumus: ${model.formula}"),
                  const SizedBox(height: 20),
                  ...inputs,
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onPressed,
                      child: const Text("Hitung Volume"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (hasil != null)
                    Text(
                      "Hasil: ${hasil.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _inputField(String label, TextEditingController controller) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    ),
  );
}
