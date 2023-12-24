import 'package:hitbitz/core/config/type_defs.dart';

class EndPoints {
  const EndPoints._();

  ////////////!      General      !////////////
  static const _scheme = 'https';
  static const _host = 'trsrv.xtra-go.com';
  static const _port = 444;

  static String imageUrl(String path) => '$_scheme://$_host:$_port/${path.replaceAll('\\', '/')}';

  static Uri _mainUri({
    required String path,
    ParamsMap params,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/$path',
      port: _port,
      queryParameters: params,
    );
    // log(uri.toString().logMagenta);
    return uri;
  }

  ////////////!        User        !////////////
  static Uri _user({required String path, ParamsMap params}) => _mainUri(path: 'User/$path', params: params);
  static Uri signIn({ParamsMap params}) => _user(path: 'SignIn', params: params);

  ////////////!     Permissions    !////////////
  static Uri permissions({ParamsMap params}) => _mainUri(path: 'Permissions', params: params);

  ////////////!       Settings     !////////////
  static Uri _setting({required String path, ParamsMap params}) => _mainUri(path: 'Setting/$path', params: params);
  static Uri getHomeStatistics({ParamsMap params}) => _setting(path: 'GetDailyPageData', params: params);
  static Uri getAllConstants({ParamsMap params}) => _setting(path: 'GetAllConstants', params: params);
  static Uri getGetGeneralSettings({ParamsMap params}) => _setting(path: 'GetGeneralSettings', params: params);
  static Uri getAllAgentTypes({ParamsMap params}) => _setting(path: 'GetAllAgentType', params: params);
  static Uri getPricesType({ParamsMap params}) => _setting(path: 'GetPricesType', params: params);
  static Uri getAllAddresses({ParamsMap params}) => _setting(path: 'GetAllAddresses', params: params);
  static Uri getAllCurrencies({ParamsMap params}) => _setting(path: 'GetAllCurrency', params: params);
  static Uri getAllCreditCards({ParamsMap params}) => _setting(path: 'GetAllCreditCards', params: params);
  static Uri getAllCancelReasons({ParamsMap params}) => _setting(path: 'GetAllCancelReasons', params: params);
  static Uri getMainCurrency({ParamsMap params}) => _setting(path: 'GetMainCurrency', params: params);

  ////////////!      Customers     !////////////
  static Uri _customer({required String path, ParamsMap params}) => _mainUri(path: 'Customer/$path', params: params);
  static Uri getAllCustomers({ParamsMap params}) => _customer(path: 'GetAllCustomers', params: params);
  static Uri getAllVisits({ParamsMap params}) => _customer(path: 'GetAllVisits', params: params);
  static Uri getAccountDetails({ParamsMap params}) => _customer(path: 'GetAccountDetails', params: params);
  static Uri addCustomer({ParamsMap params}) => _customer(path: 'AddCustomer', params: params);

  ////////////!      Products      !////////////
  static Uri _products({required String path, ParamsMap params}) => _mainUri(path: 'Products/$path', params: params);
  static Uri getGroupsWithProducts({ParamsMap params}) => _products(path: 'GetAllGroupsWithProducts', params: params);
  static Uri getAllGroupsWithProductsDetails({ParamsMap params}) =>
      _products(path: 'GetAllGroupsWithProductsDetails', params: params);

  ////////////!       Visit       !////////////
  static Uri _visit({required String path, ParamsMap params}) => _mainUri(path: 'Visit/$path', params: params);
  static Uri getAllActivities({ParamsMap params}) => _visit(path: 'GetAllActivities', params: params);
  static Uri addVisit({ParamsMap params}) => _visit(path: 'AddVisit', params: params);
}
