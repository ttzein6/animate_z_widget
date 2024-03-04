## AnimateZ: Flutter Package for Animating Widgets

**Example Preview**
<p align='center'>
    <img src="https://github.com/ttzein6/animate_z_widget.dart/blob/main/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20Max%20-%202024-03-04%20at%2009.44.01.gif?raw=true" />
</p>
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



### License
See the LICENSE file for details.
