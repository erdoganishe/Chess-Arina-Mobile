import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getAccessToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('accessToken') ?? '';
}

Future<void> makeAuthenticatedRequest(String URL) async {
  final accessToken = await getAccessToken();

  if (accessToken.isNotEmpty) {
    try {
      // Make sure to replace 'your-authenticated-endpoint' with the actual URL of your authenticated endpoint
      final url = Uri.parse('127.0.0.1:3000$URL');

      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        // Request successful, handle the response as desired
        final responseData = jsonDecode(response.body);
        // Do something with the response data
      } else {
        // Handle error response
        print(
            'Authenticated request failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle any exceptions that occurred during the request
      print('Error during authenticated request: $error');
    }
  } else {
    // Handle the case when the access token is not available
    print('Access token not available');
  }
}

class GameDetails {
  String? user1;
  String? user2;
  String? win;
  GameDetails({this.user1, this.user2, this.win});
  GameDetails.fromJSON(Map<String, dynamic> json) {
    user1 = json["user1"];
    user2 = json["user2"];
    win = json["win"];
  }
}

Future<GameDetails> getGameDetails() async {
  final accessToken = await getAccessToken();

  if (accessToken.isNotEmpty) {
    try {
      // Make sure to replace 'your-authenticated-endpoint' with the actual URL of your authenticated endpoint
      final url = Uri.parse('http://25.71.143.220:3000/game-mobile');

      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        // Request successful, handle the response as desired
        final responseData = jsonDecode(response.body);
        print(responseData);

        return GameDetails.fromJSON(responseData);
        // Do something with the response data
      } else {
        // Handle error response
        print(
            'Authenticated request failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return GameDetails();
      }
    } catch (error) {
      // Handle any exceptions that occurred during the request
      print('Error during authenticated request: $error');
      return GameDetails();
    }
  } else {
    // Handle the case when the access token is not available
    print('Access token not available');
    return GameDetails();
  }
}

