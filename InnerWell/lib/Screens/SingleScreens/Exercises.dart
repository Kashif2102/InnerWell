import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:url_launcher/url_launcher.dart';

class ExercisesScreen extends StatefulWidget {
  @override
  _ExercisesScreenState createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  YoutubeExplode ytExp = YoutubeExplode();
  List<Video> ytResult = [];
  bool isLoading = true;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  fetchVideos() async {
    try {
      var videoList =
          await ytExp.search.getVideos('Exercises for Mental Health');
      setState(() {
        ytResult = videoList.toList();
        isLoading = false;
      });
    } catch (e) {
      print('An error occurred while fetching the videos: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  List<Video> get filteredVideos {
    if (searchQuery.isEmpty) {
      return ytResult;
    }
    return ytResult.where((video) {
      return video.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  Widget listItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: InkWell(
        onTap: () async {
          try {
            String url =
                "https://www.youtube.com/watch?v=${filteredVideos[index].id.value}";
            Uri uri = Uri.parse(url);
            if (await canLaunch(uri.toString())) {
              await launch(uri.toString());
            } else {
              throw 'Could not launch $url';
            }
          } catch (e) {
            print('An error occurred while launching the URL: $e');
          }
        },
        child: Card(
          color: Colors.grey.withOpacity(0.8),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    filteredVideos[index].thumbnails.highResUrl ?? '',
                    fit: BoxFit.cover,
                    height: 100.0,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        filteredVideos[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        filteredVideos[index].author ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Exercises"),
        elevation: 0.0,
        backgroundColor: Colors.black,
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                ;
              },
              color: Colors.black,
            ),
          ),
        ),
        leadingWidth: 70,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5)),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                    ),
                    onChanged: updateSearchQuery,
                  ),
                ),
                Expanded(
                  child: filteredVideos.isEmpty
                      ? Center(
                          child: Text(
                          'No videos found',
                          style: TextStyle(color: Colors.white),
                        ))
                      : ListView.builder(
                          itemCount: filteredVideos.length,
                          itemBuilder: (context, index) {
                            return listItem(index);
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
