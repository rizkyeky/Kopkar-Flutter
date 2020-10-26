part of 'page.dart';

class MainPage extends StatelessWidget {
  
  final Page homePage = HomePage();
  final Page pinjamanPage = PinjamanPage();
  final Page simpananPage = SimpananPage();
  final Page historyPage = HistoryPage();
  final Page profilePage = ProfilePage();

  final List<Widget> pages = [];

  final ValueNotifier<int> setTab = ValueNotifier(0);

  MainPage({
    Key key,
  }) : super(key: key) {
    pages.addAll([
      homePage, 
      pinjamanPage, 
      simpananPage, 
      historyPage, 
      profilePage
    ]);
  }
  
  @override
  Widget build(BuildContext context) {
    int prevTab = setTab.value;
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: setTab, 
        builder: (context, value, _) => PageTransitionSwitcher(
          reverse: value > prevTab,
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) => 
            SharedAxisTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            ),
          child: pages[value]
        )
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: setTab,
        builder: (context, value, child) => BottomNavigationBar(
          currentIndex: value,
          showUnselectedLabels: true,
          selectedItemColor: primaryColor,
          unselectedItemColor: iconColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home', 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: 'Pinjaman',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'Simpanan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_edu_outlined), label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Akun',
            ),
          ],
          onTap: (index) {
            if (setTab.value != index) {
              prevTab = setTab.value;
              setTab.value = index;
            }
          },
        ),
      ),
    );
  }

}