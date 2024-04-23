import 'package:flutter/material.dart';
import 'package:i18n/app/models/product.dart';
import 'package:i18n/generated/translations.g.dart';
import 'package:intl/intl.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _show(context),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    child: Chip(
                      label: Text(
                        // Clase para dar formato a cifras dado una region
                        // # -> representa las cifras a imprimir
                        NumberFormat('###.#').format(product.rate),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(product.name),
            Text(
              NumberFormat.currency().format(product.price),
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              // Clase para dar formato a las fechas y tiempo
              DateFormat.yMEd().format(product.releaseDate),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _show(BuildContext context) {
    //final texts = AppLocalizations.of(context)!;
    final texts = Translations.of(context);
    return showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  texts.summary,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                texts.productName(name: product.name),
              ),
              Text(
                texts.price(
                  price: NumberFormat('###,###.##').format(product.price),
                ),
              ),
              Text(
                texts.releaseDate(
                  date: DateFormat.MMMEd().format(product.releaseDate),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    texts.payNow(
                      total: NumberFormat.currency().format(product.price),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
