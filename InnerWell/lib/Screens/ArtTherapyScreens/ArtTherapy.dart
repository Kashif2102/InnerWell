//Sahaj code

import 'package:flutter/material.dart';
import 'package:mental_health_app1/Screens/ArtTherapyScreens/ArtDetailScreen.dart';

class ArtTherapyScreen extends StatelessWidget {
  ArtTherapyScreen({super.key});
  String t =
      "These activities will ask you to face some unpleasant aspects of life, but with the goal of overcoming them. Draw a place where you feel safe. An art therapy directive for finding your safe place. Create a mini-diorama. A diorama can showcase an important moment in your life or something from your imagination. Collage Your Worries Away. Toss your worries away and begin tearing, cutting, shredding and layering, Draw something that scares you. Everyone is frightened of something and in this project you'll get a chance to bring that fear to light and hopefully work towards facing it. Turn your illness into art. Struggling with a potentially terminal illness? Process your feelings about your illness. Art journal through a loss in your life. If you've lost someone you love, process it in your art journal. Make art that is ephemeral. Sand painting is practiced in many cultures, usually for healing purposes. Create beautiful patterns with sand on canvas.";
  String g =
      "Here you'll find a collection of projects that will help you be happy about what you have and express your gratitude for it. Document your gratitude visually. What things are you grateful for in your life? Paint or collage a work that represents these things. Create a family tree of strength. This exercise honors those around you who support you. Paint those close to you who offer you the strength you need. Make something for someone else. Making something for someone else can be a great way to feel good and help someone else do so as well. Make anchor art. Who are the anchors in your life? In this project, you'll make an anchor and decorate it with the people and things that provide you stability and strength. Draw all the positive things in your life. Everyone has at least one good thing in life, so sit down and figure out what makes you happy– then draw it. Sculpt your hand in plaster. Explore the symbolism of hand casting. Paint a rock. Paint rocks for relaxation and fun. Create a gratitude tree. What are you grateful for? This clay project asks you to write those things on leaves to construct a tree. Create a life map. A Life Map helps you discover what you want for yourself and your life. Create a snowflake out of paper. Write ideas about how you are unique on the snowflake. Build a personal altar. This is a highly personal project that will help connect you with your spiritual side and honor your resilience.";
  String r =
      "Art therapy can be a great way to relax. Consider these exercises if you're looking to feel a little more laid back. Paint to music. Letting your creativity flow in response to music is a great way to let out feelings and just relax. Make a scribble drawing. With this activity, you'll turn a simple scribble into something beautiful, using line, color and your creativity. Finger paint. Finger painting isn't just fun for kids– adults can enjoy it as well. Get your hands messy and really have fun spreading the paint around. Make a mandala. Whether you use the traditional sand or draw one on your own, this meditative symbol can easily help you to loosen up. Draw with your eyes closed. Not being able to see what you are drawing intensifies fluidity, intuition, touch and sensitivity. Draw something HUGE. Getting your body involved and moving around can help release emotion as you're drawing. Use color blocks. Colors often come with a lot of emotions attached. Choose several paint chips to work with and collage, paint and glue until you've created a colorful masterpiece. Let yourself be free. Don't allow yourself to judge your work. If you think your paintings are too tight and controlled, this collection of tips and techniques to try should help you work in a looser style. Only use colors that calm you. Create a drawing or a painting using only colors that you find calming. Draw in sand. Like a Zen garden, this activity will have you drawing shapes and scenes in the sand, which can be immensely relaxing and a great way to clear your mind. Make a zentangle. These fun little drawings are a great tool for letting go and helping reduce stress. Color in a design. Sometimes, the simple act of coloring can be a great way to relax. Find a coloring book or use this mandala for coloring. Draw outside. Working en plein air can be a fun way to relax and get in touch with nature while you're working on art.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/arttherapy.png', // Replace with your background image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Sized Box at the top
                SizedBox(height: 47.0),

                // Row with Back Button, Title, and Menu Button
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset(
                          'assets/images/arrow_button.jpg', // Replace with your back button image
                          width: 40.0,
                          height: 40.0,
                        ),
                      ),
                      // Title
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Art Therapy',
                          style: TextStyle(
                            fontSize: 28.0,
                            color: Colors.white, // White font color
                          ),
                        ),
                      ),
                      // Menu Button
                      InkWell(
                        onTap: () {
                          // Handle menu button click
                        },
                        child: Image.asset(
                          'assets/images/menubutton.jpg', // Replace with your menu button image
                          width: 40.0,
                          height: 40.0,
                        ),
                      ),
                    ],
                  ),
                ),

                // Search Bar
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Grey background color
                      borderRadius:
                          BorderRadius.circular(30.0), // Round corners
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Search',
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search, // Search icon
                          color: Colors.grey[400], // Icon color
                        ),
                      ),
                    ),
                  ),
                ),

                // ListTiles
                ListTileWithNavigation(
                  image:
                      'assets/images/frame.jpg', // Replace with your image path
                  title: 'Trauma and Loss',
                  content: 'Content for Trauma and Loss',
                  subcontent: t, // You can customize the content
                ),
                ListTileWithNavigation(
                  image:
                      'assets/images/frame.jpg', // Replace with your image path
                  title: 'Gratitude',
                  content: 'Content for Gratitude',
                  subcontent: g, // You can customize the content
                ),
                ListTileWithNavigation(
                  image:
                      'assets/images/frame.jpg', // Replace with your image path
                  title: 'Relaxation',
                  content: 'Content for Relaxation',
                  subcontent: r, // You can customize the content
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileWithNavigation extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final String subcontent;

  ListTileWithNavigation({
    required this.image,
    required this.title,
    required this.content,
    required this.subcontent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: () {
          // Handle card click, navigate to the "ArtDetailScreen" with the content
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArtDetailScreen(
              title: title,
              subcontent: subcontent,
            ),
          ));
        },
        child: Container(
          height: 150.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      content,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                image,
                width: 120.0,
                height: 120.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
