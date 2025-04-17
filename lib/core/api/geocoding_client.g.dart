// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _GeocodeApi implements GeocodeApi {
  _GeocodeApi(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'https://maps.googleapis.com/maps/api/geocode/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<AddressDetailsModel> getAddress({
    required String latlng,
    String resultType = "street_address",
    String locationType = "ROOFTOP",
    String apiKey = "AIzaSyDTfammkGjt7pCFRQnMA_KOdl6Zwx6rWFE",
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'latlng': latlng,
      r'result_type': resultType,
      r'location_type': locationType,
      r'key': apiKey,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<AddressDetailsModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'json',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AddressDetailsModel _value;
    try {
      _value = AddressDetailsModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
