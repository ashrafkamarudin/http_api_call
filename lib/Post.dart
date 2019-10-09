class Post {
  String url;
  Map<String, String> body;

  setBody() {

    print('call2');

    this.body = {
      "name" : "test",
      "ipAddress" : "192.168.0.1",
      "provider": "Custom"
    };
  }

  // execute() async {
  //   final response =
	// 		await http.get(url, headers: headers);

	// 	this.statusCheck(response.statusCode);

	// 	return response;
  // }
}