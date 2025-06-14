import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:viewerx/screens/historique_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 3);

  List<PersistentTabConfig> _buildScreens() {
    return [
      PersistentTabConfig(
        screen: Container(),
        item: ItemConfig(
          icon: const Icon(Icons.home),
          title: "Accueil",
          activeForegroundColor: Colors.brown,
          inactiveForegroundColor: Colors.grey,
          inactiveBackgroundColor: Colors.transparent,
        ),
      ),
      PersistentTabConfig(
        screen: Container(),
        item: ItemConfig(
          icon: const Icon(Icons.account_balance_wallet),
          title: "Portefeuille",
          activeForegroundColor: Colors.brown,
          inactiveForegroundColor: Colors.grey,
          inactiveBackgroundColor: Colors.transparent,
        ),
      ),
      PersistentTabConfig(
        screen: Container(),
        item: ItemConfig(
          icon: const Icon(FontAwesomeIcons.telegramPlane, color: Colors.white),
          title: "Historique",
          activeForegroundColor: const Color(0xFFe46826),
          inactiveForegroundColor: Colors.grey,
          inactiveBackgroundColor: Colors.transparent,
        ),
      ),
      PersistentTabConfig(
        screen: Container(
            padding: const EdgeInsets.only(top: 30.0),
            alignment: Alignment.center,
            child: const HistoriquePage()),
        item: ItemConfig(
          icon: const Icon(Icons.history),
          title: "Historique",
          activeForegroundColor: Colors.brown,
          inactiveForegroundColor: Colors.grey,
          inactiveBackgroundColor: Colors.transparent,
        ),
      ),
      PersistentTabConfig(
        screen: Container(),
        item: ItemConfig(
          icon: const Icon(Icons.person),
          title: "Compte",
          activeForegroundColor: Colors.brown,
          inactiveForegroundColor: Colors.grey,
          inactiveBackgroundColor: Colors.transparent,
        ),
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          bottomNavigationBar: PersistentTabView(
        controller: _controller,
        tabs: _buildScreens(),
        navBarBuilder: (navBarConfig) => Style15BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      )),
    );
  }
}
