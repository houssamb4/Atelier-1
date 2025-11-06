import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProduitBox extends StatelessWidget {
  final String nomProduit;
  final bool selProduit;
  final ValueChanged<bool?> onChanged;
  final VoidCallback delProduit;

  const ProduitBox({
    super.key,
    required this.nomProduit,
    required this.selProduit,
    required this.onChanged,
    required this.delProduit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => delProduit(),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Supprimer',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Checkbox(value: selProduit, onChanged: onChanged),
              Expanded(
                child: Text(
                  nomProduit,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
