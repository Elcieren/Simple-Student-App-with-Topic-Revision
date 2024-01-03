import 'package:flutter/material.dart';
import 'package:student_app/pages/mesajlar_sayfasi.dart';
import 'package:student_app/pages/ogrenciler_sayfasi.dart';
import 'package:student_app/pages/ogretmenler_sayfasi.dart';
import 'package:student_app/repository/mesajlar_repository.dart';
import 'package:student_app/repository/ogrenciler_repository.dart';
import 'package:student_app/repository/ogretmenler_repository.dart';

void main() {
  runApp(const OgrenciApp());
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ogrenci Uygulamasi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnaSayfa(title: 'Ögrenci Ana Sayfa'),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key, required this.title});
  final String title;

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  MesajlarRpository mesajlarRepository = MesajlarRpository();
  OgrencilerRepository ogrencilerRepository = OgrencilerRepository();
  OgrtmenlerRepositorry ogretmenlerRepositorry = OgrtmenlerRepositorry();
  String selectedPage = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Öğrenci Adi ',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Öğrenciler'),
            onTap: () {
              setState(() {
                selectedPage = 'Öğrenciler';
                _OgrencilereGit(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Öğretmenler'),
            onTap: () {
              setState(() {
                selectedPage = 'Öğretmenler';
                _OgretmenlereGit(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Mesajlar'),
            onTap: () {
              setState(() {
                selectedPage = 'Mesajlar';
                _mesajlaraGit(context);
              });
            },
          ),
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  _mesajlaraGit(context);
                },
                child:
                    Text('${mesajlarRepository.yeniMesajSayisi} Yeni Mesaj')),
            TextButton(
                onPressed: () {
                  _OgrencilereGit(context);
                },
                child:
                    Text('${ogrencilerRepository.ogrenciler.length} Ogrenci')),
            TextButton(
                onPressed: () {
                  _OgretmenlereGit(context);
                },
                child: Text(
                    '${ogretmenlerRepositorry.ogretmenler.length} Ogretmen')),
          ],
        ),
      ),
    );
  }

  void _OgrencilereGit(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => OgrencilerSayfasi(ogrencilerRepository),
    ));
  }

  void _OgretmenlereGit(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => OgretmenlerSayfasi(ogretmenlerRepositorry),
    ));
  }

  Future<void> _mesajlaraGit(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MesajlarSayfasi(mesajlarRepository),
    ));
    setState(() {});
  }
}
