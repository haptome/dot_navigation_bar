library dot_navigation_bar;

import 'package:flutter/material.dart';

class DotNavigationBar extends StatefulWidget {
  final List<DotNavigationBarIteam> items;
   /// Icons  Active Color.
  final Color activeColor;
   /// The Color of dot indicater.
  final Color dotColor;
   /// Icons Main Colors.
  final Color color;
   /// Container Padding Left. Default value is `1`.
  final double paddingL;
   /// Container Padding Top. Default value is `1`.
  final double paddingT;
  /// Container Padding Right. Default value is `1`.
  final double paddingR;
  /// Container Padding Bottom. Default value is `1`.
  final double paddingB;
  /// symmetric vertical Padding of the Container. Default value is `25`.
  final double paddingV;
 /// Container Top Left corner radius . Default value is `10`.
  final double topLeft;
  /// Container Top right corner radius . Default value is `10`.
  final double topRight;
 /// Container bottom Left corner radius . Default value is `0`.
  final double bottomLeft;
  /// Container bottom right corner radius . Default value is `0`.
  final double bottomRight;
  /// Containers elevation . Default value is `0`.
  final double materialElevation;
  /// Background color. Default value is `white`.
  final Color backgroundColor;
  /// Background color . Default value is `grey`.
  final Color backgroundShadowColor;

  const DotNavigationBar(
      {@required this.items,
      this.activeColor,
      this.dotColor,
      this.color,
      this.paddingL=1,
      this.paddingT=1,
      this.paddingR=1,
      this.paddingB=1,
      this.paddingV=25,
      this.topLeft=10,
      this.topRight=10,
      this.bottomLeft=0,
      this.bottomRight=0,
      this.materialElevation=5,
      this.backgroundColor,
      this.backgroundShadowColor=Colors.grey,
      Key key})
      : super(key: key);
  @override
  _DotNavigationBarState createState() => _DotNavigationBarState();
}

class _DotNavigationBarState extends State<DotNavigationBar> {
  GlobalKey _keyBottomBar = GlobalKey();
  double _numPositionBase, _numDifferenceBase, _positionLeftIndicatorDot;
  int _indexPageSelected = 0;
  Color _color, _activeColor,_dotColor;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  _afterLayout(_) {
    _color = widget.color ?? Colors.black45;
    _dotColor=widget.dotColor??Colors.red;
    _activeColor = widget.activeColor ?? Theme.of(context).primaryColor;
    final sizeBottomBar = (_keyBottomBar.currentContext.findRenderObject() as RenderBox).size;
    _numPositionBase = ((sizeBottomBar.width / widget.items.length));
    _numDifferenceBase = (_numPositionBase - (_numPositionBase / 2) + 2);
    setState(() {
      _positionLeftIndicatorDot = _numPositionBase - _numDifferenceBase;
    });
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
boxShadow: [
      BoxShadow(
        color: widget.backgroundShadowColor.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 4), // changes position of shadow
      ),
    ],

    ),
        padding: EdgeInsets.fromLTRB(widget.paddingL, widget.paddingT, widget.paddingR, widget.paddingB),
        child: Material(
          color: widget.backgroundColor,
            elevation: widget.materialElevation,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(widget.topLeft), topRight: Radius.circular(widget.topRight), bottomLeft: Radius.circular(widget.bottomLeft), bottomRight: Radius.circular(widget.bottomRight)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: widget.paddingV),
              child: Stack(
                key: _keyBottomBar,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: _createNavigationIconButtonList(widget.items.asMap())),
                  ),
                  AnimatedPositioned(
                      child: CircleAvatar(radius: 2.5, backgroundColor: _dotColor),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.fastLinearToSlowEaseIn,
                      left: _positionLeftIndicatorDot,
                      bottom: 0),
                ],
              ),
            )),
      );

  List<_NavigationIconButton> _createNavigationIconButtonList(Map<int, DotNavigationBarIteam> mapItem) {
    List<_NavigationIconButton> children = List<_NavigationIconButton>();
    mapItem.forEach((index, item) => children.add(_NavigationIconButton(item.icon, (index == _indexPageSelected) ? _activeColor : _color, item.onTap, () {
          _changeOptionBottomBar(index);
        })));
    return children;
  }

  void _changeOptionBottomBar(int indexPageSelected) {
    if (indexPageSelected != _indexPageSelected) {
      setState(() {
        _positionLeftIndicatorDot = (_numPositionBase * (indexPageSelected + 1)) - _numDifferenceBase;
      });
      _indexPageSelected = indexPageSelected;
    }
  }
}

class DotNavigationBarIteam {
  final IconData icon;
  final NavigationIconButtonTapCallback onTap;
  const DotNavigationBarIteam({@required this.icon, this.onTap}) : assert(icon != null);
}

typedef NavigationIconButtonTapCallback = void Function();

class _NavigationIconButton extends StatefulWidget {
  final IconData _icon;
  final Color _colorIcon;
  final NavigationIconButtonTapCallback _onTapInternalButton;
  final NavigationIconButtonTapCallback _onTapExternalButton;

  const _NavigationIconButton(this._icon, this._colorIcon, this._onTapInternalButton, this._onTapExternalButton, {Key key}) : super(key: key);

  @override
  _NavigationIconButtonState createState() => _NavigationIconButtonState();
}

class _NavigationIconButtonState extends State<_NavigationIconButton> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _scaleAnimation;
  double _opacityIcon = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.93).animate(_controller);
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTapDown: (_) {
        _controller.forward();
        setState(() {
          _opacityIcon = 0.7;
        });
      },
      onTapUp: (_) {
        _controller.reverse();
        setState(() {
          _opacityIcon = 1;
        });
      },
      onTapCancel: () {
        _controller.reverse();
        setState(() {
          _opacityIcon = 1;
        });
      },
      onTap: () {
        widget._onTapInternalButton();
        widget._onTapExternalButton();
      },
      child: ScaleTransition(
          scale: _scaleAnimation, child: AnimatedOpacity(opacity: _opacityIcon, duration: Duration(milliseconds: 200), child: Icon(widget._icon, color: widget._colorIcon))));
}

