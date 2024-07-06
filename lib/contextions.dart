// lib/context_extensions.dart

import 'package:flutter/material.dart';

/// Extension methods on BuildContext to provide easy access to Navigator, Theme, MediaQuery, and ScaffoldMessenger functions.
extension ContextExtensions on BuildContext {
  /// Navigate to a new page.
  @Deprecated('Use to() instead.')
  void navigateTo(Widget page) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  /// Navigate to a new page.
  Future<T?> to<T>(Widget page) async {
    return Navigator.push<T?>(this, MaterialPageRoute(builder: (_) => page));
  }

  /// Navigate to a new page and replace the current page.
  void navigateAndReplace(Widget page) {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => page));
  }

  /// Pop the current page off the navigator stack.
  void pop() {
    Navigator.pop(this);
  }

  /// Get the current ThemeData.
  ThemeData get theme => Theme.of(this);

  /// Get the current TextTheme.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get the current ColorScheme.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Get the screen size.
  Size get screenSize => MediaQuery.of(this).size;

  /// Get the screen height.
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Get the screen width.
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Get the status bar height.
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// Get the bottom padding.
  double get bottomPadding => MediaQuery.of(this).padding.bottom;

  /// Show a snackbar with the given message.
  void showSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  /// Show a dialog with the given widget as content.
  Future<T?> showDialogX<T>(Widget dialog) {
    return showDialog<T>(
      context: this,
      builder: (BuildContext context) => dialog,
    );
  }

  /// Open the drawer.
  void openDrawer() {
    Scaffold.of(this).openDrawer();
  }

  /// Close the drawer if it's open.
  void closeDrawer() {
    Navigator.pop(this);
  }

  /// Show a modal bottom sheet.
  Future<T?> showModalBottomSheetX<T>(Widget sheet) {
    return showModalBottomSheet<T>(
      context: this,
      builder: (context) => sheet,
    );
  }

  ///Show a bottom sheet.
  ///The [builder] argument typically builds a bottom sheet widget.
  ///The [isScrollControlled] argument is used to determine if the bottom sheet should take the full screen height or not.
  ///The [backgroundColor] argument is used to set the background color of the bottom sheet.
  ///The [elevation] argument is used to set the elevation of the bottom sheet.
  /// The [shape] argument is used to set the shape of the bottom sheet.
  /// The [clipBehavior] argument is used to set the clip behavior of the bottom sheet.
  /// The [isDismissible] argument is used to determine if the bottom sheet can be dismissed by tapping on the scrim.
  /// The [enableDrag] argument is used to determine if the bottom sheet can be dragged up and down.
  /// The [isScrollControlled] argument is used to determine if the bottom sheet should take the full screen height or not.
  /// The [routeSettings] argument is used to set the route settings of the bottom sheet.

  Future<T?> showBottomSheetX<T>({
    required Widget Function(BuildContext) builder,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip clipBehavior = Clip.none,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = false,
    RouteSettings? routeSettings,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      routeSettings: routeSettings,
    );
  }

  /// Show search
 Future<T?> showSearchX<T>({
    required SearchDelegate<T> delegate,
  }) {
    return showSearch<T>(
      context: this,
      delegate: delegate,
    );
  }
}
