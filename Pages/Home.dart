// ignore: file_names
// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:bottom_sheet_expandable_bar/bottom_sheet_bar_icon.dart';
import 'package:bottom_sheet_expandable_bar/bottom_sheet_expandable_bar.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_gg/Pages/star.dart';
import 'package:user_gg/Pub/ad_mob_helper.dart';

class RandomUser extends StatefulWidget {
  const RandomUser({Key? key}) : super(key: key);

  @override
  _RandomUserState createState() => _RandomUserState();
}

class _RandomUserState extends State<RandomUser> {
  final AdmobHelper admobHelper = AdmobHelper();

  late Map<String, dynamic> posts = {};

  Map<String, dynamic>? get data => null;

  @override
  void initState() {
    try {
      admobHelper.createInterad();
    } catch (e) {
      print("Ads Initil INTERSH : $e");
    }
    if (posts.isEmpty) print("gg");
    getDataApi().whenComplete(() {
      setState(() {
        posts = data!;
      });
    });
  }

  Future<List<Map<String, dynamic>>?> getDataApi() async {
    http.Response response =
        await http.get(Uri.parse('https://randomuser.me/api/'));
    if (response.statusCode != 200) return null;
    // var data = jsonDecode(response.body);

    Map<String, dynamic> data =
        Map<String, dynamic>.from(json.decode(response.body));

    print(" data is  $data");

    setState(() {
      posts = data;
    });
    print(" data new is  $posts");
  }

  var pub = 0;
  Future getInterPub() async {
    if (pub == 2 ||
        pub == 12 ||
        pub == 22 ||
        pub == 32 ||
        pub == 42 ||
        pub == 52 ||
        pub == 62 ||
        pub == 72 ||
        pub == 82 ||
        pub == 92 ||
        pub == 100) {
      try {
        admobHelper.createInterad();
        print("Ads Loaded Suscss");
        admobHelper.showInterad();
        print("Ads Shows");
      } catch (e) {
        print("ERORR IN PUB INTER $e");
      }
    }
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random User"),
        centerTitle: true,
        backgroundColor: Color(0xFF4d42e8),
      ),
      body: posts.isEmpty || posts == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _currentIndex == 0
              ? Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF4d42e8),
                      image: DecorationImage(
                          image: AssetImage("images/5.png"),
                          fit: BoxFit.cover)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Color(0xffFDCF09),
                                child: CircleAvatar(
                                  radius: 55,
                                  backgroundImage: NetworkImage(
                                      '${posts['results'][0]['picture']['large']}'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: SelectableText(
                                  "${posts['results'][0]['name']['first']}  ${posts['results'][0]['name']['last']}",
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: SelectableText(
                                  "Nationality & Gender : ${posts['results'][0]['nat']}  ${posts['results'][0]['gender']}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: SelectableText(
                                  "E-mail : ${posts['results'][0]['email']}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: SelectableText(
                                  "Age & Phone : ${posts['results'][0]['dob']['age']}  ${posts['results'][0]['phone']}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: SelectableText(
                                  "Dob : ${posts['results'][0]['dob']['date']}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                // padding: EdgeInsets.all(10),
                                child: SelectableText(
                                  "Street : number = ${posts['results'][0]['location']['street']['number']} & name = ${posts['results'][0]['location']['street']['name']}\nCity : ${posts['results'][0]['location']['city']}\nState & Country : ${posts['results'][0]['location']['state']} ${posts['results'][0]['location']['country']} \nPostcode : ${posts['results'][0]['location']['postcode']}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  if (posts.isEmpty) print("gg");
                                  getDataApi().whenComplete(() {
                                    setState(() {
                                      posts = data!;
                                    });
                                  });
                                  getInterPub();
                                  pub++;
                                  setState(() {
                                    print(pub);
                                  });
                                },
                                elevation: 10,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 13),
                                color: Color(0xFF4d42e8),
                                child: const Text(
                                  "Get It Now",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Star(),
      bottomSheet: Container(
        width: double.infinity,
        margin:const EdgeInsets.only(bottom: 10),
        child: BottomBarSheet(
          onClose: () {},
          bottomBarHeight: 72,
          buttonPosition: ButtonBottomBarPosition.center,
          innerChild: Center(
              child: Column(
            children: [
              //  SizedBox(
              //   height: 80,
              // ),
              // Container(
              //     child: AdWidget(
              //       ad: AdmobHelper.getBannerAd2()..load(),
              //       key: UniqueKey(),
              //     ),
              //     height: 50),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 245,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/logotm.png"))),
              ),
            ],
          )),
          iconExpand: const Icon(
            Icons.add,
            size: 35,
          ),
          currentIndex: _currentIndex,
          curve: Curves.bounceIn,
          backgroundBarColor: Color(0xFF4d42e8),
          backgroundColor: Color(0xFF4d42e8),
          children: [
            BottomSheetBarIcon(
              icon: Icon(Icons.home),
              color: Colors.redAccent,
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            BottomSheetBarIcon(
              icon: Icon(Icons.star),
              color: Colors.orangeAccent,
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                  // AdmobHelper.getBannerAd()..load();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
