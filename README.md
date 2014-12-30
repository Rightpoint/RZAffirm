RZAffirm
============

[![Build Status](https://travis-ci.org/Raizlabs/RZAffirm.svg)](https://travis-ci.org/Raizlabs/RZAffirm)
[![Version](https://img.shields.io/cocoapods/v/RZAffirm.svg?style=flat)](http://cocoadocs.org/docsets/RZAffirm)
[![License](https://img.shields.io/cocoapods/l/RZAffirm.svg?style=flat)](http://cocoadocs.org/docsets/RZAffirm)
[![Platform](https://img.shields.io/cocoapods/p/RZAffirm.svg?style=flat)](http://cocoadocs.org/docsets/RZAffirm)

`RZAffirm` adds ease of implementation and clarity of intent to your assertions. `RZAffirm` defines functions which - like comments - express intent, but never go out of date. `RRZAFFIRM_TRUE`, `RZAFFIRM_FALSE`, `RZAFFIRM_NOT_NIL`, and `RZAFFIRM_NONEMPTY_STRING` all do exactly what you think they do.

`RZAffirm` includes more exciting assertions that come in handy in a variety of contexts. For example:

You define a method on a class, but you want that method to ONLY be called by subclasses. Use `RZAFFIRM_SUBCLASSES_MUST_OVERRIDE` to throw an exception if the method is called from the class itself:

```swift
class RZSuperclass

func aMethodThatShouldBeCalledFromSubclassesOnly -> Void {
  RZAFFIRM_SUBCLASSES_MUST_OVERRIDE(self);
}
```

You define a switch statement with a case that should never occur. Use `RZAFFIRM_SHOULD_NEVER_GET_HERE` to throw an exception if your program passes the undesired case to the switch statement:

```swift
enum AwesomeMode {
    case AwesomeModeNotSet
    case AwesomeModeIsAwesome
}

func configureThingsForAwesomeMode(awesomeMode:AwesomeMode) -> Void {
    switch awesomeMode {
        case .AwesomeModeNotSet:
            RZAFFIRM_SHOULD_NEVER_GET_HERE(self)
            break
        case .AwesomeModeIsAwesome:
            break
    }
}
```

## Usage

A demo project is available in the `Example` directory. Open RZAffirm.xcodeproj and check out the demo!

## Installation

'RZAffirm' is now available through the dependency manager [CocoaPods](http://cocoapods.org). CocoaPods version 0.36.0 is required. At this moment this can be installed as a pre release by executing:

    `[sudo] gem install cocoapods --pre`

To install RZAffirm with CocoaPods 0.36.0, simply add the following line to your Podfile:

    pod RZAffirm, '~> 0.1'

Import RZAffirm at the top of your swift file by adding this code:

    `import RZAffirm`

## Authors

Michael Gorbach, michael.gorbach@raizlabs.com

Joe Howard, joe.howard@raizlabs.com

Matt Buckley, matt.buckley@raizlabs.com

## License

See the LICENSE file for more info.
