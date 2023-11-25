  import 'dart:convert';

  import 'package:http/http.dart' as http;
  import 'package:quadb_test/model/model-class.dart';
import 'package:quadb_test/utils/variables.dart';

  Future<List<Forecast>> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      print(response.body);


       final List<Forecast> fetchedData =
            forecastFromJson(response.body);

        // Update the state with the fetched data
        
          datas = fetchedData;
        
          //  return Forecast.fromJson(jsonDecode(response.body));
          return forecastFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


  Future<List<Forecast>> searchData(search_term) async {
    final response = await http
        .get(Uri.parse("https://api.tvmaze.com/search/shows?q=${search_term}"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      print("---------------------------------------------${response.body}-----------------------------------------------");


       final List<Forecast> fetchedData =
            forecastFromJson(response.body);

        // Update the state with the fetched data
        
          datas = fetchedData;
        
          //  return Forecast.fromJson(jsonDecode(response.body));
          return forecastFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
 Future<List<Forecast>> previousEpisodes() async {
    final response = await http
        .get(Uri.parse("https://api.tvmaze.com/episodes/2530954"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      print("#####################################################3${response.body}#################################################3");


       final List<Forecast> fetchedData =
            forecastFromJson(response.body);

        // Update the state with the fetched data
        
          datas = fetchedData;
        
          //  return Forecast.fromJson(jsonDecode(response.body));
          return forecastFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
 