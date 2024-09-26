import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitchedNotifikasi = false;
  bool isSwitchedSuara = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Color(0xFF212325),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
      ),
    );

    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pengaturan',
            style: GoogleFonts.raleway(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pengaturan Umum',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white38,
                ),
              ),
              SizedBox(height: 16.0),
              ListTile(
                title: Text(
                  'Notifikasi',
                  style: GoogleFonts.oswald(color: Colors.white38),
                ),
                trailing: Switch(
                  value: isSwitchedNotifikasi,
                  onChanged: (value) {
                    setState(() {
                      isSwitchedNotifikasi = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Suara',
                  style: GoogleFonts.oswald(color: Colors.white38),
                ),
                trailing: Switch(
                  value: isSwitchedSuara,
                  onChanged: (value) {
                    setState(() {
                      isSwitchedSuara = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 32.0),
              Text(
                'Akun',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white38,
                ),
              ),
              SizedBox(height: 16.0),
              ListTile(
                title: Text(
                  'Logout',
                  style: GoogleFonts.oswald(color: Colors.white38),
                ),
                onTap: () {
                  // Tambahkan logika untuk logout di sini
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
