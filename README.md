 <h1 align="center">  Dot Navigation Bar</h1>

 <p align="center">
  
 <img src="https://img.shields.io/badge/Maintained%3F-Yes-green?style=for-the-badge">
  <br>
  <a href="#" target="_blank"><img alt="undefined" src="https://badgen.net/pub/flutter-platform/dot_navigation_bar"></a>
  <a href="#" target="_blank"><img alt="undefined" src="https://badgen.net/pub/sdk-version/dot_navigation_bar"></a>
  <br>
  <a href="#" target="_blank"><img alt="undefined" src="https://badgen.net/pub/v/dot_navigation_bar"></a>
  <a href="#" target="_blank"><img alt="undefined" src="https://badgen.net/pub/license/dot_navigation_bar"></a>
  <a href="#" target="_blank"><img alt="undefined" src="https://badgen.net/pub/likes/dot_navigation_bar"></a>
  <a href="#" target="_blank"><img alt="undefined" src="https://badgen.net/pub/points/dot_navigation_bar"></a>
  <a href="#" target="_blank"><img alt="undefined" src="https://badgen.net/pub/popularity/dot_navigation_bar"></a>
  <br>
  <a href="#"><img alt="undefined" src="https://img.shields.io/github/license/GitSquared/edex-ui.svg?style=popout"></a>
  <a href="#" target="_blank"><img alt="undefined" src="https://badgen.net//github/stars/haptome/dot_navigation_bar"></a>
  
 
  <br>
 

</p>



A bottom navigation bar that you can customize with the options you need, without any limits. You can also customize the appearance of the navigation bar with simple smooth animations, providing a nice and clean UI/UX.

 ![style1](github-assets/ScreenShot.png)
[Example flutter project](https://github.com/haptome/watchs)
___
 NEW
___ 
  + Round nav bar
  + Example file
  + Floating nav bar
  + shadow to Floating nav bar


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

# If you want to show body behind the navbar, it should be true
          extendBody: true,
  if you are not intersted inmaking round nav bar with show body behind the navbar
  you have to make that

          extendBody: false,

```dart
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(),
    extendBody: true,//<------like this 
    bottomNavigationBar:  DotNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          onTap: _handleIndexChanged,
          dotIndicatorColor: Colors.black,
          // enableFloatingNavBar: false
          items: [
            
            
          ],
        ),
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
      bottomNavigationBar:  DotNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          onTap: _handleIndexChanged,
          // dotIndicatorColor: Colors.black,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Colors.purple,
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              selectedColor: Colors.pink,
            ),

            /// Search
            DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: Colors.orange,
            ),

            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: Colors.teal,
            ),
            
          ],
        ),
    );
  }

```

The constructor has 18 attributes related to the Widget:

- `items`: A list of tabs to display, ie `Home`, `Profile`,`Cart`, etc
- `currentIndex`: The tab to display.
- `onTap`:Returns the index of the tab that was tapped.
- `selectedItemColor`:The color of the icon and text when the item is selected.
- `unselectedItemColor`: The color of the icon and text when the item is not selected.
- `margin`:A convenience field for the margin surrounding the entire widget.
- `itemPadding`:The padding of each item.
- `duration`: The transition duration.
- `curve`: The transition curve.
- `dotIndicatorColor`:The color of the Dot indicator.
- `marginR`:margin for the bar to give some radius .
- `paddingR`:padding for the bar to give some radius.
- `borderRadius`:border radius for nav bar.
- `backgroundColor`:bgd colors for the nav bar.
- `boxShadow`: floating nav bar shadow ,it takes `List of BoxShadow`
- `enableFloatingNavBar`: make Floating nav bar enabled.
- `enablePaddingAnimation`: enable the animation on item during item change.
- `splashColor`: Color of the item's Splash Color. To disable, use `Colors.transparent`.

## default values
 marginR = const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
 
 paddingR = const EdgeInsets.only(bottom: 5, top: 10),

borderRadius = 30,

backgroundColor =  Colors.white,
enableFloatingNavBar=true,
enablePaddingAnimation=true

## Contributors
@iamvivekkaushik
@buraktabn
@Zheng Xiangrui
   


