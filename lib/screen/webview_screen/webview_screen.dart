import 'package:flutter/material.dart';
import 'package:soolmate_ui/common/top_bar_area.dart';
import 'package:soolmate_ui/screen/webview_screen/webview_screen_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String appBarTitle;
  final String url;

  const WebViewScreen({super.key, required this.appBarTitle, required this.url});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WebViewScreenViewModel>.reactive(
      onViewModelReady: (model) {
        model.init(url);
      },
      viewModelBuilder: () => WebViewScreenViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Column(
            children: [
              TopBarArea(title2: appBarTitle),
              Expanded(
                child: WebViewWidget(
                  controller: model.controller,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
