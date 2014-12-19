//
//  RZAffirm.swift
//  RZAffirm.swift
//
//  Created by Matthew Buckley on 12/13/14.
//  Copyright (c) 2014 MattBuckley. All rights reserved.
//  http://raizlabs.com/
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import Foundation

// MARK: Basic Assertions

/**
*  Raise an exception if object is not equal to nil. Return void.
*
*  @param object     An object instance to compare with nil.
*/

public func RZAFFIRM_NIL(object: AnyObject?, file: StaticString = __FILE__, line: UWord = __LINE__) -> Void {
    assert((object == nil), "**** Unexpected Nil Assertion **** \nExpected nil, but \(object) is not nil", file: file, line: line)
}


/**
*  Raise an exception if object is equal to nil. Return void.
*
*  @param object     An object instance to compare with nil.
*/

public func RZAFFIRM_NOT_NIL(object: AnyObject?, file: StaticString = __FILE__, line: UWord = __LINE__) -> Void {
    assert((object != nil), "**** Unexpected Non-Nil Assertion **** \nExpected not nil, but \(object) is nil", file: file, line: line)
}

/**
*  Raise an exception. Return void.
*/

public func RZAFFIRM_ALWAYS(file: StaticString = __FILE__, line: UWord = __LINE__) -> Void {
    assert(false, "**** Unexpected Assertion ****")
}


/**
*  Raise an exception if object evaulates to 0. Return void.
*
*  @param object     An object instance to compare with 0.
*/

public func RZAFFIRM_TRUE(condition: @autoclosure () -> Bool, file: StaticString = __FILE__, line: UWord = __LINE__) -> Void {
    assert((condition() == true), "**** Unexpected Assertion ****", file: file, line: line)
}


/**
*  Raise an exception if object evaluates to 1. Return void.
*
*  @param object     An object instance to compare with 1.
*/

public func RZAFFIRM_FALSE(condition: @autoclosure () -> Bool, file: StaticString = __FILE__, line: UWord = __LINE__) -> Void {
    assert((condition() == false), "**** Unexpected Assertion ****", file: file, line: line)
}

/**
*  Raise an exception. Return void.
*
*  @param message     A printf-style format string that describes the failure condition.
*/

public func RZAFFIRM_WITH_MESSAGE(message: String, file: StaticString = __FILE__, line: UWord = __LINE__, variadicArgs:AnyObject...) -> Void {
    assert(false, "**** Unexpected Assertion **** \(variadicArgs)", file: file, line: line)
}


// String Assertions


/**
*  Raise an exception if x and y are not equal object pointers. Return void.
*
*  @param x     An NSString instance.
*  @param y     An NSString instance.
*/

public func RZAFFIRM_EQUAL_STRINGS(firstString: String, secondString:String, file: StaticString = __FILE__, line: UWord = __LINE__) -> Void {
    assert((firstString == secondString), "**** Strings Unexpectedly Unequal **** \nLeft: \(firstString)\nRight: \(secondString)", file: file, line: line)
}

/**
*  Raise an exception if string is @"". Return void.
*
*  @param string An NSString instance.
*/

public func RZAFFIRM_NONEMPTY_STRING(string: String?, file: StaticString = __FILE__, line: UWord = __LINE__) -> Void {
    assert((string != nil), "**** Unexpected Nil, Wrong Class, or Empty String **** \nReason: Expected non-empty string but got: \(string)", file: file, line: line)
}


// Type Checks


/**
*  Raise an exception if object is not an instance of testClass. Return void.
*
*  @param object        An object instance.
*  @param testClass     A class.
*/

public func RZAFFIRM_KINDOF(object: AnyObject, testClass:AnyClass, file: StaticString = __FILE__, line: UWord = __LINE__) -> Void {
    assert((object.isKindOfClass(testClass)), "**** Object of Unexpected Class **** \nReason: Expected class: \(testClass) but got: \(object) of class \(object.self)", file: file, line: line)
}

/**
*  Raise an exception if object is not an instance of testClass, or is not nil.
*  Return void.
*
*  @param x     An object instance.
*  @param y     A class.
*/

public func RZAFFIRM_KINDOF_OR_NIL(object: AnyObject?, testClass:AnyClass, file: StaticString = __FILE__, line: UWord = __LINE__) -> Void {
    if ( object != nil ) {
        assert((object!.isKindOfClass(testClass)), "**** Object of Unexpected Class and Not Nil **** \nReason: Expected class: \(testClass) or nil but got: \(object) of class \(object.self)", file: file, line: line)
    } else {
        assert((object == nil), "**** Object of Unexpected Class and Not Nil **** \nReason: Expected class: \(testClass) or nil but got: \(object) of class \(object.self)", file: file, line: line)
    }
}

/**
*  Raise an exception if object is not a subclass of testClass, or is not nil.
*  Return void.
*
*  @param subclass        A class.
*  @param parentClass     A class.
*/

public func RZAFFIRM_CLASS_SUBCLASS_OF_CLASS(subclass: AnyClass, parentClass: AnyClass, file: StaticString = __FILE__, line: UWord = __LINE__) -> Void {
    assert(subclass.isSubclassOfClass(parentClass), "**** Bad Subclass Relationship **** \nReason: Expected class: \(subclass) to be a subclass of class: \(parentClass), but it is not.", file: file, line: line)
}


// Overrides


/**
*  Raise an exception. Return void.
*
* Place RZAFFIRM_SUBCLASSES_MUST_OVERRIDE in a superclass method that would
* otherwise be left empty
*/

public func RZAFFIRM_SUBCLASSES_MUST_OVERRIDE(object: AnyObject!, file: StaticString = __FILE__, line: UWord = __LINE__) -> Void {
    assert(false, "**** Subclass Responsibility Assertion **** \nReason: Subclasses of \(object.self) MUST override this method: \(__FUNCTION__)\n", file: file, line: line)
}


// Should-never-get-here

/**
*  Raise an exception. Return void.
*
*/

public func RZAFFIRM_SHOULD_NEVER_GET_HERE(file: StaticString = __FILE__, line: UWord = __LINE__) -> Void {
    assert(false, "**** Assertion: Should Never Get Here **** \n__FUNCTION: \(__FUNCTION__) ", file: file, line: line)
}
