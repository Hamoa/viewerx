import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viewerx/widgets/dashline_widget.dart';

class ReceiptTicketPage extends StatelessWidget {
  const ReceiptTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[700],
        body: Center(
          child: Container(
            width: 320,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF9F4),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF7600),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  'Bae',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),

                const Text(
                  'Transféré le 02 Février 2025',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: RichText(
                      text: const TextSpan(
                          text: 'État des transactions: ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Payé',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600))
                          ]),
                    )),
                const SizedBox(height: 16),

                const DashedLine(),

                const SizedBox(height: 16),

                Container(
                  padding: const EdgeInsets.only(
                      bottom: 24, top: 12, left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF9F4),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mastercard',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('Débit •8490',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Résumé de paiement',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: const Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Montant'),
                                  Text('10.000 FCFA'),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Frais de transfert'),
                                  Text('100 FCFA'),
                                ],
                              ),
                              Divider(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('10.100 FCFA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepOrange,
                                        fontSize: 16,
                                      )),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // 🔘 Bouton Quitter
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFFFF7600),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Quitter'),
                  ),
                ),
                const SizedBox(height: 12),

                // 🧡 Bouton Transférer de nouveau
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFFF7600),
                      side: const BorderSide(color: Color(0xFFFF7600)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Transférer de nouveau'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
