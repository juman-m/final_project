import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking {
  final url = "https://api.openai.com/v1/chat/completions";

  Future<String> connectGpt({required String msg}) async {
    var urlApi = Uri.parse(url);
    try {
      var response = await http.post(
        urlApi,
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer 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"
        },
        body: json.encode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "system",
              "content":
                  "You will be a dentist and answer the patient's questions about teeth in Arabic"
            },
            {"role": "user", "content": msg}
          ],
          "temperature": 0,
          "max_tokens": 1024,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0
        }),
      );

      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final decodedResponse = utf8.decode(response.bodyBytes);
        final body = json.decode(decodedResponse);
        return body["choices"][0]["message"]["content"];
      } else {
        return "No data ${response.body}";
      }
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
}

// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class Networking {
//   final url = "https://api.openai.com/v1/chat/completions";
//   Future<String> connectGpt({required String msg}) async {
//     var urlApi = Uri.parse(url);
//     try {
//       var response = await http.post(urlApi,
//           headers: {
//             "Content-Type": "application/json",
//             "Authorization":
//                 "Bearer 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"
//           },
//           body: json.encode({
//             "model": "gpt-3.5-turbo",
//             "messages": [
//               {
//                 "role": "system",
//                 "content":
//                     "You will be a dentist and answer the patient's questions about teeth in Arabic"
//               },
//               {"role": "user", "content": msg}
//             ],
//             "temperature": 0,
//             "max_tokens": 1024,
//             "top_p": 1,
//             "frequency_penalty": 0,
//             "presence_penalty": 0
//           }));
//       print("Respone body :${response.body}");
//       if (response.statusCode == 200) {
//         final body = json.decode(response.body);
//         return body["choices"][0]["message"]["content"];
//       } else {
//         return "No data${response.body}";
//       }
//     } catch (error) {
//       throw FormatException(error.toString());
//     }
//   }
// }
