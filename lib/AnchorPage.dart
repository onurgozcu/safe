import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'FadeRoute.dart';
import 'NotificationHandler.dart';
import 'ShoppingPage.dart';
import 'constants.dart';

class AnchorPage extends StatefulWidget {
  const AnchorPage({Key? key}) : super(key: key);

  @override
  State<AnchorPage> createState() => _AnchorPageState();
}

class _AnchorPageState extends State<AnchorPage> {
  TextEditingController _refCodeController = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height -
          40.0 -
          kBottomNavigationBarHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/anchorPageBg.png"),
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height -
                    40.0 -
                    kBottomNavigationBarHeight -
                    24.0) /
                2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/anchorPageTopIcon.png",
                  height: 45.0,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Ürün satıyorsanız aşağıdaki butona tıklayarak\nalıcınıza özel ilan oluşturabilirsiniz!",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      FadeRoute(
                        page: RoomCreatingPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    shadowColor: MaterialStateProperty.all(
                      kButtonBlue.withOpacity(0.4),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(220, 45)),
                    backgroundColor: MaterialStateProperty.all(
                      kButtonBlue,
                    ),
                    elevation: MaterialStateProperty.all(20),
                  ),
                  child: Text(
                    "Güvenli Satış Yapın",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    40.0 -
                    kBottomNavigationBarHeight -
                    24.0) /
                2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/anchorPageBottomIcon.png",
                  height: 40.0,
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text(
                  "Eğer alıcıysanız hemen aşağıdaki buton ile\nalıcının ilettiği referans kodunu girebilir ve\ngüvenli alışveriş yapmaya başlayabilirsiniz!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: TextField(
                              controller: _refCodeController,
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  _firestore
                                      .collection("Rooms")
                                      .where("refCode",
                                          isEqualTo: _refCodeController.text)
                                      .get()
                                      .then((value) {
                                    if (value.size > 0) {
                                      if (value.docs[0].data()["seller"] ==
                                          _firebaseAuth.currentUser!.uid) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Center(
                                                child: Wrap(
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        AlertDialog(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          backgroundColor:
                                                              Color(0xFF6EB0FC),
                                                          content: Center(
                                                            child: Column(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Icon(
                                                                      FontAwesomeIcons
                                                                          .times,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 48.0,
                                                                ),
                                                                Text(
                                                                  "Kendi oluşturduğunuz ilana alıcı olamazsınız!",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Image.asset(
                                                            "assets/images/warningDialogDraw.png",
                                                            height: 96.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      } else {
                                        value.docs[0].reference.update({
                                          "buyer":
                                              _firebaseAuth.currentUser!.uid,
                                          "buyerJoinDate":
                                              FieldValue.serverTimestamp(),
                                          "users": FieldValue.arrayUnion([
                                            _firebaseAuth.currentUser!.uid,
                                          ]),
                                          "state": "Ödeme bekleniyor",
                                        }).whenComplete(() async {
                                          await _firestore
                                              .collection("Users")
                                              .doc(value.docs[0]
                                                  .data()["seller"])
                                              .get()
                                              .then((userData) async {
                                            if (userData.data()![
                                                "allowNotifications"]) {
                                              await NotificationHandler
                                                  .sendNotification(
                                                      fcmToken: userData
                                                          .data()!["fcmToken"],
                                                      message:
                                                          "Alıcı odaya katıldı.");
                                            }

                                            _refCodeController.clear();
                                            Navigator.pop(context);
                                          });
                                        });
                                      }
                                    } else {
                                      _refCodeController.clear();
                                      Navigator.pop(context);
                                    }
                                  });
                                },
                                child: Text("Katıl"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _refCodeController.clear();
                                  Navigator.pop(context);
                                },
                                child: Text("İptal"),
                              ),
                            ],
                          );
                        });
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    shadowColor: MaterialStateProperty.all(
                      Color(0xFFFE9ECC).withOpacity(0.5),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(220, 45)),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    elevation: MaterialStateProperty.all(20),
                  ),
                  child: Text(
                    "Referans Kodunu Girin",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: kPink,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
