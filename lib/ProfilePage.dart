import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safe/constants.dart';
import 'package:safe/main.dart';
import 'package:url_launcher/url_launcher.dart';

import 'FadeRoute.dart';
import 'MainPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map>>(
        stream: _firestore
            .collection("Users")
            .doc(_auth.currentUser!.uid)
            .snapshots(),
        builder: (context, userInfoSnapshot) {
          if (!userInfoSnapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      64.0 -
                      kBottomNavigationBarHeight),
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 15.0,
                            )
                          ],
                        ),
                        child: Icon(
                          FontAwesomeIcons.userAlt,
                          color: kDarkBlue,
                          size: 32.0,
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "İsim Soyisim",
                        style: TextStyle(
                          color: kDarkBlue,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "@${userInfoSnapshot.data!.data()!["name"]}",
                        style: TextStyle(
                          color: Color(0xFFC3C3C3),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Image.asset(
                        "assets/images/profileDivider.png",
                        height: 3.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 32.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 24.0,
                            top: 16.0,
                            left: 24.0,
                            right: 24.0,
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //TODO: NAVIGATE
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2F2F2),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          height: 40.0,
                                          width: 40.0,
                                          child: Icon(
                                            Icons.settings,
                                            color: kDarkBlue,
                                            size: 24.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 14.0,
                                        ),
                                        Text(
                                          "Ayarlar",
                                          style: TextStyle(
                                            color: kDarkBlue,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: kDarkBlue,
                                      size: 20.0,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    FadeRoute(
                                      page: BankInfoPage(),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2F2F2),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          height: 40.0,
                                          width: 40.0,
                                          child: Icon(
                                            FontAwesomeIcons.solidCreditCard,
                                            color: kDarkBlue,
                                            size: 16.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 14.0,
                                        ),
                                        Text(
                                          "Hesap Bilgileri",
                                          style: TextStyle(
                                            color: kDarkBlue,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: kDarkBlue,
                                      size: 20.0,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  //TODO: NAVIGATE
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2F2F2),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          height: 40.0,
                                          width: 40.0,
                                          child: Icon(
                                            FontAwesomeIcons.userAlt,
                                            color: kDarkBlue,
                                            size: 16.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 14.0,
                                        ),
                                        Text(
                                          "Kullanıcı ayarları",
                                          style: TextStyle(
                                            color: kDarkBlue,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: kDarkBlue,
                                      size: 20.0,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(
                                color: Color(0xFFE2E2E2),
                                height: 3.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  launch(
                                    "https://safe.onurgozcu.com",
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2F2F2),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          height: 40.0,
                                          width: 40.0,
                                          child: Icon(
                                            FontAwesomeIcons.solidFileAlt,
                                            color: kDarkBlue,
                                            size: 16.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 14.0,
                                        ),
                                        Text(
                                          "Gizlilik Sözleşmesi",
                                          style: TextStyle(
                                            color: kDarkBlue,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: kDarkBlue,
                                      size: 20.0,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  launch(
                                    "https://safe.onurgozcu.com",
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2F2F2),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          height: 40.0,
                                          width: 40.0,
                                          child: Icon(
                                            FontAwesomeIcons.solidFileAlt,
                                            color: kDarkBlue,
                                            size: 16.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 14.0,
                                        ),
                                        Text(
                                          "KVKK Sözleşmesi",
                                          style: TextStyle(
                                            color: kDarkBlue,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: kDarkBlue,
                                      size: 20.0,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(
                                color: Color(0xFFE2E2E2),
                                height: 3.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  //TODO: NAVIGATE
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2F2F2),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          height: 40.0,
                                          width: 40.0,
                                          child: Icon(
                                            Icons.help,
                                            color: kDarkBlue,
                                            size: 16.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 14.0,
                                        ),
                                        Text(
                                          "Yardım",
                                          style: TextStyle(
                                            color: kDarkBlue,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: kDarkBlue,
                                      size: 20.0,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await _auth.signOut().whenComplete(
                                      () => Navigator.pushAndRemoveUntil(
                                          context,
                                          FadeRoute(
                                            page: MyApp(),
                                          ),
                                          (route) => false));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2F2F2),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          height: 40.0,
                                          width: 40.0,
                                          child: Icon(
                                            FontAwesomeIcons.signOutAlt,
                                            color: kPink,
                                            size: 16.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 14.0,
                                        ),
                                        Text(
                                          "Çıkış Yap",
                                          style: TextStyle(
                                            color: kPink,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: kPink,
                                      size: 20.0,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class BankInfoPage extends StatefulWidget {
  @override
  _BankInfoPageState createState() => _BankInfoPageState();
}

class _BankInfoPageState extends State<BankInfoPage> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35),
        child: AppBar(
          title: Text(
            "Hesap Bilgileri",
            style: TextStyle(fontSize: 16),
          ),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 24,
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  FadeRoute(
                      page: MainPage(
                    initialIndex: 4,
                  )),
                  (route) => false);
            },
          ),
          backgroundColor: kDarkBlue,
          centerTitle: true,
        ),
      ),
      body: StreamBuilder<DocumentSnapshot<Map>>(
          stream: _firestore
              .collection("Users")
              .doc(_auth.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.data()!["iban"] == null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                  ),
                  Image.asset(
                    "assets/images/bankInfoDraw.png",
                    height: MediaQuery.of(context).size.height * 0.45,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Hesap Bilgilerinizi Girin",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3540),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Kazançlarınızı hesabınıza aktarmamız için\nhesap bilgilerinizi giriniz. ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF2D3540),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 45),
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        elevation: MaterialStateProperty.all(14),
                        shadowColor: MaterialStateProperty.all(
                            kButtonBlue.withOpacity(0.5)),
                        backgroundColor: MaterialStateProperty.all(kButtonBlue),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          FadeRoute(
                            page: Scaffold(
                              appBar: PreferredSize(
                                preferredSize: Size.fromHeight(35),
                                child: AppBar(
                                  title: Text(
                                    "Ödeme Ayrıntıları",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  leading: GestureDetector(
                                    child: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  backgroundColor: kDarkBlue,
                                  centerTitle: true,
                                ),
                              ),
                              body: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFFFD4056)
                                                  .withOpacity(0.2),
                                              spreadRadius: 0,
                                              blurRadius: 6,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: Color(0xFFFDF4F5),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: Color(0xFFFD4056),
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16.0),
                                              child: Image.asset(
                                                "assets/images/warningBankAccount.png",
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              child: Text(
                                                "Lütfen sadece kendi adınıza kayıtlı hesap bilgilerini\ngiriniz. Bilgileri doğru girdiğinizden emin olunuz. ",
                                                style: TextStyle(
                                                    color: Color(0xFF2D3540),
                                                    fontSize: 10.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Ad & Soyad",
                                                  style: TextStyle(
                                                    color: kTextGrey,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                      child: Text(
                                                        "Ömer Aydın",
                                                        style: TextStyle(
                                                          color: kTextGrey,
                                                          fontSize: 14,
                                                        ),
                                                        textAlign:
                                                            TextAlign.end,
                                                        softWrap: true,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 18.0,
                                          ),
                                          Divider(
                                            height: 0,
                                            color: Color(0xFFB4B0B0),
                                            thickness: 1,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "T.C. Kimlik No",
                                                  style: TextStyle(
                                                    color: kTextGrey,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                      child: Text(
                                                        "11111111111",
                                                        style: TextStyle(
                                                          color: kTextGrey,
                                                          fontSize: 14,
                                                        ),
                                                        textAlign:
                                                            TextAlign.end,
                                                        softWrap: true,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 18.0,
                                          ),
                                          Divider(
                                            height: 0,
                                            color: Color(0xFFB4B0B0),
                                            thickness: 1,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Cep Telefonu",
                                                  style: TextStyle(
                                                    color: kTextGrey,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                      child: Text(
                                                        snapshot.data!.data()![
                                                            "phoneNumber"],
                                                        style: TextStyle(
                                                          color: kTextGrey,
                                                          fontSize: 14,
                                                        ),
                                                        textAlign:
                                                            TextAlign.end,
                                                        softWrap: true,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 18.0,
                                          ),
                                          Divider(
                                            height: 0,
                                            color: Color(0xFFB4B0B0),
                                            thickness: 1,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "IBAN",
                                                  style: TextStyle(
                                                    color: kTextGrey,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    TextEditingController
                                                        _ibanController =
                                                        TextEditingController();
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            content: TextField(
                                                              controller:
                                                                  _ibanController,
                                                              autofocus: true,
                                                              maxLength: 26,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    "IBAN",
                                                                border:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color:
                                                                        kButtonBlue,
                                                                  ),
                                                                ),
                                                                enabledBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color:
                                                                        kButtonBlue,
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    UnderlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color:
                                                                        kButtonBlue,
                                                                  ),
                                                                ),
                                                              ),
                                                              cursorColor:
                                                                  kButtonBlue,
                                                            ),
                                                            actions: [
                                                              GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  await _firestore
                                                                      .collection(
                                                                          "Users")
                                                                      .doc(_auth
                                                                          .currentUser!
                                                                          .uid)
                                                                      .update({
                                                                    "iban":
                                                                        _ibanController
                                                                            .text,
                                                                  }).whenComplete(
                                                                          () {
                                                                    Navigator.pushAndRemoveUntil(
                                                                        context,
                                                                        FadeRoute(
                                                                          page:
                                                                              BankInfoPage(),
                                                                        ),
                                                                        (route) => false);
                                                                  });
                                                                },
                                                                child: Text(
                                                                  "TAMAM",
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        kButtonBlue,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        FontAwesomeIcons
                                                            .solidEdit,
                                                        color: kDarkBlue,
                                                        size: 14.0,
                                                      ),
                                                      SizedBox(
                                                        width: 4.0,
                                                      ),
                                                      Text(
                                                        "Ekleyin",
                                                        style: TextStyle(
                                                          color: kDarkBlue,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 18.0,
                                          ),
                                          Divider(
                                            height: 0,
                                            color: Color(0xFFB4B0B0),
                                            thickness: 1,
                                          ),
                                          SizedBox(
                                            height: 18.0,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Adres Bilgisi",
                                              style: TextStyle(
                                                color: kTextGrey,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.55,
                                                  child: Text(
                                                    "address",
                                                    style: TextStyle(
                                                      color: kTextGrey,
                                                      fontSize: 14,
                                                    ),
                                                    textAlign: TextAlign.end,
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'HESAP BİLGİLERİNİZİ GİRİN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.10,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFD4056).withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 6,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Color(0xFFFDF4F5),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          border: Border.all(
                            color: Color(0xFFFD4056),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Image.asset(
                                "assets/images/warningBankAccount.png",
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                "Lütfen sadece kendi adınıza kayıtlı hesap bilgilerini\ngiriniz. Bilgileri doğru girdiğinizden emin olunuz. ",
                                style: TextStyle(
                                    color: Color(0xFF2D3540), fontSize: 10.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ad & Soyad",
                                  style: TextStyle(
                                    color: kTextGrey,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        "Caner Şanlı",
                                        style: TextStyle(
                                          color: kTextGrey,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.end,
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                          Divider(
                            height: 0,
                            color: Color(0xFFB4B0B0),
                            thickness: 1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "T.C. Kimlik No",
                                  style: TextStyle(
                                    color: kTextGrey,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        "11111111",
                                        style: TextStyle(
                                          color: kTextGrey,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.end,
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                          Divider(
                            height: 0,
                            color: Color(0xFFB4B0B0),
                            thickness: 1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Cep Telefonu",
                                  style: TextStyle(
                                    color: kTextGrey,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        snapshot.data!.data()!["phoneNumber"],
                                        style: TextStyle(
                                          color: kTextGrey,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.end,
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                          Divider(
                            height: 0,
                            color: Color(0xFFB4B0B0),
                            thickness: 1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "IBAN",
                                  style: TextStyle(
                                    color: kTextGrey,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Text(
                                        snapshot.data!.data()!["iban"],
                                        style: TextStyle(
                                          color: kDarkBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.end,
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                          Divider(
                            height: 0,
                            color: Color(0xFFB4B0B0),
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Adres Bilgisi",
                              style: TextStyle(
                                color: kTextGrey,
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    "address",
                                    style: TextStyle(
                                      color: kTextGrey,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.end,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 45),
                      child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(14),
                          shadowColor: MaterialStateProperty.all(
                              kButtonBlue.withOpacity(0.5)),
                          backgroundColor:
                              MaterialStateProperty.all(kButtonBlue),
                        ),
                        onPressed: () {
                          TextEditingController _ibanController =
                              TextEditingController();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: TextField(
                                    controller: _ibanController,
                                    autofocus: true,
                                    maxLength: 26,
                                    decoration: InputDecoration(
                                      hintText: "IBAN",
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: kButtonBlue,
                                        ),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: kButtonBlue,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: kButtonBlue,
                                        ),
                                      ),
                                    ),
                                    cursorColor: kButtonBlue,
                                  ),
                                  actions: [
                                    GestureDetector(
                                      onTap: () async {
                                        await _firestore
                                            .collection("Users")
                                            .doc(_auth.currentUser!.uid)
                                            .update({
                                          "iban": _ibanController.text,
                                        }).whenComplete(() {
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Text(
                                        "TAMAM",
                                        style: TextStyle(
                                          color: kButtonBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Text(
                          'DÜZENLE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
      ],
    );
  }
}
