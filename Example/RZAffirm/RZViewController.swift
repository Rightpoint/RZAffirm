//
//  RZViewController.swift
//  RZAffirm
//
//  Created by Joe Howard on 12/19/14.
//  Copyright (c) 2014 Raizlabs. All rights reserved.
//

import UIKit

class RZViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        assertTrue()
        
        assertFalse()
        
        assertNil()
        
        let x: Int? = 0
        assertNotNil(x)
        
        let rzViewControllerSubclass = RZViewControllerSubclass()
        assertSubclass(rzViewControllerSubclass)
        
    }
    
    // MARK: RZAFFIRM_TRUE
    
    func assertTrue() {
        RZAFFIRM_TRUE(true)
    }

    // MARK: RZASSERT_FALSE
    func assertFalse() {
        RZAFFIRM_FALSE(false);
    }
    
    // MARK: RZASSERT_NIL
    
    func assertNil() {
        RZAFFIRM_NIL(nil);
    }
    
    func assertSubclass(object: AnyObject) {
        RZAFFIRM_KINDOF(object, self.classForCoder)
    }
    
    // MARK: RZASSERT_NOT_NIL
    
    func assertNotNil(object: AnyObject?) {
        RZAFFIRM_NOT_NIL(object);
    }

    // MARK: Actions
    
    @IBAction func throwRZAffirmTrue(sender: AnyObject) {
        RZAFFIRM_TRUE(false)
    }
    
    @IBAction func throwRZAffirmFalse(sender: AnyObject) {
        RZAFFIRM_FALSE(true)
    }
    
    @IBAction func throwRZAffirmNil(sender: AnyObject) {
        RZAFFIRM_NIL(0)
    }
    
    @IBAction func throwRZAffirmNotNil(sender: AnyObject) {
        RZAFFIRM_NOT_NIL(nil)
    }
    
    @IBAction func throwRZAffirmNonEmptyString(sender: AnyObject) {
        RZAFFIRM_NONEMPTY_STRING("")
    }
    
    @IBAction func throwRZAffirmNonSubclassesMustOverride(sender: AnyObject) {
        RZAFFIRM_SUBCLASSES_MUST_OVERRIDE(self)
    }
    
    @IBAction func throwRZAffirmShouldNeverGetHere(sender: AnyObject) {
        RZAFFIRM_SHOULD_NEVER_GET_HERE()
    }
}

