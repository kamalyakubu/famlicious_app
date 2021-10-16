import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Timeline'),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              UniconsLine.plus_square,
              color: Theme.of(context).iconTheme.color,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Card(
            elevation: 0,
            color: Theme.of(context).cardColor,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1634205633494-37f1fe3af1a7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80'),
                    ),
                    title: Text(
                      'Serene Guy',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'A minute ago',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    trailing: IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.more_horiz,
                          color: Theme.of(context).iconTheme.color,
                        )),
                  ),
                  const Text('fnjkfjgjnjhgcrdrtdrtdesrdfdedsedtyugyug'),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        'https://images.unsplash.com/photo-1634205633494-37f1fe3af1a7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2070&q=80', fit: BoxFit.cover, width: MediaQuery.of(context).size.width,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children:  [
                          IconButton(
                            onPressed: null,
                            icon: Icon(UniconsLine.thumbs_up, color: Theme.of(context).iconTheme.color,),
                          ),
                          IconButton(
                            onPressed: null,
                            icon: Icon(UniconsLine.comment_lines, color: Theme.of(context).iconTheme.color,),
                          ),
                        ],
                      ),
                       IconButton(
                        onPressed: null,
                        icon: Icon(UniconsLine.telegram_alt, color: Theme.of(context).iconTheme.color,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
