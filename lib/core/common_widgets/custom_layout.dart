import 'package:flutter/material.dart';

class CustomLayout extends StatelessWidget {
  final String? firstString;
  final String? secString;
  final Widget? widget;
  const CustomLayout(
      {super.key, this.firstString, this.secString, this.widget});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  firstString != null
                      ? Text(
                          firstString!,
                          style: Theme.of(context).textTheme.headlineMedium,
                          // textAlign: TextAlign.start,
                        )
                      : const SizedBox(),
                  secString != null
                      ? Text(
                          secString!,
                          style: Theme.of(context).textTheme.bodyMedium,
                          // textAlign: TextAlign.start,
                        )
                      : const SizedBox(),
                ],
              ),
              widget ?? const SizedBox()
            ],
          ),
        ),
      );
  }
}
