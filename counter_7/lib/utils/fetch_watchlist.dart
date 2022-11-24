import 'package:counter_7/models/watchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<WatchList>> fetchWatchList() async {
  var url =
      Uri.parse('https://katalog-kita-semua.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
      'Accept': '*/*'
    },
  );

  var resp = jsonDecode(utf8.decode(response.bodyBytes));

  List<WatchList> watch_list = [];
  for (var data in resp) {
    if (data != null) {
      print("test-01");
      watch_list.add(WatchList.fromJson(data));
      print("test-02");
    }
  }

  return watch_list;
}
