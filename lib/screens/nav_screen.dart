import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_m_w/data/data.dart';
import 'package:responsive_m_w/screens/screens.dart';
import 'package:responsive_m_w/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                child: CustomAppBar(currentUser: currentUser, icons: _icons, selectedIndex: _selectedIndex, onTap: (index) => setState(() => _selectedIndex = index )),
                preferredSize: Size(screenSize.width, 100))
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                color: Colors.white,
                child: CustomTabBar(
                    icons: _icons,
                    selectedIndex: _selectedIndex,
                    onTap: (index) => setState(() => _selectedIndex = index)),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
