import 'package:flutter/material.dart';
import 'package:student_app/repository/ogretmenler_repository.dart';

class OgretmenlerSayfasi extends StatefulWidget {
  final OgrtmenlerRepositorry ogretmenlerRepositorry;
  const OgretmenlerSayfasi(this.ogretmenlerRepositorry, {super.key});

  @override
  State<OgretmenlerSayfasi> createState() => _OgretmenlerSayfasiState();
}

class _OgretmenlerSayfasiState extends State<OgretmenlerSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ogretmenler')),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 32.0),
                child: Text(
                    '${widget.ogretmenlerRepositorry.ogretmenler.length} öğretmen'),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => OgretmenlerListe(
                  widget.ogretmenlerRepositorry.ogretmenler[index],widget.ogretmenlerRepositorry),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: widget.ogretmenlerRepositorry.ogretmenler.length,
            ),
          ),
        ],
      ),
    );
  }
}

class OgretmenlerListe extends StatefulWidget {
  final Ogretmen ogretmen;
  final OgrtmenlerRepositorry ogretmenlerRepositorry;
  const OgretmenlerListe(
    this.ogretmen,this.ogretmenlerRepositorry , {
    super.key,
  });

  @override
  State<OgretmenlerListe> createState() => _OgretmenlerListeState();
}

class _OgretmenlerListeState extends State<OgretmenlerListe> {
  @override
  Widget build(BuildContext context) {
    bool seviyorMuyum = widget.ogretmenlerRepositorry.seviyorMuyum(widget.ogretmen);
    return ListTile(
      title: Text(widget.ogretmen.ad + ' ' + widget.ogretmen.soyad),
      leading:  IntrinsicWidth(
          child: Center(
              child:
                  Text(widget.ogretmen.cinsiyet == 'Kadın' ? '👩' : '👦'))), //
      trailing: IconButton(
          onPressed: () {
            setState(() {
              widget.ogretmenlerRepositorry.sev(widget.ogretmen,!seviyorMuyum);
            });
          },
          icon: Icon(seviyorMuyum
              ? Icons.favorite
              : Icons.favorite_border)),
    );
  }
}
