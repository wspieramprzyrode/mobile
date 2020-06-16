// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _InventoryService implements InventoryService {
  _InventoryService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://api-dev.wspieramprzyrode.pl/v1//inventory/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getObjects() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/objects',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => InventoryObject.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/categories',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            InventoryCategory.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
