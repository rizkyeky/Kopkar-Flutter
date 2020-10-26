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
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.12)),
              borderRadius: BorderRadius.circular(24)
            ),
            child: SizedBox(
              height: 72,
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
          )
        ],
      ),
    );
  }
}