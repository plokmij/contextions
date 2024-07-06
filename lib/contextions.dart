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
  @Deprecated('Use replace() instead.')
  void navigateAndReplace(Widget page) {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (_) => page));
  }

  /// Navigate to a new page and replace the current page.
  Future<T?> replace<T extends Object?, TO extends Object?>(Widget page) async {
    return Navigator.pushReplacement<T, TO>(this, MaterialPageRoute(builder: (_) => page));
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

  /// Show a dialog with the given message.
  /// The [title] argument is used to set the title of the dialog.
  /// The [content] argument is used to set the content of the dialog.
  /// The [actions] argument is used to set the actions of the dialog.
  /// The [barrierDismissible] argument is used to determine if the dialog can be dismissed by tapping on the scrim.
  /// The [useRootNavigator] argument is used to determine if the dialog should be displayed above the nearest Navigator.
  /// The [routeSettings] argument is used to set the route settings of the dialog.
  /// The [barrierColor] argument is used to set the color of the scrim.
  /// The [barrierLabel] argument is used to set the semantic label of the scrim.
  /// The [transitionDuration] argument is used to set the duration of the dialog animation.
  ///  
  /// The [transitionBuilder] argument is used to set the transition builder of the dialog.
  /// The [useSafeArea] argument is used to determine if the dialog should be displayed within the safe area.
  Future<T?> showDialogXY<T>({
    String? title,
    String? content,
    List<Widget>? actions,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
  }) {
    return showDialog<T>(
      context: this,
      builder: (context) => AlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: actions,
      ),
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
    );
  }

  /// Check if the keyboard is visible.
  /// Returns true if the keyboard is visible, false otherwise.
  bool get isKeyboardVisible {
    return MediaQuery.of(this).viewInsets.bottom > 0;
  }

  /// Check if screen is in landscape mode.
  /// Returns true if the screen is in landscape mode, false otherwise.
  bool get isLandscape {
    return MediaQuery.of(this).orientation == Orientation.landscape;
  }

  /// Check if screen is in portrait mode.
  /// Returns true if the screen is in portrait mode, false otherwise.
  bool get isPortrait {
    return MediaQuery.of(this).orientation == Orientation.portrait;
  }

}
