import 'package:flutter/material.dart';
import 'produit_box.dart';
import 'add_produit.dart';

class ProduitsList extends StatefulWidget {
  const ProduitsList({super.key});

  @override
  State<ProduitsList> createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  List<Map<String, dynamic>> produits = [
    {"nom": "Produit A", "selected": false},
    {"nom": "Produit B", "selected": false},
    {"nom": "Produit C", "selected": false},
  ];

  void onChangedCheckbox(int index, bool? value) {
    setState(() {
      produits[index]["selected"] = value!;
    });
  }

  void delProduit(int index) {
    setState(() {
      produits.removeAt(index);
    });
  }

  void addProduit(String nomProduit) {
    setState(() {
      produits.add({"nom": nomProduit, "selected": false});
    });
  }

  void deleteSelected() {
    setState(() {
      produits.removeWhere((p) => p["selected"] == true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Produits"),
        actions: [
          IconButton(
            onPressed: deleteSelected,
            icon: const Icon(Icons.delete),
            tooltip: "Supprimer les produits sélectionnés",
          )
        ],
      ),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          return ProduitBox(
            nomProduit: produits[index]["nom"],
            selProduit: produits[index]["selected"],
            onChanged: (val) => onChangedCheckbox(index, val),
            delProduit: () => delProduit(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nouveauProduit = await showDialog<String>(
            context: context,
            builder: (context) => const AddProduit(),
          );
          if (nouveauProduit != null && nouveauProduit.isNotEmpty) {
            addProduit(nouveauProduit);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
