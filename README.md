# http_api_call

Simple Flutter Package that simplify api call.

## Getting Started

visit https://pub.dev/packages/http_api_call/versions/0.0.2#-installing-tab- on guide of installing the package

## Usage

Currently this API call only support api calls with basic authentication.

For Get

```Api(
    apiKey: yourusername,
    secretKey: yourpassword
).get('https://yourapiuri.com')
```

For Post

```Api(
    apiKey: yourusername,
    secretKey: yourpassword
).setBody({
    'parameter1' : value1,
    'parameter2' : value2,
    'parameter3' : value3
}).post('https://yourapiuri.com');
```