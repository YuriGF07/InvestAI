import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class InvestirCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Investir',
      apiUrl:
          'http://webfeeder.cedrofinances.com.br/services/quotes/quote/petr4',
      callType: ApiCallType.GET,
      headers: {
        'symbol':
            '”petr4″,”timeUpdate”:”20-02-2016 16:00:58″,”dateTrade”:”19-02-2016 00:00:00″,”lastTrade”:46,”previous”:4.46,”change”:0.0,”changeMonth”:-7.851243,”bid”:4.43,”ask”:4.47,”timeLastTrade”:”19-02-2016 18:08:07″,”dateTradeObj”:”Feb 19, 2016 12:00:00 AM”,”quantity”:0.0,”quantityLast”:2200.0,”quantityTrades”:23527.0,”volumeAmount”:5.6031E7,”volumeFinancier”:2.50595264E8,”high”:4.57,”low”:4.4,”open”:4.5,”timeBid”:”17:34:00″,”timeAsk”:”17:29:00″,”volumeBid”:16700.0,”volumeAsk”:3200.0,”volumeBetterBid”:500.0,”volumeBetterAsk”:3200.0,”lastTradeLastWeek”:4.45,”lastTradeLastMonth”:4.84,”lastTradeLastYear”:6.7,”interest”:5.6020429E9,”situation”:”2″,”average”:4.472,”execPrice”:0.0,”tickSize”:2,”timeLastTradeSting”:”180807″,”dateLastTradeString”:”20160219″',
      },
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}
