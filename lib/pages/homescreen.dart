import 'package:flutter/material.dart';
import 'widgetselection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Widget> selectedWidgets = [];

  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> navigateToWidgetSelection() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WidgetSelectionScreen()),
    );
    if (result != null) {
      setState(() {
        selectedWidgets = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(8, 30, 8, 8),
          child: Text(
            'Assignment App',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: const Color.fromRGBO(241, 255, 237, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    child: selectedWidgets.isEmpty
                        ? const Center(
                            child: Text(
                              'No widget is added',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        : ListView.builder(
                            itemBuilder: (context, index) => Column(
                              children: [
                                selectedWidgets[index],
                              ],
                            ),
                            itemCount: selectedWidgets.length,
                          )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(195, 253, 187, 1),
                    foregroundColor: Colors.black,
                    side: const BorderSide(width: 2)),
                onPressed: () => navigateToWidgetSelection(),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Text(
                    'Add Widgets',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
