## AnimateZ: Flutter Package for Animating Widgets

**AnimateZ** is a Flutter package that allows you to add various animations to your widgets with ease. It provides a flexible API for defining custom animations or choosing from pre-defined animation types like rotation, flip, and scale.

### Features

* **Customizable animations:** Define your own animation using `AnimationSpec` with properties like `curve`, `duration`, and `tween`.
* **Pre-defined animation types:** Choose from predefined animation types like `rotate`, `flip`, and `scale`.
* **Easy to use:** Wrap your child widget with `AnimateZWidget` and specify the desired animation parameters.

### Usage

1. **Import the package:**

```dart
import 'package:animate_z/animate_z.dart';
```

2. **Use the `AnimateZWidget`:**

```dart
AnimateZWidget(
  child: Icon(Icons.star),
  animate: true,
  animationType: AnimationType.rotate, // Or AnimationType.flip, AnimationType.scale
  customAnimation: AnimationSpec(
    curve: Curves.easeIn,
    duration: Duration(milliseconds: 500),
    tween: Tween<double>(begin: 0.0, end: 1.0), // Rotate 1 full turn
  ),
),
```

**Explanation:**

* This example creates a rotating star icon.
* `animate` is set to `true` to enable animation.
* `animationType` is set to `AnimationType.rotate`.
* `customAnimation` is used to define a custom animation with an `easeIn` curve, a duration of 500 milliseconds, and a rotation animation.

### Contributing

We welcome contributions to this package! Please see the CONTRIBUTING.md file for details.

### License

This package is licensed under the MIT License. See the LICENSE file for details.
