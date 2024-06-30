# Migration Guide

## From version 0.0.1 to 0.1.0

### Replacing `navigateTo` with `to`

In your code, find instances of `navigateTo` and replace them with `to`. Here’s an example:

```dart
// Before
context.navigateTo(YourPage());

// After
context.to(YourPage());
```