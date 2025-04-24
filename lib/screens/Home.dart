import 'dart:math';
import 'package:bmi_aapp/screens/Result.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isMale = true;
  int Age = 22;
  int weight = 60;
  double height = 170;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  ExpMethod("Male"),
                  SizedBox(
                    width: 16,
                  ),
                  ExpMethod("Female"),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              ExpMethod3(),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  ExpMethod2("Age"),
                  SizedBox(
                    width: 16,
                  ),
                  ExpMethod2("weight"),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 16,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.teal),
                child: TextButton(
                    onPressed: () {
                      var result = weight / pow(height / 100, 2);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Resultpage(
                            age: Age, result: result, ismale: isMale);
                      }));
                    },
                    child: Text(
                      "Calculate",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded ExpMethod(String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(
          () => isMale = type == "Male" ? true : false,
        ),
        child: Container(
          height: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: isMale && type == "Male" || !isMale && type == "Female"
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(type == "Male" ? Icons.male : Icons.female),
            SizedBox(
              height: 15,
            ),
            Text(
              type == "Male" ? "Male" : "Female",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            )
          ]),
        ),
      ),
    );
  }

  Expanded ExpMethod2(String type) {
    return Expanded(
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == "Age" ? "Age" : "Weight",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
            SizedBox(height: 6),
            Text(
              type == "Age" ? "$Age" : "$weight",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36)),
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  mini: true,
                  onPressed: () => setState(() {
                    type == "Age" ? Age++ : weight++;
                  }),
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36)),
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  mini: true,
                  onPressed: () => setState(() {
                    type == "Age" ? Age-- : weight--;
                  }),
                  child: Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded ExpMethod3() {
    return Expanded(
        child: Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.blueGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Height",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                height.toStringAsFixed(1),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
              Text(
                "CM",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Slider(
              min: 90,
              max: 220,
              value: height,
              onChanged: (newValue) {
                height = newValue;
              })
        ],
      ),
    ));
  }
}
