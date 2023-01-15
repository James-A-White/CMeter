import 'package:consensus_meter/imports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectByUrlForm extends GetView<ConnectByUrlController> {
  const ConnectByUrlForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ConnectByUrlController c = Get.put(ConnectByUrlController());

    final String sessionCodeFromUrl = Uri.base.toString().substring(Uri.base.toString().indexOf('/da/') + 4).toUpperCase();

    c.sessionCode = sessionCodeFromUrl;

    final num height = MediaQuery.of(context).size.height;
    final num width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: width < height ? Axis.vertical : Axis.horizontal,
          child: FocusTraversalGroup(
            policy: OrderedTraversalPolicy(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _connectByUrlWidgets(c, context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _connectByUrlWidgets(ConnectByUrlController c, BuildContext context) {
    List<Widget> widgets = <Widget>[];

    widgets.add(
      FocusTraversalOrder(
        order: const NumericFocusOrder(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 18.0),
              child: Text(
                'Connect to Existing Session',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Session code: ${c.sessionCode.trim().toUpperCase()}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: 200.0,
              child: TextFormField(
                controller: c.abbreviation1Controller,
                decoration: const InputDecoration(
                  labelText: 'Enter role (6 char max)',
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 1.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Obx(() => c.status.value.isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: AppColors.accent2,
                    ),
                  )
                : ElevatedButton(
                    onPressed: c.onConnectToSession,
                    child: const Text('Connect to Session'),
                  )),
          ],
        ),
      ),
    );

    return widgets;
  }
}
