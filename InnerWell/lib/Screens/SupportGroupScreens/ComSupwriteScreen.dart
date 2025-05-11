import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import '../../FeedItems/FeedItems.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController _messageController = TextEditingController();
  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _image = image;
    });
  }

  void _showPickImageDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose an option',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.camera, size: 26.0),
                  SizedBox(width: 20),
                  Text(
                    'Take a Photo',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.photo_album, size: 26.0),
                  SizedBox(width: 20),
                  Text(
                    'Choose from Gallery',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _messageController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Write your message here...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: _showPickImageDialog,
                ),
                SizedBox(width: 10),
                _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          File(_image!.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[600],
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_messageController.text.isNotEmpty || _image != null) {
                    List<FeedItem> updatedFeedItems =
                        List.from(globalFeedItems.value);
                    updatedFeedItems.insert(
                      0,
                      FeedItem(
                        message: _messageController.text,
                        imagePath: _image?.path,
                        dateTime: DateTime.now(),
                      ),
                    );
                    globalFeedItems.value =
                        updatedFeedItems; // Note the .value here

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Posted!!'),
                      ),
                    );

                    _messageController.clear();
                    setState(() {
                      _image = null;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Please add a message or select an image.'),
                      ),
                    );
                  }

                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Text('Upload'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
