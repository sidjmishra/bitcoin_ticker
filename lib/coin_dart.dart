import 'package:bitcointicker/secrets/secret.dart';
import 'package:bitcointicker/secrets/secretLoader.dart';
import 'package:dio/dio.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData(String? selectedCurrency) async {
    // Get the API key

    Secret secret = await SecretLoader(secretPath: "secrets.json").load();
    final API_KEY = secret.API_KEY;

    // Get the coin data from the API

    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$API_KEY';

      try {
        var dio = Dio();
        final response = await dio.get(requestURL);
        if (response.statusCode == 200) {
          var decodedData = response.data;
          double price = decodedData['rate'];
          print("Here" + price.toString());
          cryptoPrices[crypto] = price.toStringAsFixed(0);
        } else {
          print(response.statusCode);
          throw 'Problem with the get request';
        }
      } catch (e) {
        throw "Error";
      }
    }
    return cryptoPrices;
  }
}
