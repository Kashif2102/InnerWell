import 'package:flutter/foundation.dart';

class FeedItem {
  final String? message;
  final String? imagePath;
  final DateTime? dateTime;
  final bool isAsset;

  FeedItem({this.message, this.imagePath, this.dateTime, this.isAsset = false});
}

void addFeedItem(FeedItem item) {
  globalFeedItems.value = [item, ...globalFeedItems.value];
}

ValueNotifier<List<FeedItem>> globalFeedItems = ValueNotifier([
  FeedItem(
    message:
        "Sometimes, all you need is to take a deep breath and give yourself a moment of peace. #Mindfulness",
    imagePath: 'assets/images/feed1.jpg',
    dateTime: DateTime(2023, 9, 9, 18, 30),
    isAsset: true, // Dummy date and time
  ),
  FeedItem(
    message:
        "Remember, it's completely okay to have bad days. You don't have to be happy all the time. #ItsOkayNotToBeOkay",
    imagePath: 'assets/images/feed2.jpg',
    dateTime: DateTime(2023, 9, 8, 14, 20),
    isAsset: true, // Dummy date and time
  ),
  FeedItem(
    message:
        "Today I chose to prioritize myself and it felt amazing. Remember self-love isn't selfish. #SelfLove",
    imagePath: 'assets/images/feed3.jpg',
    dateTime: DateTime(2023, 9, 7, 10, 15),
    isAsset: true, // Dummy date and time
  ),
]);
