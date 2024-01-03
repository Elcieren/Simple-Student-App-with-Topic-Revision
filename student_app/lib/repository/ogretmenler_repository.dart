class OgrtmenlerRepositorry {
  List<Ogretmen> ogretmenler = [
    Ogretmen('Ali', 'Sönmez', 21, 'Erkek'),
    Ogretmen('Eren', 'Soydan', 22, 'Erkek'),
    Ogretmen('Burak', 'Gümüş', 24, 'Erkek'),
  ];

  final Set<Ogretmen> sevdiklerim = {};
  void sev(Ogretmen ogretmen, bool seviyorMuyum) {
    if (seviyorMuyum) {
      sevdiklerim.add(ogretmen);
    } else {
      sevdiklerim.remove(ogretmen);
    }
  }

  bool seviyorMuyum(Ogretmen ogretmen) {
    return sevdiklerim.contains(ogretmen);
  }
}

class Ogretmen {
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogretmen(this.ad, this.soyad, this.yas, this.cinsiyet);
}
