part of 'page.dart';

class HomePage extends Page<HomeBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('KOPKAR'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 300,
              viewportFraction: 1,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => SizedBox(
              child: Image.asset('assets/img/Image${index+1}.png'),
            ), 
          ),
          Container(
            height: 72,
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.12)),
              borderRadius: BorderRadius.circular(24)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.apps, color: iconColor), 
                  onPressed: () {},),
                IconButton(
                  icon: Icon(Icons.smartphone, color: iconColor), 
                  onPressed: () {},),
                IconButton(
                  icon: Icon(Icons.signal_cellular_alt, color: iconColor), 
                  onPressed: () {},),
                IconButton(
                  icon: Icon(Icons.offline_bolt_outlined, color: iconColor), 
                  onPressed: () {},),
              ],
            ),
          ),
          const _ContentList(
            title: 'Rekomendasi',
          ),
          const SizedBox(height: 24,),
          const _ContentList(
            title: 'Terbaru',
          ),
          const SizedBox(height: 24,),
        ],
      ),
    );
  }
}

class _ContentList extends StatelessWidget {
  
  final String title; 

  const _ContentList({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            title: Text(title, style: appTheme.textTheme.headline6),
            trailing: Icon(
              Icons.arrow_forward,
              color: iconColor
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                color: primaryColor,
                width: 100,
              )
            ),
          ),
        ]
      ),
    );
  }
}