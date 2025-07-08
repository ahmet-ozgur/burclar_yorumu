import 'package:burclar_yorumu/data/strings.dart';
import 'package:burclar_yorumu/model/burc.dart';
import 'package:burclar_yorumu/widgets/burc_item.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatefulWidget {
  const BurcListesi({super.key});

  @override
  State<BurcListesi> createState() => _BurcListesiState();
}

class _BurcListesiState extends State<BurcListesi> {
  late final List<Burc> tumBurclar;
  @override
  void initState() {
    super.initState();
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
      "Ad: ${tumBurclar[0].burcAdi}\nTarih: ${tumBurclar[0].burcTarih}\n${tumBurclar[0].burcKucukResim}\n${tumBurclar[0].burcBuyukResim}",
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Listesi"),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: tumBurclar.length,
          itemBuilder: (context, index) {
            return BurcItem(gelenBurc: tumBurclar[index]);
          },
        ),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      Burc eklenecekBurc = Burc(
        burcAdi: Strings.BURC_ADLARI[i],
        burcTarih: Strings.BURC_TARIHLERI[i],
        burcDetay: Strings.BURC_GENEL_OZELLIKLERI[i],
        burcKucukResim:
            ("images/${Strings.BURC_ADLARI[i]}${i + 1}.png")
                .toLowerCase(),
        burcBuyukResim:
            ("images/${Strings.BURC_ADLARI[i]}_buyuk${i + 1}.png")
                .toLowerCase(),
      );
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}

class deneme extends StatelessWidget {
  const deneme({
    super.key,
    required this.tumBurclar,
    required this.index,
  });

  final List<Burc> tumBurclar;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.pink, width: 5),
        image: DecorationImage(
          image: AssetImage(tumBurclar[index].burcBuyukResim),
          fit: BoxFit.fill,
          opacity: 0.25,
        ),
      ),
      child: ListTile(
        leading: Image.asset(tumBurclar[index].burcKucukResim),
        title: Text(
          tumBurclar[index].burcAdi,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          tumBurclar[index].burcDetay,
          style: TextStyle(fontSize: 12),
        ),
        dense: true,
      ),
    );
  }
}
