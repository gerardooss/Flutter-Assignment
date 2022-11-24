import 'package:flutter/material.dart';
import 'package:counter_7/utils/drawer.dart';
import 'package:counter_7/models/watchlist.dart';
import 'package:counter_7/utils/fetch_watchlist.dart';
import 'package:counter_7/pages/detail_page.dart';

// --------- Build ---------
class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({super.key});

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  late Future<List<WatchList>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: AsgDrawer(),
      body: FutureBuilder(
          future: futureData,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Watch List kamu kosong!",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyDetail(
                                          title: snapshot
                                              .data![index].fields.title,
                                          releaseDate: snapshot
                                              .data![index].fields.releaseDate,
                                          rating: snapshot
                                              .data![index].fields.rating,
                                          watched: snapshot
                                              .data![index].fields.watched,
                                          review: snapshot
                                              .data![index].fields.review,
                                        )));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 27, vertical: 9),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 2.0,
                                  color:
                                      (snapshot.data![index].fields.watched ==
                                              'yes')
                                          ? Colors.green
                                          : Colors.red),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                  alignment: FractionalOffset.centerRight,
                                  child: Checkbox(
                                      value: (snapshot
                                              .data![index].fields.watched ==
                                          'yes'),
                                      activeColor: Colors.green,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          snapshot.data![index].fields.watched =
                                              (value!) ? 'yes' : "no";
                                        });
                                      }),
                                ))
                              ],
                            ),
                          ),
                        ));
              }
            }
          }),
    );
  }
}
