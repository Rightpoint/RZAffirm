RZAffirm
============

[![Build Status](https://travis-ci.org/Raizlabs/RZAffirm.svg)](https://travis-ci.org/Raizlabs/RZAffirm)

`RZAFFIRM` adds ease of implementation and clarity of intent to your assertions. `RZAFFIRM` defines functions which - like comments - express intent, but never go out of date. `RRZAFFIRM_TRUE`, `RZAFFIRM_FALSE`, `RZAFFIRM_NOT_NIL`, and `RZAFFIRM_NONEMPTY_STRING` all do exactly what you think they do.

`RZAFFIRM` includes more exciting assertions that come in handy in a variety of contexts. For example:

You define a method on a class, but you want that method to ONLY be called by subclasses. Use `RZAFFIRM_SUBCLASSES_MUST_OVERRIDE` to throw an exception if the method is called from the class itself:

```
class RZSuperclass

func aMethodThatShouldBeCalledFromSubclassesOnly -> Void {
  RZAFFIRM_SUBCLASSES_MUST_OVERRIDE;
}
```

You define a switch statement with a case that should never occur. Use `RZAFFIRM_SHOULD_NEVER_GET_HERE` to throw an exception if your program passes the undesired case to the switch statement:
```
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

You define a method which takes a class instance as one of its arguments, and you want to confirm that the instance conforms to a specific protocol. You use `RZAFFIRM_CONFORMS_PROTOCOL` to throw an exception if the program passes a nonconformant instance to the method:

```
func configureThingsForDictionary(awesomeViewController:RZAwesomeViewController) -> Void {
  RZAFFIRM_CONFORMS_PROTOCOL(self, protocol(RZAwesomeDelegate))
}
```

## Usage

A demo project is available in the `Example` directory. Open RZAffirm.xcodeproj and check out the demo!

## Installation

CocoaPods does not currently support swift libraries. For this reason, `RZAFFIRM` must be installed manually. Simply copy/add the contents of Classes/ into your project to get started.

## Authors

Michael Gorbach, michael.gorbach@raizlabs.com

Joe Howard, joe.howard@raizlabs.com

Matt Buckley, matt.buckley@raizlabs.com

## License

See the LICENSE file for more info.
