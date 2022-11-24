import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:flutter_playground/crypto_response.dart';
import 'package:http/http.dart' as http;

import '../page3/home_page.dart';



Future main() async {
  var apiKey ="42388792-ce85-4d63-90fc-d661b067ba2a";
  //var apiKey = "4fa4acdb-ca6d-4d1d-897a-a3906e5e4d9d";

  var url = "https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=500&convert=USD";

  var response = await http.get(
    Uri.parse(url),
    headers: {"X-CMC_PRO_API_KEY": apiKey, "Accepts": "application/json"},
  );

  //you have to decode this response
  print(response.body);
}

/**[8:33 PM, 7/20/2022] Luckson;:
 *
  */
class CoinListing extends StatefulWidget {
  const CoinListing({Key? key}) : super(key: key);

  @override
  State<CoinListing> createState() => _CoinListingState();
}

class _CoinListingState extends State<CoinListing> {
  var _isLoading = true;

  final _coins = <Coin>[];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    var apiKey = "42388792-ce85-4d63-90fc-d661b067ba2a";

    var url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=500&convert=USD";

    var response = await http.get(
      Uri.parse(url),
      headers: {"X-CMC_PRO_API_KEY": apiKey, "Accepts": "application/json"},
    );

    var coins = CryptoResponse.fromJson(jsonDecode(response.body)).data;

    _coins.addAll(coins ?? []);

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: DrawerCode(),
        appBar: AppBar(
          title: Text("Crypto Currency Category"),
          centerTitle: true,
          backgroundColor: Colors.green,

        ),

        //CRYPTO CODE STARTS HERE
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemBuilder: (context, index) {
            var coin = _coins[index];
            return ListTile(
              title: Text('${coin.name}',style: TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: 20.0,),),
              subtitle: Text('${coin.symbol}',style: TextStyle(
                //fontWeight:FontWeight.bold,
                fontSize: 20.0,),),
              trailing: Text('\$ ${(coin.quote?.usd?.price)?.toStringAsFixed(2)}',style: TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: 20.0,),),
            );
          },
        ),
      ),
    );
  }
}

//listing_page.dart
//[8:34 PM, 7/20/2022] Luckson:
class CryptoResponse {
  CryptoResponse({
    this.status,
    this.data,
  });

