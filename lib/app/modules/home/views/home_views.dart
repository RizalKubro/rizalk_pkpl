import 'package:FLUTTERPROJECT/app/modules/home/controllers/favorite.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/bottom_navigator_bar.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/items_widgets_views.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/login.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/setting_views.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
    final FavoriteController favoriteController = Get.put(FavoriteController());
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedTabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    //onterminate
    FirebaseMessaging.instance.getInitialMessage().then((message){
      if (message != null){
        print(message.notification!.title);
      }
    });
    
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      
    });
    //on foreground
    FirebaseMessaging.onMessage.listen((event){
      if(event.notification != null){
        print(event.notification!.title);
      }
    });
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

void _onSortButtonPressed() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Menu", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF212325),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                "Akun Saya",
                style: GoogleFonts.tiltNeon(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
                _onAccountButtonPressed();
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Pengaturan",
                style: GoogleFonts.tiltNeon(color: Colors.white, fontSize: 20),
              ),
              onTap: () => Get.to(SettingsScreen()),
            ),
            // Ini adalah bagian yang harus Anda tambahkan
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Tutup",
              style: GoogleFonts.tiltNeon(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      );
    },
  );
}




void _onAccountButtonPressed() {
    // Periksa status login
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Jika sudah login, pindah ke halaman profile
      Get.toNamed('/Profile');
    } else {
      // Jika belum login, tampilkan dialog login
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Akun Saya", style: TextStyle(color: Colors.white)),
            backgroundColor: Color(0xFF212325),
            children: [
              SimpleDialogOption(
                onPressed: () => Get.to(LoginScreen()),
                child: Text(
                  "Login",
                  style: GoogleFonts.tiltNeon(color: Colors.white, fontSize: 20),
                ),
              ),
              SimpleDialogOption(
                onPressed: () => Get.to(SignupScreen()),
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.tiltNeon(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          );
        },
      );
    }
}





  void _onNotificationButtonPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Notifikasi", style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF212325),
          content: Text(
            "Tidak ada Notifikasi",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Tutup",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _changeTab(int newIndex) {
  setState(() {
    selectedTabIndex = newIndex;
    _tabController.animateTo(newIndex);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:
                          _onSortButtonPressed,
                      child: Icon(
                        Icons.menu,
                        color: Colors.white24.withOpacity(0.5),
                        size: 35,
                      ),
                    ),
                    GestureDetector(
                      onTap: _onNotificationButtonPressed,
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.white.withOpacity(0.5),
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 90,
                        height: 39,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 50, 54, 56),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Temukan Kopi Kamu disini",
                            hintStyle: GoogleFonts.lato(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        // Tambahkan kode untuk meng-handle pemilihan menu
                        print("Anda memilih: $value");
                      },
                      icon: Icon(
                        Icons.filter_list,
                        color: Colors.white.withOpacity(0.5),
                        size: 35,
                        
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: "Kopi Dingin",
                          child: Text("Ice"),
                          onTap: (){
                            _changeTab(1);
                          },
                        ),
                        PopupMenuItem<String>(
                          value: "Kopi Hangat",
                          child: Text("Hot"),
                          onTap: (){
                            _changeTab(0);
                          },
                        ),
                        PopupMenuItem<String>(
                          value: "mocktail",
                          child: Text("Moctail"),
                          onTap: (){
                            _changeTab(2);
                          }, 
                        ),
                        PopupMenuItem<String>(
                          value: "Non Kopi",
                          child: Text("Non Kopi"),
                          onTap: (){
                            _changeTab(3);
                          },
                          
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Penawaran Hari Ini",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 10),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: [
                  Stack(
                    children: [
                      Image.asset(
                        'images/c2.png',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Hot Kopi',
                                  style: GoogleFonts.ubuntu(color: Colors.white,
                                    fontSize: 16,),
                                ),
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        'images/c3.png',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Es Jeruk Peras Murni',
                                  style: GoogleFonts.ubuntu(color: Colors.white,
                                    fontSize: 16,),
                                ),
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        'images/c4.png',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Es Kopi',
                                  style: GoogleFonts.ubuntu(color: Colors.white,
                                    fontSize: 16,),
                                ),
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        'images/c5.png',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Macha Ice',
                                  style: GoogleFonts.ubuntu(color: Colors.white,
                                    fontSize: 16,),
                                ),
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Kategori",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Color(0xFFE57734),
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                isScrollable: true,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3,
                    color: Color(0xFFE57734),
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 16),
                ),
                labelStyle: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                labelPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(
                    text: "Kopi Hangat",
                  ),
                  Tab(
                    text: "Kopi Dingin",
                  ),
                  Tab(
                    text: "Mocktail",
                  ),
                  Tab(
                    text: "Non Kopi",
                  ),
                ],
              ),
              Center(
                child: ItemsWidget(activeTabIndex: _tabController.index),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}