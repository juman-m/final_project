import 'package:final_project/screens/teeth_screens/add_tooth_status_bottom_sheet.dart';
import 'package:final_project/screens/teeth_screens/dispaly_tooth_status_bottom_sheet.dart';
import 'package:final_project/screens/teeth_screens/status_previwe.dart';
import 'package:final_project/style/size.dart';
import 'package:flutter/material.dart';

class TeethScreen extends StatelessWidget {
  const TeethScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Color> teethColors = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
    return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          backgroundColor: const Color(0xFF0086D3),
          title: const Text(
            "أسناني",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const StatusPreview(),
              height34(),
              Center(
                child: SizedBox(
                  width: 330,
                  height: 530,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 266,
                        top: 216,
                        child: Row(
                          children: [
                            const Text(
                              '1',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(42),
                                      topRight: Radius.circular(42),
                                    ),
                                  ),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return const DisplayToothStatusBottomSheet(
                                      toothNum: '1',
                                    );
                                  },
                                );
                              },
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/image/tooth1_background.png",
                                    height: 35,
                                    fit: BoxFit.cover,
                                    color: teethColors[0],
                                  ),
                                  Image.asset(
                                    "assets/image/tooth1.png",
                                    height: 35,
                                    color: Colors.black,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 268,
                        top: 182,
                        child: Row(
                          children: [
                            const Text(
                              '2',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(42),
                                      topRight: Radius.circular(42),
                                    ),
                                  ),
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return const AddToothStatusBottomSheet(
                                      toothNum: '2',
                                    );
                                  },
                                );
                              },
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/image/tooth2_background.png",
                                    height: 36,
                                    fit: BoxFit.cover,
                                    color: teethColors[1],
                                  ),
                                  Image.asset(
                                    "assets/image/tooth2.png",
                                    height: 36,
                                    color: Colors.black,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 262,
                        top: 151,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const Text(
                                  '3',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                height10()
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth3_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[2],
                                ),
                                Image.asset(
                                  "assets/image/tooth3.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 253,
                        top: 124,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const Text(
                                  '4',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                height14()
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth4_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[3],
                                ),
                                Image.asset(
                                  "assets/image/tooth4.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 239,
                        top: 94,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const Text(
                                  '5',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                height30()
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth5_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[4],
                                ),
                                Image.asset(
                                  "assets/image/tooth5.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 222,
                        top: 60,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  '6',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                width30(),
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth6_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[5],
                                ),
                                Image.asset(
                                  "assets/image/tooth6.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 195,
                        top: 34,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  '7',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                width30(),
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth7_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[6],
                                ),
                                Image.asset(
                                  "assets/image/tooth7.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 163,
                        top: 20,
                        child: Column(
                          children: [
                            const Text(
                              '8',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            height4(),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth8_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[7],
                                ),
                                Image.asset(
                                  "assets/image/tooth8.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 124.5,
                        top: 20,
                        child: Column(
                          children: [
                            const Text(
                              '9',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            height4(),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth9_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[8],
                                ),
                                Image.asset(
                                  "assets/image/tooth9.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 88,
                        top: 36,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                width20(),
                                const Text(
                                  '10',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth10_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[9],
                                ),
                                Image.asset(
                                  "assets/image/tooth10.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 67,
                        top: 61,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                width30(),
                                const Text(
                                  '11',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth11_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[10],
                                ),
                                Image.asset(
                                  "assets/image/tooth11.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 85,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                width34(),
                                const Text(
                                  '12',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth12_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[11],
                                ),
                                Image.asset(
                                  "assets/image/tooth12.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 22,
                        top: 124,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth13_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[12],
                                ),
                                Image.asset(
                                  "assets/image/tooth13.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  '13',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                height14(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 150,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth14_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[13],
                                ),
                                Image.asset(
                                  "assets/image/tooth14.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  '14',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                height10()
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 180,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth15_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[14],
                                ),
                                Image.asset(
                                  "assets/image/tooth15.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            const Text(
                              '15',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 213,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth16_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[15],
                                ),
                                Image.asset(
                                  "assets/image/tooth16.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            const Text(
                              '16',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 264,
                        bottom: 218,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  '32',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Image.asset(
                                      "assets/image/tooth32_background.png",
                                      height: 38,
                                      fit: BoxFit.cover,
                                      color: teethColors[31],
                                    ),
                                    Image.asset(
                                      "assets/image/tooth32.png",
                                      height: 38,
                                      color: Colors.black,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 263,
                        bottom: 184,
                        child: Row(
                          children: [
                            const Text(
                              '31',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth31_background.png",
                                  height: 38,
                                  fit: BoxFit.cover,
                                  color: teethColors[30],
                                ),
                                Image.asset(
                                  "assets/image/tooth31.png",
                                  height: 38,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 254,
                        bottom: 153,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                height10(),
                                const Text(
                                  '30',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth30_background.png",
                                  height: 38,
                                  fit: BoxFit.cover,
                                  color: teethColors[29],
                                ),
                                Image.asset(
                                  "assets/image/tooth30.png",
                                  height: 38,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 241,
                        bottom: 122,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                height14(),
                                const Text(
                                  '29',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth29_background.png",
                                  height: 38,
                                  fit: BoxFit.cover,
                                  color: teethColors[28],
                                ),
                                Image.asset(
                                  "assets/image/tooth29.png",
                                  height: 38,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 224,
                        bottom: 95,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                height14(),
                                const Text(
                                  '28',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth28_background.png",
                                  height: 36,
                                  fit: BoxFit.cover,
                                  color: teethColors[27],
                                ),
                                Image.asset(
                                  "assets/image/tooth28.png",
                                  height: 36,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 210,
                        bottom: 73,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                height16(),
                                const Text(
                                  '27',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth27_background.png",
                                  height: 31,
                                  fit: BoxFit.cover,
                                  color: teethColors[26],
                                ),
                                Image.asset(
                                  "assets/image/tooth27.png",
                                  height: 31,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 193,
                        bottom: 39.5,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth26_background.png",
                                  height: 33,
                                  fit: BoxFit.cover,
                                  color: teethColors[25],
                                ),
                                Image.asset(
                                  "assets/image/tooth26.png",
                                  height: 33,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  '26',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                width30()
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 169,
                        bottom: 29,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth25_background.png",
                                  height: 29,
                                  fit: BoxFit.cover,
                                  color: teethColors[24],
                                ),
                                Image.asset(
                                  "assets/image/tooth25.png",
                                  height: 29,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            height4(),
                            const Text(
                              '25',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 137,
                        bottom: 26,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth24_background.png",
                                  height: 29,
                                  fit: BoxFit.cover,
                                  color: teethColors[23],
                                ),
                                Image.asset(
                                  "assets/image/tooth24.png",
                                  height: 29,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            height4(),
                            const Text(
                              '24',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 108,
                        bottom: 35,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth23_background.png",
                                  height: 32,
                                  fit: BoxFit.cover,
                                  color: teethColors[22],
                                ),
                                Image.asset(
                                  "assets/image/tooth23.png",
                                  height: 32,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                width20(),
                                const Text(
                                  '23',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 86,
                        bottom: 49,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth22_background.png",
                                  height: 32,
                                  fit: BoxFit.cover,
                                  color: teethColors[21],
                                ),
                                Image.asset(
                                  "assets/image/tooth22.png",
                                  height: 32,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                width30(),
                                const Text(
                                  '22',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 50,
                        bottom: 81,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth21_background.png",
                                  height: 38,
                                  fit: BoxFit.cover,
                                  color: teethColors[20],
                                ),
                                Image.asset(
                                  "assets/image/tooth21.png",
                                  height: 38,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                height30(),
                                const Text(
                                  '21',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 28,
                        bottom: 114,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth20_background.png",
                                  height: 38,
                                  fit: BoxFit.cover,
                                  color: teethColors[19],
                                ),
                                Image.asset(
                                  "assets/image/tooth20.png",
                                  height: 38,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                height10(),
                                const Text(
                                  '20',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 15,
                        bottom: 146,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth19_background.png",
                                  height: 40,
                                  fit: BoxFit.cover,
                                  color: teethColors[18],
                                ),
                                Image.asset(
                                  "assets/image/tooth19.png",
                                  height: 40,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                height10(),
                                const Text(
                                  '19',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 8,
                        bottom: 178,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth18_background.png",
                                  height: 39,
                                  fit: BoxFit.cover,
                                  color: teethColors[17],
                                ),
                                Image.asset(
                                  "assets/image/tooth18.png",
                                  height: 39,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            const Text(
                              '18',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 8,
                        bottom: 215,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/image/tooth17_background.png",
                                  height: 39,
                                  fit: BoxFit.cover,
                                  color: teethColors[16],
                                ),
                                Image.asset(
                                  "assets/image/tooth17.png",
                                  height: 39,
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            const Text(
                              '17',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        left: 152,
                        top: 1,
                        child: Text(
                          'فوق',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF7E818C),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 154,
                        top: 507,
                        child: Text(
                          'تحت',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF7E818C),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 3,
                        top: 253,
                        child: Text(
                          'يمين',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF7E818C),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 300,
                        top: 251,
                        child: Text(
                          'يسار',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF7E818C),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
