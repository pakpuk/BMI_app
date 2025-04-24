import 'package:flutter/material.dart';

class Resultpage extends StatelessWidget {
  final int age;
  final double result;
  final bool ismale;
  const Resultpage(
      {super.key,
      required this.age,
      required this.result,
      required this.ismale});

  String get Resultphrase {
    String resultphrase = '';
    if (result >= 30) {
      resultphrase = 'Obese';
    } else if (result > 25 && result < 30) {
      resultphrase = 'Over Wheight';
    } else if (result > 18.5 && result < 24.9) {
      resultphrase = 'normal';
    } else
      resultphrase = 'Thin';

    return resultphrase;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Result'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Gender : ${ismale ? "Male" : "Female"}",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
            Text(
              "Age : ${age}",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
            Text(
              "The Result : ${result}",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
            Text(
              "Healthiness : ${Resultphrase}",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
