library http_api_call;

import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
	
  String url;
  String apiKey;
	String secretKey;

	Map<String, String> headers;
  Map<String, String> body;

	Api({this.apiKey, this.secretKey}) {
		this.headers = {
			'authorization': 'Basic '+ base64Encode(utf8.encode('$apiKey:$secretKey')),
			'content-type': 'application/json',
			'accept': 'application/json'
		};
	}

  setBody(body) {

    Api api = Api(apiKey: this.apiKey, secretKey: this.secretKey);

    api.body = body;

    return api;
  }

	get(String url) async {
		final response =
			await http.get(url, headers: headers);

		this.statusCheck(response.statusCode);

		return response;
	}

  post(String url) async {
		final response =
			await http.post(url, headers: headers, body: json.encode(this.body));

		this.statusCheck(response.statusCode);

		return response;
	}

	statusCheck(int statusCode) {
		if (statusCode==401){
			throw new Exception("Authentication failed. This is due to wrong API Key and/or API Secret");
		}

		else if (statusCode==403){
			throw new Exception("Forbidden request");
		}

		else if (statusCode==404){
			throw new Exception("Not found. The resources you are trying to reach is unavailable");
		}

		else if (statusCode==422){
			throw new Exception("Unprocessable Entity. You will expect this HTTP Code if you send incomplete data for POST / PATCH request");
		}

		else if (statusCode==429){
			throw new Exception("Too Many Request. You will get this HTTP Code if you have exceeded our rate limits");
		}
		else if (statusCode==500 || statusCode==502 || statusCode==503 || statusCode==504) {
			throw new Exception("Server Errors. If you get this error, it is coming from our side. Just make sure you know how to handle it.");
		}

		else if (statusCode < 200 || json == null) {
			throw new Exception("Error while fetching data");
		}
	}

	String execute() {
		return 'test';
	}
}
