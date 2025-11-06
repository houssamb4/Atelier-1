import 'package:flutter/material.dart';

class AddProduit extends StatefulWidget {
  const AddProduit({super.key});

  @override
  State<AddProduit> createState() => _AddProduitState();
}

class _AddProduitState extends State<AddProduit> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Ajouter un produit"),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          hintText: "Entrez le nom du produit",
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Annuler"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, _controller.text);
          },
          child: const Text("Ajouter"),
        ),
      ],
    );
  }
}
