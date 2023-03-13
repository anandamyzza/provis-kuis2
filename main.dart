import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int idx = 2;

  static List<Center> halaman = [
    Center(
      child: Text('Home Page'),
    ),
    Center(
      child: Text('Programme Page'),
    ),
    Center(
      child: TabTab(),
    ),
  ];

  void onItemTap(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello App',
        theme: ThemeData(
            tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
        )),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
                leading: FlutterLogo(),
                backgroundColor: Colors.blueGrey,
                title: Text('Quiz Flutter'),
                actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
            body: halaman[idx],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: idx,
                selectedItemColor: Colors.red,
                onTap: onItemTap,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), tooltip: 'Home', label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.book),
                      tooltip: 'Programme',
                      label: 'Programme'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      tooltip: 'My Learning',
                      label: 'My Learning'),
                ]),
          ),
        ));
  }
}

class TabTab extends StatelessWidget {
  const TabTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ], color: Colors.white, borderRadius: BorderRadius.circular(3)),
                height: 25,
                // padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: TabBar(
                    indicatorColor: Colors.red,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: "Following"),
                      Tab(text: "Downloads"),
                      Tab(text: "History"),
                    ]),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Pictures()),
                  Center(child: Daftarvideo()),
                  Center(
                      child: Text(
                          "Kelompok 9 :\nAnanda Myzza\nDicki Fathurohman")),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class Daftarvideo extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      'name': '6 Minute Grammer',
      'description': 'Future perfect continous',
    },
    {
      'name': '6 Minute Vocabulary',
      'description': 'Academic Vocabulary',
    },
    {
      'name': '6 Minute Vocabulary',
      'description': 'Synonyms',
    },
    {
      'name': '6 Minute English',
      'description': 'The future of food',
    },
    {
      'name': '6 Minute English',
      'description': 'Cryptocurrency',
    },
    {
      'name': '6 Minute Vocabulary',
      'description': 'Conjunction',
    },
    {
      'name': '6 Minute Vocabulary',
      'description': 'Daily Vocab',
    },
    {
      'name': 'Learn Vocab With Fun',
      'description': 'Funny to Watch',
    },
    {
      'name': 'Fix your Grammar',
      'description': 'Teach your Grammar',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Center(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text('${data[index]['name']}'),
                          ));
                        },
                        leading: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                        trailing: const Icon(Icons.more_vert),
                        title: Text(data[index]['name']!),
                        subtitle: Text(data[index]['description']!),
                        tileColor: Colors.white70));
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Pictures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Center(
            child: GridView(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                Column(
                  children: [
                    Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      height: 150,
                    ),
                    const Text("Ananda Myzza"),
                  ],
                ),
                Column(
                  children: [
                    Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      height: 150,
                    ),
                    const Text("Dicki Fathurohman"),
                  ],
                ),
                Column(
                  children: [
                    Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      height: 150,
                    ),
                    const Text("Myzza Marhelio"),
                  ],
                ),
                Column(
                  children: [
                    Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      height: 150,
                    ),
                    const Text("Gatsby Del Rey"),
                  ],
                ),
                Column(
                  children: [
                    Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      height: 150,
                    ),
                    const Text("Dicki Fathurohman"),
                  ],
                ),
                Column(
                  children: [
                    Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      height: 150,
                    ),
                    const Text("Dickif"),
                  ],
                ),
                Column(
                  children: [
                    Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      height: 150,
                    ),
                    const Text("Myzza"),
                  ],
                ),
                Column(
                  children: [
                    Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      height: 150,
                    ),
                    const Text("dickifathurohman"),
                  ],
                ),
                Column(
                  children: [
                    Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      height: 150,
                    ),
                    const Text("Gambar 1"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 9'),
            content: const Text(
                'Ananda Myzza Marhelio (anandamyzza@upi.edu) ; Dicki Fathurohman (dickifathurohman@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
