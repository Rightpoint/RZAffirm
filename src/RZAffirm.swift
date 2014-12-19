//
//  RZAssert.swift
//  Consonance
//
//  Created by Matthew Buckley on 12/13/14.
//  Copyright (c) 2014 MattBuckley. All rights reserved.
//

import Foundation

// MARK: Basic Assertions

/**
*  Raise an exception if object is not equal to nil. Return void.
*
*  @param object     An object instance to compare with nil.
*/

public func RZASSERT_NIL(object:AnyObject?) -> Void
{
    assert((object == nil), "**** Unexpected Nil Assertion **** \nExpected nil, but \(object) is not nil \nSelf: self")
}


/**
*  Raise an exception if object is equal to nil. Return void.
*
*  @param object     An object instance to compare with nil.
*/

public func RZASSERT_NOT_NIL(object:AnyObject?) -> Void
{
    assert((object != nil), "**** Unexpected Non-Nil Assertion **** \nExpected not nil, but \(object) is nil \nSelf: self")
}

/**
*  Raise an exception. Return void.
*/

public func RZASSERT_ALWAYS() -> Void
{
    assert(false, "**** Unexpected Assertion **** \nSelf: self")
}


/**
*  Raise an exception if object evaulates to 0. Return void.
*
*  @param object     An object instance to compare with 0.
*/

public func RZASSERT_TRUE(condition: @autoclosure () -> Bool) -> Void
{
    assert((condition() == true), "**** Unexpected Assertion **** \nSelf: self")
}


/**
*  Raise an exception if object evaluates to 1. Return void.
*
*  @param object     An object instance to compare with 1.
*/

public func RZASSERT_FALSE(condition: @autoclosure () -> Bool) -> Void
{
    assert((condition() == false), "**** Unexpected Assertion **** \nSelf: self")
}

/**
*  Raise an exception. Return void.
*
*  @param message     A printf-style format string that describes the failure condition.
*/

public func RZASSERT_WITH_MESSAGE(message:String, variadicArgs:AnyObject...) -> Void
{
    assert(false, "**** Unexpected Assertion **** \(variadicArgs) \nSelf: self")
}

public func RZASSERT_TRUE_WITH_MESSAGE(condition: @autoclosure () -> Bool, message:String, variadicArgs:AnyObject...) -> Void
{
    assert((condition() == true), "**** Unexpected Assertion **** \(message) \nSelf: self")
}

// String Assertions


/**
*  Raise an exception if x and y are not equal object pointers. Return void.
*
*  @param x     An NSString instance.
*  @param y     An NSString instance.
*/

public func RZASSERT_EQUAL_STRINGS(firstString:String, secondString:String) -> Void
{
    assert((firstString == secondString), "**** Strings Unexpectedly Unequal **** \nLeft: \(firstString)\nRight: \(secondString)")
}

/**
*  Raise an exception if string is @"". Return void.
*
*  @param string An NSString instance.
*/

public func RZASSERT_NONEMPTY_STRING(string:String?) -> Void
{
    assert((string != nil), "**** Unexpected Nil, Wrong Class, or Empty String **** \nReason: Expected non-empty string but got: \(string) \nSelf: self")
}


// Type Checks


/**
*  Raise an exception if object is not an instance of testClass. Return void.
*
*  @param object        An object instance.
*  @param testClass     A class.
*/

public func RZASSERT_KINDOF(object:AnyObject, testClass:AnyClass) -> Void
{
    assert((object.isKindOfClass(testClass)), "**** Object of Unexpected Class **** \nReason: Expected class: \(testClass) but got: \(object) of class \(object.self)")
}

/**
*  Raise an exception if object is not an instance of testClass, or is not nil.
*  Return void.
*
*  @param x     An object instance.
*  @param y     A class.
*/

public func RZASSERT_KINDOF_OR_NIL(object:AnyObject?, testClass:AnyClass) -> Void
{
    if ( object != nil ) {
        assert((object!.isKindOfClass(testClass)), "**** Object of Unexpected Class and Not Nil **** \nReason: Expected class: \(testClass) or nil but got: \(object) of class \(object.self)")
    } else {
        assert((object == nil), "**** Object of Unexpected Class and Not Nil **** \nReason: Expected class: \(testClass) or nil but got: \(object) of class \(object.self)")
    }
}

/**
*  Raise an exception if object's class does not conform to protocol. Return void.
*
*  @param object        An object instance.
*  @param protocol      A protocol of the form @protocol(foo).
*/

public func RZASSERT_CONFORMS_PROTOCOL(object:AnyObject?, testProtocol:Protocol) -> Void
{
    assert(object!.conformsToProtocol(testProtocol), "**** Object Unexpectedly Doesn't Conform to Protocol **** \nReason: Expected object: \(object) of class \(object.self) to conform to protocol \(testProtocol), but it does not.")
}


/**
*  Raise an exception if object is not a subclass of testClass, or is not nil.
*  Return void.
*
*  @param subclass        A class.
*  @param parentClass     A class.
*/

public func RZASSERT_CLASS_SUBCLASS_OF_CLASS(subclass:AnyClass, parentClass:AnyClass) -> Void
{
    assert(subclass.isSubclassOfClass(parentClass), "**** Bad Subclass Relationship **** \nReason: Expected class: \(subclass) to be a subclass of class: \(parentClass), but it is not.")
}


// Overrides


/**
*  Raise an exception. Return void.
*
* Place RZASSERT_SUBCLASSES_MUST_OVERRIDE in a superclass method that would
* otherwise be left empty
*/

public func RZASSERT_SUBCLASSES_MUST_OVERRIDE(object:AnyObject!) -> Void
{
    assert(false, "**** Subclass Responsibility Assertion **** \nReason: Subclasses of \(object.self) MUST override this method: \(__FUNCTION__)\n")
}


// Should-never-get-here

/**
*  Raise an exception. Return void.
*
*/

public func RZASSERT_SHOULD_NEVER_GET_HERE(object:AnyObject) -> Void
{
    assert(false, "**** Assertion: Should Never Get Here **** \n__FUNCTION: \(__FUNCTION__) ")
}
