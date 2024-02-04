import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Whatsapp"),
          actions: [
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => [
                      PopupMenuItem(value: '1', child: Text("New Group")),
                      PopupMenuItem(value: '2', child: Text('Settings')),
                      PopupMenuItem(child: Text('Log Out'))
                    ]),
            SizedBox(
              width: 10,
            )
          ],
          bottom: TabBar(tabs: [
            Tab(
              child: Icon(Icons.camera_alt),
            ),
            Tab(child: Text('CHAT')),
            Tab(child: Text('STATUS')),
            Tab(child: Text('CALLS'))
          ]),
        ),
        body: TabBarView(children: [
          Text('Camera'),
          //chats
          ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=400')),
                  title: Text('Hizar'),
                  subtitle: Text('Where the Hell You are?'),
                  trailing: Text('9:30 PM'),
                );
              }),
          //Status
          ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.green, width: 3)),
                              child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('images/pic.jpg')),
                            ),
                            title: Text('My Status'),
                            subtitle: Text('Just Now '),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Text('Recent Updates'),
                        ]),
                  );
                } else {
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 3)),
                      child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=400')),
                    ),
                    title: Text('Hizar'),
                    subtitle: Text('35 minutes ago  '),
                  );
                }
              }),
          //Calls
          ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Hizar'),
                  subtitle: Text(index / 2 == 0
                      ? 'You missed audio call'
                      : 'You Missed Vedio Call'),
                  trailing:
                      Icon(index / 2 == 0 ? Icons.phone : Icons.video_call),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=400')),
                );
              }),
        ]),
      ),
    );
  }
}
