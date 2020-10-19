import 'package:coda_wallet/account_txns/blocs/account_txns_bloc.dart';
import 'package:coda_wallet/account_txns/blocs/account_txns_states.dart';
import 'package:coda_wallet/account_txns/screens/account_txns_screen.dart';
import 'package:coda_wallet/owned_wallets/blocs/owned_accounts_entity.dart';
import 'package:coda_wallet/qr_address/qr_address_screen.dart';
import 'package:coda_wallet/qr_scan/qr_scanner.dart';
import 'package:coda_wallet/send_token/blocs/send_token_bloc.dart';
import 'package:coda_wallet/send_token/blocs/send_token_states.dart';
import 'package:coda_wallet/send_token/screens/send_token_screen.dart';
import 'package:coda_wallet/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

toAccountTxnsScreen(BuildContext context, Account account) {

  Navigator.push(context,
    MaterialPageRoute(builder: (context) {
      return BlocProvider<AccountTxnsBloc>(
        create: (BuildContext context) {
          return AccountTxnsBloc(RefreshAccountTxnsLoading(null), account.publicKey);
        },
        child: AccountTxnsScreen(account)
      );
    }
  ));
}

toQrAddressScreen(BuildContext context, String publicKey) {
  Navigator.push(context,
    MaterialPageRoute(builder: (context) => QrAddress(publicKey))
  );
}

toSendTokenScreen(BuildContext context, String publicKey, String balance, bool locked) {
  Navigator.push(context,
    MaterialPageRoute(builder: (context) {
      return BlocProvider<SendTokenBloc>(
        create: (BuildContext context) {
          return SendTokenBloc(InputInvalidated());
        },
        child: SendTokenScreen(publicKey, balance, locked)
      );
    }
  ));
}

dynamic toQrScanScreen(BuildContext context) async {
  final result = Navigator.push(context,
      MaterialPageRoute(builder: (context) => QrScanScreen())
  );
  return result;
}

toSettingScreen(BuildContext context) {
  final result = Navigator.push(context,
      MaterialPageRoute(builder: (context) => SettingScreen())
  );
  return result;
}