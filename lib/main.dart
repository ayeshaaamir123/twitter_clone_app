import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Birdy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BirdApp(),
    );
  }
}

class BirdApp extends StatefulWidget {
  const BirdApp({Key? key}) : super(key: key);

  @override
  _BirdAppState createState() => _BirdAppState();
}

class _BirdAppState extends State<BirdApp> {
  final favourites = [];
  final tweets = [
    {
      'name': 'Ayesha Aamir',
      'username': '@ayesha12',
      'tweet':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam interdum elementum fringilla. Vivamus feugiat varius egestas. Donec ex felis, dapibus id rhoncus a, blandit scelerisque elit. ',
      'image': 'assets/avatar.png'
    },
    {
      'name': 'Michael Scott',
      'username': '@scottie23',
      'tweet':
          'Suspendisse congue id lectus eu viverra. Vivamus sollicitudin eu leo ac commodo. Vivamus turpis arcu, semper vel tristique id, euismod a sem. Mauris ac malesuada risus.',
      'image': 'avatar2.jpg'
    },
    {
      'name': 'Ashley John',
      'username': '@farmergirl',
      'tweet': ' Duis consequat, ipsum in accumsan pellentesque.',
      'image': 'avatar3.jpg'
    },
    {
      'name': 'Zayn Malik',
      'username': '@malikzayn',
      'tweet':
          'Nullam nec augue fringilla, volutpat orci et, luctus tortor. Quisque dictum felis in justo malesuada pellentesque. Maecenas velit est, hendrerit iaculis.',
      'image': 'avatar4.jpg'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add_circle_rounded),
          label: Text('')),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                foregroundImage: AssetImage('assets/avatar.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Home',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
            )
          ],
        ),
        actions: [
          TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.notifications),
              label: const Text(''))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: tweets.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onSecondaryTap: () {
                      favourites.add({
                        'name': tweets[index]['name'].toString(),
                        'username': tweets[index]['username'].toString(),
                        'tweet': tweets[index]['tweet'].toString(),
                        'image': tweets[index]['image'].toString()
                      });
                    },
                    child: TweetTemplate(
                        name: tweets[index]['name'].toString(),
                        username: tweets[index]['username'].toString(),
                        tweet: tweets[index]['tweet'].toString(),
                        image: tweets[index]['image'].toString()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class TweetTemplate extends StatelessWidget {
  const TweetTemplate({
    Key? key,
    required this.name,
    required this.username,
    required this.tweet,
    required this.image,
  }) : super(key: key);
  final String name;
  final String username;
  final String tweet;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    foregroundImage: AssetImage(image),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(name,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    username,
                    style: TextStyle(color: Colors.black54),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                tweet,
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                'https://picsum.photos/id/1025/400/300',
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: ImageIcon(AssetImage('assets/heart.png')),
                    label: Text('')),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}
