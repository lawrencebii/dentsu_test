import 'package:flutter/material.dart';
import 'package:prime_template/features/home/views/home.dart';
import 'package:prime_template/features/leads/views/leads_page.dart';
import 'package:prime_template/features/navigation/components/custom_appbar.dart';
import 'package:prime_template/features/profile/views/profile_page.dart';
import 'package:prime_template/features/quotes/views/quotes_page.dart';
import 'package:prime_template/main.dart';
import 'package:provider/provider.dart';

import '../components/bottomNar.dart';
import '../navigation_provider.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<NavigationProvider>().getInitialRoute();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Stack(
        children: [
          SafeArea(
            child: Scaffold(
              appBar: CustomAppBar(),
              body: Consumer<NavigationProvider>(
                builder: (context, provider, child) {
                  return IndexedStack(
                    index: provider.selectedIndex,
                    children: [
                      const HomeScreen(),
                      LeadsPage(),
                      QuotesPage(),
                      ProfilePage(),
                    ],
                  );
                },
              ),
              bottomNavigationBar: const BottomNavBar(),
            ),
          ),
          // const AppProgressIndicator(),
        ],
      ),
    );
  }
}
