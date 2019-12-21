import 'package:flutter/material.dart';

const MaterialColor whiteSwatch = const MaterialColor(
	0xFFFFFFFF,
	const <int, Color>{
		50: const Color(0xFFFFFFFF),
		100: const Color(0xFFFFFFFF),
		200: const Color(0xFFFFFFFF),
		300: const Color(0xFFFFFFFF),
		400: const Color(0xFFFFFFFF),
		500: const Color(0xFFFFFFFF),
		600: const Color(0xFFFFFFFF),
		700: const Color(0xFFFFFFFF),
		800: const Color(0xFFFFFFFF),
		900: const Color(0xFFFFFFFF),
	},
);

const spiderman_subtitle = "Bitten by a radioactive spider, Peter Parker’s arachnid abilities give him amazing powers he uses to help others, while his personal life continues to offer plenty of obstacles.";
const ironman_subtitle = "Genius. Billionaire. Playboy. Philanthropist. Tony Stark's confidence is only matched by his high-flying abilities as the hero called Iron Man.";
const cap_subtitle = "Recipient of the Super-Soldier serum, World War II hero Steve Rogers fights for American ideals as one of the world’s mightiest heroes and the leader of the Avengers.";

class FadePageRoute<T> extends PageRoute<T> {
	FadePageRoute({
		@required this.builder,
		RouteSettings settings,
		this.maintainState = true,
		bool fullscreenDialog = false,
	})  : assert(builder != null),
				assert(maintainState != null),
				assert(fullscreenDialog != null),
				assert(opaque),
				super(settings: settings, fullscreenDialog: fullscreenDialog);

	/// Builds the primary contents of the route.
	final WidgetBuilder builder;

	@override
	final bool maintainState;

	@override
	Duration get transitionDuration => const Duration(milliseconds: 400);

	@override
	Color get barrierColor => null;

	@override
	String get barrierLabel => null;

	@override
	bool canTransitionFrom(TransitionRoute<dynamic> previousRoute) {
		return previousRoute is FadePageRoute;
	}

	@override
	bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
		// Don't perform outgoing animation if the next route is a fullscreen dialog.
		return (nextRoute is FadePageRoute && !nextRoute.fullscreenDialog);
	}

	@override
	Widget buildPage(
			BuildContext context,
			Animation<double> animation,
			Animation<double> secondaryAnimation,
			) {
		final Widget result = builder(context);
		assert(() {
			if (result == null) {
				throw FlutterError(
						'The builder for route "${settings.name}" returned null.\n'
								'Route builders must never return null.');
			}
			return true;
		}());
		return Semantics(
			scopesRoute: true,
			explicitChildNodes: true,
			child: result,
		);
	}

	@override
	Widget buildTransitions(BuildContext context, Animation<double> animation,
			Animation<double> secondaryAnimation, Widget child) {
		return _FadeInPageTransition(routeAnimation: animation, child: child);
	}

	@override
	String get debugLabel => '${super.debugLabel}(${settings.name})';
}

class _FadeInPageTransition extends StatelessWidget {
	_FadeInPageTransition({
		Key key,
		@required
		Animation<double>
		routeAnimation, // The route's linear 0.0 - 1.0 animation.
		@required this.child,
	})  : _opacityAnimation = routeAnimation.drive(_easeInTween),
				super(key: key);

	// Fractional offset from 1/4 screen below the top to fully on screen.
	static final Tween<Offset> _bottomUpTween = Tween<Offset>(
		begin: const Offset(0.0, 0.25),
		end: Offset.zero,
	);
	static final Animatable<double> _fastOutSlowInTween =
	CurveTween(curve: Curves.fastOutSlowIn);
	static final Animatable<double> _easeInTween =
	CurveTween(curve: Curves.easeIn);

	final Animation<double> _opacityAnimation;
	final Widget child;

	@override
	Widget build(BuildContext context) {
		return FadeTransition(
			opacity: _opacityAnimation,
			child: child,
		);
	}
}