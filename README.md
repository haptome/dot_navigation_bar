# Dot Navigation Bar
![version](https://img.shields.io/badge/version-0.0.1-blue.svg) 

A bottom navigation bar that you can customize with the options you need, without any limits. You can also customize the appearance of the navigation bar with simple smooth animations, providing a nice and clean UX.

| (github-assets/Screen-Recording.gif)  | 
 <img src="github-assets/Screen-Shot.png" alt="preview" width="300"/> 



## Getting Started

To install, add it to your `pubspec.yaml` file:

```
dependencies:
    dot_navigation_bar:

```

```dart
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
```

## How to use it

 call `DotNavigationBar`'s constructor:

```dart
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(),
    bottomNavigationBar: DotNavigationBar(
        items: <DotNavigationBarIteam>[
          
        ],
        
      )
  );
}
```

## basic implementation

```dart
   Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset("assets/IMG.png"),
      ),
      bottomNavigationBar: DotNavigationBar(
        items: <DotNavigationBarIteam>[
          DotNavigationBarIteam(icon: LineAwesomeIcons.home, onTap: () {}),
          DotNavigationBarIteam(icon: LineAwesomeIcons.safari, onTap: () {}),
          DotNavigationBarIteam(icon: LineAwesomeIcons.briefcase, onTap: () {}),
          DotNavigationBarIteam(icon: LineAwesomeIcons.user, onTap: () {}),
        ],
        color: Colors.grey.withOpacity(0.5),
        activeColor: Colors.green[200],
        dotColor: Colors.green,
        backgroundShadowColor: Colors.green[200],
        
      ),
    );
  }

```

The constructor has 17 attributes related to the API:

- `List<DotNavigationBarIteam> items` 
- `Color activeColor` Icons  Active Color.
- `Color dotColor`The Color of dot indicater.
- `Color color` Icons Main Colors.
- `double paddingL` Container Padding Left. Default value is `1`.
- `double paddingT`Container Padding Top. Default value is `1`.
- `double paddingR` Container Padding Right. Default value is `1`.
- `double paddingB`Container Padding Bottom. Default value is `1`.
- `double paddingV` symmetric vertical Padding of the Container. Default value is `25`.
- `double topLeft` Container Top Left corner radius . Default value is `10`.
- `double topRight`Container Top right corner radius . Default value is `10`.
- `double bottomLeft` Container bottom Left corner radius . Default value is `0`.
- `double bottomRight`Container bottom right corner radius . Default value is `0`.
- `double materialElevation` Containers elevation
- `Color backgroundColor`Background color. Default value is `white`.
- `Color backgroundShadowColor` Background shadow color . Default value is `grey`.
- `double bottomRight`Background shadow color . Default value is `grey`.
