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
  String? username1;
  String? username2;
  GameDetails({required this.user1, required this.user2, required this.win});
  GameDetails.fromJSON(Map<String, dynamic> json)
      : user1 = json['user1'],
        user2 = json['user2'],
        win = json['win'];
}

Future<List<GameDetails>> getGameDetails() async {
  print('start');
  final accessToken = await getAccessToken();
  List<GameDetails> a = List.empty();

  if (accessToken.isNotEmpty) {
    try {
      // Make sure to replace 'your-authenticated-endpoint' with the actual URL of your authenticated endpoint
      final url = Uri.parse('http://25.71.143.220:3000/game-mobile');

      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );
      print('get');
      if (response.statusCode == 200) {
        // Request successful, handle the response as desired
        //final responseData = jsonDecode(response.body);
        Iterable l = json.decode(response.body);
        print('preclass');
        List<GameDetails> posts = List<GameDetails>.from(
            l.map((model) => GameDetails.fromJSON(model)));
        for (var item in posts) {
          await getUserDetails(item.user1 ?? "")
              .then((value) => item.username1 = value.username);
          print('u2: ${item.user2}');
          await getUserDetails(item.user2 ?? "").then((value) {
            print('value u2: ${value}');
            item.username2 = value.username;
          });
          print(item.username2);
        }
        return posts;
        // Do something with the response data
      } else {
        // Handle error response
        print(
            'Authenticated request failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return a;
      }
    } catch (error) {
      // Handle any exceptions that occurred during the request
      print('Error during authenticated request: $error');
      return a;
    }
  } else {
    // Handle the case when the access token is not available
    print('Access token not available');
    return a;
  }
}

class UserDetails {
  String? username;
  String? rena;
  UserDetails({ this.username,  this.rena});
  UserDetails.fromJSON(Map<String, dynamic> json)
      : username = json['username'],
        rena = json['rena'];
}

Future<UserDetails> getUserDetails(String uid) async {
  final accessToken = await getAccessToken();
  UserDetails a = UserDetails(username: 'Player have not connected', rena: 'a');

  if (accessToken.isNotEmpty) {
    try {
      // Make sure to replace 'your-authenticated-endpoint' with the actual URL of your authenticated endpoint
      final url = Uri.parse('http://25.71.143.220:3000/game-mobile/$uid');

      final response = await http.get(
        url,
        //headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        // Request successful, handle the response as desired
        final responseData = jsonDecode(response.body);
        Map<String, dynamic> l = json.decode(response.body);
        print('l: $l');
        UserDetails post = UserDetails.fromJSON(l);
        // print(posts);
        print('post: ${post.username}');
        return post;
        // Do something with the response data
      } else {
        // Handle error response
        print(
            'Authenticated request failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return a;
      }
    } catch (error) {
      // Handle any exceptions that occurred during the request
      print('Error during authenticated request: $error');
      return a;
    }
  } else {
    // Handle the case when the access token is not available
    print('Access token not available');
    return a;
  }
}
