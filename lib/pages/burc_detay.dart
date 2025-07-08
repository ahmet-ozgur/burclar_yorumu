import 'package:burclar_yorumu/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BurcDetay extends StatelessWidget {
  final Burc secilenBurc;
  const BurcDetay({super.key,required this.secilenBurc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("${secilenBurc.burcAdi} Burcu ve Özellikleri"),
              background: Image.asset(secilenBurc.burcBuyukResim,fit: BoxFit.cover,),

            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(secilenBurc.burcDetay,style: Theme.of(context).textTheme.headlineSmall,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
