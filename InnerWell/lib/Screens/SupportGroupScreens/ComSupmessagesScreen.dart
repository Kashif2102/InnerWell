import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart'; // Import the intl package

import '../../FeedItems/FeedItems.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    globalFeedItems.addListener(_updateFeedItems);
  }

  void _updateFeedItems() {
    setState(() {});
  }

  @override
  void dispose() {
    globalFeedItems.removeListener(_updateFeedItems);
    super.dispose();
  }

  void _deleteFeedItem(int index) {
    List<FeedItem> updatedFeedItems = List.from(globalFeedItems.value);
    updatedFeedItems.removeAt(index);
    globalFeedItems.value = updatedFeedItems;
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<FeedItem>> feedItems = globalFeedItems;
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: feedItems.value.length,
      itemBuilder: (context, index) {
        final feedItem = feedItems.value[index];
        final formattedDate =
            DateFormat.yMMMd().add_jm().format(feedItem.dateTime!);

        return Card(
          color: Color(0xFF0D0D0D),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                SizedBox(height: 10.0),
                if (feedItem.message != null)
                  Text(
                    feedItem.message!,
                    style: TextStyle(fontSize: 18.0),
                  ),
                SizedBox(height: 10.0),
                if (feedItem.imagePath != null)
                  Container(
                    alignment: Alignment.bottomLeft,
                    width: double.infinity,
                    height: 200.0,
                    child: feedItem.isAsset
                        ? Image.asset(
                            feedItem.imagePath!,
                            fit: BoxFit.contain,
                          )
                        : Image.file(
                            File(feedItem.imagePath!),
                            fit: BoxFit.contain,
                          ),
                  ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite_outline_outlined),
                          onPressed: () => () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.mode_comment_outlined),
                          onPressed: () => () {},
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(color: Colors.grey),
              ],
            ),
          ),
        );
      },
    );
  }
}
