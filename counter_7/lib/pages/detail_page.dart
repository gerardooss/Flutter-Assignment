import 'package:counter_7/models/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/utils/drawer.dart';

class MyDetail extends StatefulWidget {
  const MyDetail({
    super.key,
    required this.title,
    required this.releaseDate,
    required this.rating,
    required this.watched,
    required this.review,
  });

  final String title;
  final String releaseDate;
  final double rating;
  final String watched;
  final String review;

  @override
  State<MyDetail> createState() => _MyDetailState();
}

class _MyDetailState extends State<MyDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: AsgDrawer(),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [Text("Release Date: " + widget.releaseDate)],
              ),
              Row(
                children: [Text("Rating: " + widget.rating.toString() + "/5")],
              ),
              Row(
                children: [Text("Watched: " + widget.watched)],
              ),
              Row(
                children: [Text("Review: " + widget.review)],
              ),
              Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 10, right: 10),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
