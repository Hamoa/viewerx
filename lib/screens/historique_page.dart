import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:viewerx/screens/carte_scanner_page.dart';

class HistoriquePage extends StatefulWidget {
  const HistoriquePage({super.key});

  @override
  State<HistoriquePage> createState() => _HistoriquePageState();
}

class _HistoriquePageState extends State<HistoriquePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Historique',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFFEF9F4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              icon: const Icon(Icons.tune, color: Colors.brown),
              onPressed: () =>
                  Navigator.of(context, rootNavigator: true).pushReplacement(
                PageRouteBuilder(
                    pageBuilder: (context, animation, sec) =>
                        CarteScannerPage(),
                    transitionDuration: const Duration(milliseconds: 0),
                    reverseTransitionDuration: const Duration(milliseconds: 0)),
              ),
              // () => Navigator.of(context, rootNavigator: true)
              //     .pushReplacement(MaterialPageRoute(
              //         builder: (_) => const CarteScannerPage())),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _balanceCard(
                              '12,750 FCFA', 'Recharge', Colors.green, true),
                          _balanceCard('12,750 FCFA', 'Retrait',
                              Colors.redAccent, false),
                          _balanceCard(
                              '12,750 FCFA', 'Recharge', Colors.green, true),
                          _balanceCard('12,750 FCFA', 'Retrait',
                              Colors.redAccent, false),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Historique des soldes en FCFA',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          height: 200,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFEF9F4),
                              borderRadius: BorderRadius.circular(12)),
                          child: LineChart(LineChartData(
                            borderData: FlBorderData(
                              show: false,
                            ),
                            gridData: const FlGridData(
                                show: true, drawVerticalLine: false),
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 1,
                                  getTitlesWidget: (value, meta) {
                                    const months = [
                                      'Jul',
                                      'Aug',
                                      'Sep',
                                      'Oct',
                                      'Nov',
                                      'Dec',
                                      'Jan'
                                    ];
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        months[value.toInt() % months.length],
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 200,
                                  getTitlesWidget: (value, meta) {
                                    return Text(
                                      '${value.toInt()}',
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black54),
                                    );
                                  },
                                ),
                              ),
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                            ),
                            minY: 0,
                            maxY: 800,
                            lineBarsData: [
                              LineChartBarData(
                                isCurved: true,
                                color: Colors.orange,
                                barWidth: 3,
                                isStrokeCapRound: true,
                                belowBarData: BarAreaData(
                                  show: true,
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.orange.withOpacity(0.3),
                                      Colors.orange.withOpacity(0.05),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                dotData: const FlDotData(show: false),
                                spots: const [
                                  FlSpot(0, 200),
                                  FlSpot(1, 300),
                                  FlSpot(2, 450),
                                  FlSpot(3, 700),
                                  FlSpot(4, 500),
                                  FlSpot(5, 650),
                                  FlSpot(6, 600),
                                ],
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Historique de transactions',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Voir tout',
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  _transactionTile('Eneo', 'De Bae', '-5000 / -50 Fcfa',
                      'il y a 1h de temps', Colors.brown, true),
                  _transactionTile('Bae', 'De Afriland Visa', '+5000 / 0 Fcfa',
                      '26 Juin 2024', Colors.brown, false),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _balanceCard(
      String amount, String label, Color color, bool isRetrait) {
    return Container(
      width: 190,
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9F4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //backgroundColor: Colors.orange.shade50,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: isRetrait
                    ? const Color(0xFFdbe3cd)
                    : const Color(0xFFefd8cc),
                borderRadius: BorderRadius.circular(16)),
            child: Icon(isRetrait ? Icons.arrow_upward : Icons.arrow_downward,
                color: isRetrait ? Colors.green : Colors.red),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                amount,
                style: TextStyle(
                    color: color, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(label, style: const TextStyle(color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _transactionTile(String title, String subtitle, String amount,
      String time, Color color, bool isOut) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        //backgroundColor: Colors.orange.shade50,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: const Color(0xFFFEF9F4),
            borderRadius: BorderRadius.circular(16)),
        child: Icon(isOut ? Icons.arrow_upward : Icons.arrow_downward,
            color: color),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('$subtitle\n$time', style: const TextStyle(height: 1.5)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(amount,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.w700, fontSize: 16)),
          Text(isOut ? 'Échec' : 'Succès',
              style: const TextStyle(fontSize: 12, color: Colors.green))
        ],
      ),
    );
  }
}
