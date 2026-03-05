import 'package:flutter/material.dart';
import 'package:calculator_luas/model/geometry.dart';
import 'package:calculator_luas/screen/rumus/hitung_kubus.dart';
import 'package:calculator_luas/screen/rumus/hitung_tabung.dart';
import 'package:calculator_luas/screen/rumus/hitung_kerucut.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),

      body: Stack(
        children: [
          // background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg_geometry.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(color: Colors.black.withOpacity(0.4)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Kalkulator",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Bangun Ruang",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),

                  const SizedBox(height: 40),

                  Expanded(
                    child: ListView.builder(
                      itemCount: bangunRuang.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.only(bottom: 20),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(20),

                            title: Text(
                              bangunRuang[index].title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            subtitle: Text(
                              "Volume: ${bangunRuang[index].formula}",
                            ),

                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),

                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (index == 0)
                                      ? HitungKubus(model: bangunRuang[index])
                                      : (index == 1)
                                      ? HitungTabung(model: bangunRuang[index])
                                      : HitungKerucut(
                                          model: bangunRuang[index],
                                        ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
