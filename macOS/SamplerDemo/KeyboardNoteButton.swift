//
//  KeyboardNoteButton.swift
//  SamplerDemo
//
//  Created by Boris Triebel on 23.09.18.
//  Copyright © 2018 AudioKit. All rights reserved.
//

import Cocoa

/// A regular NSButton with a simple extension to handle mouse-up events.
///
/// See the documentation for `mouseDown(_:)` for more information.
///
class KeyboardNoteButton: NSButton {

    /// Custom flag whether the button is currently pressed.
    ///
    /// This flag is true if there was a mouseDown and no mouseUp yet.
    ///
    var isPressed: Bool = false

    /// Our custom behaviour for mouseDown & mouseUp
    ///
    /// Mouse-down starts our custom run-loop where we wait for mouse-up.
    /// This updates our custom property `isPressed` and sends TWO `actions`
    /// to the `target`. The first one at mouse-down, the secondat mouse-up.
    /// The `target` can check `isPressed` to determine which one it is.
    ///
    /// Unfortunately NSButton does not provide a better built-in mechanism.
    ///
    override func mouseDown(with event: NSEvent) {

        isPressed = true
        isHighlighted = true

        // mouse down triggers action for the first time
        let _ = target?.perform(self.action, with: self)


        var isRunLoopActive = true
        while isRunLoopActive {

            guard let theWindow = window
                else { fatalError("This should never happen!") }

            let dragUpEventMask: NSEvent.EventTypeMask = [
                .leftMouseUp, .leftMouseDragged]

            if let event = theWindow.nextEvent( matching: dragUpEventMask) {

                switch event.type {
                case .leftMouseDragged:
                    // we intentionally keep the button visually highlighted
                    // while the mouse pointer is before mouseUp
                    break
                case .leftMouseUp:
                    isHighlighted = false
                    isPressed = false
                    // mouse up triggers action for the second time
                    // we do this regardless of mouse pointer inside/outside
                    let _ = target?.perform(self.action, with: self)
                    isRunLoopActive = false
                default: break
                }
            }
        }
    }
}
