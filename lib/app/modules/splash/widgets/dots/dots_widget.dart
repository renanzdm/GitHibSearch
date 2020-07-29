import 'package:flutter/material.dart';

class DotsWidget extends StatelessWidget {
  final int pagesLength;
  final int currentPage;

  const DotsWidget(this.pagesLength, this.currentPage)
      : assert(pagesLength != null, 'Required parameter pagesLength'),
        assert(currentPage != null, 'Required parameter currentPage');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pagesLength,
        (index) => AnimatedContainer(
          curve: Curves.easeIn,
          margin: EdgeInsets.all(4),
          height: currentPage == index ? 12 : 10,
          width: currentPage == index ? 12 : 10,
          decoration: BoxDecoration(
              color: currentPage == index
                  ? Colors.deepPurple
                  : Colors.deepPurple.shade200,
              shape: BoxShape.circle),
          duration: Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
