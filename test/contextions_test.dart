import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contextions/contextions.dart';

void main() {
  testWidgets('Navigate to a new page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                // ignore: deprecated_member_use_from_same_package
                context.navigateTo(TestPage());
              },
              child: Text('Navigate'),
            ),
          ),
        ),
      ),
    ));

    // Initial page should contain 'Home'
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Test Page'), findsNothing);

    // Tap the button and trigger a frame
    await tester.tap(find.text('Navigate'));
    await tester.pumpAndSettle();

    // New page should contain 'Test Page'
    expect(find.text('Home'), findsNothing);
    expect(find.text('Test Page'), findsOneWidget);
  });

  testWidgets('Navigate to a new page using context.to',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                context.to(TestPage());
              },
              child: Text('Navigate'),
            ),
          ),
        ),
      ),
    ));
    // Initial page should contain 'Home'
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Test Page'), findsNothing);
    // Tap the button and trigger a frame
    await tester.tap(find.text('Navigate'));
    await tester.pumpAndSettle();
    // New page should contain 'Test Page'
    expect(find.text('Home'), findsNothing);
    expect(find.text('Test Page'), findsOneWidget);
  });

  testWidgets('Show Snackbar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                context.showSnackbar('Hello Snackbar');
              },
              child: Text('Show Snackbar'),
            ),
          ),
        ),
      ),
    ));

    // Tap the button and trigger a frame
    await tester.tap(find.text('Show Snackbar'));
    await tester.pump(); // Start the animation
    await tester.pump(const Duration(seconds: 1)); // Snackbar duration

    // Snackbar should contain 'Hello Snackbar'
    expect(find.text('Hello Snackbar'), findsOneWidget);
  });

  testWidgets('Show Dialog', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                context.showDialogX(
                  AlertDialog(
                    title: Text('Dialog Title'),
                    content: Text('Dialog Content'),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Show Dialog'),
            ),
          ),
        ),
      ),
    ));

    // Tap the button and trigger a frame
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // Dialog should be visible
    expect(find.text('Dialog Title'), findsOneWidget);
    expect(find.text('Dialog Content'), findsOneWidget);

    // Tap the OK button and close the dialog
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Dialog should be dismissed
    expect(find.text('Dialog Title'), findsNothing);
    expect(find.text('Dialog Content'), findsNothing);
  });

  testWidgets('Open and close drawer', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Home')),
          drawer: Drawer(
              child: ListView(children: [
            Text('Drawer Content'),
            ElevatedButton(
              onPressed: () {
                context.closeDrawer();
              },
              child: Text('Close Drawer'),
            ),
          ])),
          body: Builder(builder: (context) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.openDrawer();
                    },
                    child: Text('Open Drawer'),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    ));

    // Tap the button to open the drawer
    await tester.tap(find.text('Open Drawer'));
    await tester.pumpAndSettle();

    // Drawer should be open and contain 'Drawer Content'
    expect(find.text('Drawer Content'), findsOneWidget);

    // Tap the button to close the drawer
    await tester.tap(find.text('Close Drawer'));
    await tester.pumpAndSettle();

    // Drawer should be closed
    expect(find.text('Drawer Content'), findsNothing);
  });

  testWidgets('Show Bottom Sheet', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                context.showBottomSheetX(
                  builder: (BuildContext context) => Container(
                    height: 200,
                    color: Colors.white,
                    child: Center(
                      child: Text('Bottom Sheet Content'),
                    ),
                  ),
                );
              },
              child: Text('Show Bottom Sheet'),
            ),
          ),
        ),
      ),
    ));
    // Tap the button and trigger a frame
    await tester.tap(find.text('Show Bottom Sheet'));
    await tester.pumpAndSettle();
    // Bottom Sheet should be visible
    expect(find.text('Bottom Sheet Content'), findsOneWidget);
  });

  testWidgets('Show Search Delegate', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                context.showSearchX(
                  delegate: CustomSearchDelegate(),
                );
              },
              child: Text('Show Search Delegate'),
            ),
          ),
        ),
      ),
    ));
    // Tap the button and trigger a frame
    await tester.tap(find.text('Show Search Delegate'));
    await tester.pumpAndSettle();
    // Search delegate should be opened
    expect(find.byKey(Key('delegate-back-button')), findsOneWidget);
  });

  testWidgets('Show Dialog with custom arguments', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                context.showDialogXY(
                  title: 'Custom Dialog Title',
                  content: 'Custom Dialog Content',
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text('OK'),
                    ),
                  ],
                );
              },
              child: Text('Show Custom Dialog'),
            ),
          ),
        ),
      ),
    ));
    // Tap the button and trigger a frame
    await tester.tap(find.text('Show Custom Dialog'));
    await tester.pumpAndSettle();
    // Custom Dialog should be visible
    expect(find.text('Custom Dialog Title'), findsOneWidget);
    expect(find.text('Custom Dialog Content'), findsOneWidget);
    // Tap the OK button and close the dialog
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    // Dialog should be dismissed
    expect(find.text('Custom Dialog Title'), findsNothing);
    expect(find.text('Custom Dialog Content'), findsNothing);
  });
}

// Dummy page for navigation test
class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(title: Text('Test Page')),
      body: Center(child: Text('Test Body')),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  Widget buildLeading(BuildContext context) => IconButton(
        key: Key('delegate-back-button'),
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) => Container();

  @override
  List<Widget> buildActions(BuildContext context) => [];
}