  CryptoResponse.fromJson(dynamic json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Coin.fromJson(v));
      });
    }
  }

  Status? status;
  List<Coin>? data;

  CryptoResponse copyWith({
    Status? status,
    List<Coin>? data,
  }) =>
      CryptoResponse(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (status != null) {
      map['status'] = status?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Coin {
  Coin({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.numMarketPairs,
    this.dateAdded,
    this.tags,
    this.maxSupply,
    this.circulatingSupply,
    this.totalSupply,
    this.platform,
    this.cmcRank,
    this.selfReportedCirculatingSupply,
    this.selfReportedMarketCap,
    this.tvlRatio,
    this.lastUpdated,
    this.quote,
  });

  Coin.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    numMarketPairs = json['num_market_pairs'];
    dateAdded = json['date_added'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    maxSupply = json['max_supply'];
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    platform = json['platform'];
    cmcRank = json['cmc_rank'];
    selfReportedCirculatingSupply = json['self_reported_circulating_supply'];
    selfReportedMarketCap = json['self_reported_market_cap'];
    tvlRatio = json['tvl_ratio'];
    lastUpdated = json['last_updated'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }

  num? id;
  String? name;
  String? symbol;
  String? slug;
  num? numMarketPairs;
  String? dateAdded;
  List<String>? tags;
  num? maxSupply;
  num? circulatingSupply;
  num? totalSupply;
  dynamic platform;
  num? cmcRank;
  dynamic selfReportedCirculatingSupply;
  dynamic selfReportedMarketCap;
  dynamic tvlRatio;
  String? lastUpdated;
  Quote? quote;

  Coin copyWith({
    num? id,
    String? name,
    String? symbol,
    String? slug,
    num? numMarketPairs,
    String? dateAdded,
    List<String>? tags,
    num? maxSupply,
    num? circulatingSupply,
    num? totalSupply,
    dynamic platform,
    num? cmcRank,
    dynamic selfReportedCirculatingSupply,
    dynamic selfReportedMarketCap,
    dynamic tvlRatio,
    String? lastUpdated,
    Quote? quote,
  }) =>
      Coin(
        id: id ?? this.id,
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        slug: slug ?? this.slug,
        numMarketPairs: numMarketPairs ?? this.numMarketPairs,
        dateAdded: dateAdded ?? this.dateAdded,
        tags: tags ?? this.tags,
        maxSupply: maxSupply ?? this.maxSupply,
        circulatingSupply: circulatingSupply ?? this.circulatingSupply,
        totalSupply: totalSupply ?? this.totalSupply,
        platform: platform ?? this.platform,
        cmcRank: cmcRank ?? this.cmcRank,
        selfReportedCirculatingSupply: selfReportedCirculatingSupply ?? this.selfReportedCirculatingSupply,
        selfReportedMarketCap: selfReportedMarketCap ?? this.selfReportedMarketCap,
        tvlRatio: tvlRatio ?? this.tvlRatio,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        quote: quote ?? this.quote,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['symbol'] = symbol;
    map['slug'] = slug;
    map['num_market_pairs'] = numMarketPairs;
    map['date_added'] = dateAdded;
    map['tags'] = tags;
    map['max_supply'] = maxSupply;
    map['circulating_supply'] = circulatingSupply;
    map['total_supply'] = totalSupply;
    map['platform'] = platform;
    map['cmc_rank'] = cmcRank;
    map['self_reported_circulating_supply'] = selfReportedCirculatingSupply;
    map['self_reported_market_cap'] = selfReportedMarketCap;
    map['tvl_ratio'] = tvlRatio;
    map['last_updated'] = lastUpdated;
    if (quote != null) {
      map['quote'] = quote?.toJson();
    }
    return map;
  }
}

class Quote {
  Quote({
    this.usd,
  });

  Quote.fromJson(dynamic json) {
    usd = json['USD'] != null ? Usd.fromJson(json['USD']) : null;
  }

  Usd? usd;

  Quote copyWith({
    Usd? usd,
  }) =>
      Quote(
        usd: usd ?? this.usd,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (usd != null) {
      map['USD'] = usd?.toJson();
    }
    return map;
  }
}

class Usd {
  Usd({
    this.price,
    this.volume24h,
    this.volumeChange24h,
    this.percentChange1h,
    this.percentChange24h,
    this.percentChange7d,
    this.percentChange30d,
    this.percentChange60d,
    this.percentChange90d,
    this.marketCap,
    this.marketCapDominance,
    this.fullyDilutedMarketCap,
    this.tvl,
    this.lastUpdated,
  });

  Usd.fromJson(dynamic json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    volumeChange24h = json['volume_change_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    percentChange30d = json['percent_change_30d'];
    percentChange60d = json['percent_change_60d'];
    percentChange90d = json['percent_change_90d'];
    marketCap = json['market_cap'];
    marketCapDominance = json['market_cap_dominance'];
    fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    tvl = json['tvl'];
    lastUpdated = json['last_updated'];
  }

  num? price;
  num? volume24h;
  num? volumeChange24h;
  num? percentChange1h;
  num? percentChange24h;
  num? percentChange7d;
  num? percentChange30d;
  num? percentChange60d;
  num? percentChange90d;
  num? marketCap;
  num? marketCapDominance;
  num? fullyDilutedMarketCap;
  dynamic tvl;
  String? lastUpdated;

  Usd copyWith({
    num? price,
    num? volume24h,
    num? volumeChange24h,
    num? percentChange1h,
    num? percentChange24h,
    num? percentChange7d,
    num? percentChange30d,
    num? percentChange60d,
    num? percentChange90d,
    num? marketCap,
    num? marketCapDominance,
    num? fullyDilutedMarketCap,
    dynamic tvl,
    String? lastUpdated,
  }) =>
      Usd(
        price: price ?? this.price,
        volume24h: volume24h ?? this.volume24h,
        volumeChange24h: volumeChange24h ?? this.volumeChange24h,
        percentChange1h: percentChange1h ?? this.percentChange1h,
        percentChange24h: percentChange24h ?? this.percentChange24h,
        percentChange7d: percentChange7d ?? this.percentChange7d,
        percentChange30d: percentChange30d ?? this.percentChange30d,
        percentChange60d: percentChange60d ?? this.percentChange60d,
        percentChange90d: percentChange90d ?? this.percentChange90d,
        marketCap: marketCap ?? this.marketCap,
        marketCapDominance: marketCapDominance ?? this.marketCapDominance,
        fullyDilutedMarketCap: fullyDilutedMarketCap ?? this.fullyDilutedMarketCap,
        tvl: tvl ?? this.tvl,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['volume_24h'] = volume24h;
    map['volume_change_24h'] = volumeChange24h;
    map['percent_change_1h'] = percentChange1h;
    map['percent_change_24h'] = percentChange24h;
    map['percent_change_7d'] = percentChange7d;
    map['percent_change_30d'] = percentChange30d;
    map['percent_change_60d'] = percentChange60d;
    map['percent_change_90d'] = percentChange90d;
    map['market_cap'] = marketCap;
    map['market_cap_dominance'] = marketCapDominance;
    map['fully_diluted_market_cap'] = fullyDilutedMarketCap;
    map['tvl'] = tvl;
    map['last_updated'] = lastUpdated;
    return map;
  }
}

class Status {
  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
    this.totalCount,
  });

  Status.fromJson(dynamic json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    errorMessage = json['error_message'];
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
    notice = json['notice'];
    totalCount = json['total_count'];
  }

  String? timestamp;
  num? errorCode;
  dynamic errorMessage;
  num? elapsed;
  num? creditCount;
  dynamic notice;
  num? totalCount;

  Status copyWith({
    String? timestamp,
    num? errorCode,
    dynamic errorMessage,
    num? elapsed,
    num? creditCount,
    dynamic notice,
    num? totalCount,
  }) =>
      Status(
        timestamp: timestamp ?? this.timestamp,
        errorCode: errorCode ?? this.errorCode,
        errorMessage: errorMessage ?? this.errorMessage,
        elapsed: elapsed ?? this.elapsed,
        creditCount: creditCount ?? this.creditCount,
        notice: notice ?? this.notice,
        totalCount: totalCount ?? this.totalCount,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timestamp'] = timestamp;
    map['error_code'] = errorCode;
    map['error_message'] = errorMessage;
    map['elapsed'] = elapsed;
    map['credit_count'] = creditCount;
    map['notice'] = notice;
    map['total_count'] = totalCount;
    return map;
  }
}

//crypto_response.dart