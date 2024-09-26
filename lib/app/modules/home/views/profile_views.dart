import 'dart:io';
import 'package:FLUTTERPROJECT/app/modules/home/controllers/image_picker.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/bottom_navigator_bar.dart';
import 'package:FLUTTERPROJECT/app/modules/home/views/webview.dart';
import 'package:FLUTTERPROJECT/app/provider/client_appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ImagePickerController controller = Get.put(ImagePickerController());
  String userEmail = "";
  String userName = "";

  @override
  void initState() {
  super.initState();
  // getUserDetails();
  }

//   void getUserDetails() async {
//   AuthAppwrite appwrite = Get.find<AuthAppwrite>();
//   if (appwrite.isLoggedIn) {
//     try {
//       // Fetch user details from Appwrite
//       final user = await appwrite.getUser(); // Adjust this based on your Appwrite implementation

//       // Extract the user's name
//       userName = user?['name'] ?? "";
//       userEmail = user?['email'] ?? "";
//     } catch (e) {
//       print("Error fetching user details: $e");
//     }
//   }
// }


  // Function to log out the user
  Future<void> logoutUser() async {
    try {
      await account.deleteSession(sessionId: 'current');
      print("User Logged out");
      // You may navigate to the login screen or perform other actions after logout
    } catch (e) {
      print("Logout failed: $e");
      // Handle the logout failure, if necessary
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF212325),
        title: Text('Profil Saya'),
      ),
      backgroundColor: Color(0xFF212325),
      body: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60,
                backgroundImage: controller.imagePath.isNotEmpty
                    ? FileImage(File(controller.imagePath.value))
                    : null,
              ),
            ),
            TextButton(
              onPressed: () {
                controller.getImage().then((imagePath) {
                  if (imagePath != null) {
                    // Call the method to set the image as a profile picture
                    controller.setProfileImage(imagePath);
                  }
                });
              },
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            Text(
              'Nama Profil: $userName', // Display the user's name
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              'Email: $userEmail', // Display the user's email
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: logoutUser, // Use the logoutUser function for logout
              child: Text('Logout'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                InkWell(
                  onTap: () => Get.to(WebView()),
                  child: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.purple,
                    size: 30,
                  ),
                ),
                SizedBox(width: 30),
                FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                  size: 30,
                ),
                SizedBox(width: 30),
                FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.lightBlue,
                  size: 30,
                ),
              ],
            )
          ],
        );
      }),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class AuthAppwrite {
  
}
