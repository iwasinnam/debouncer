//
//  Debounced.swift
//  Wristcam
//
//  Created by Ariel Steiner on 03/09/2021.
//  Copyright © 2021. All rights reserved.
//

import Foundation

@dynamicCallable
class Debounced {
    let function: () -> ()
    let interval: TimeInterval
    private var timer: DispatchSourceTimer?
    private var debounced = false
    private let queue : DispatchQueue
    init(interval: TimeInterval, queue: DispatchQueue = DispatchQueue.main, function: @escaping () -> ()) {
        self.function = function
        self.interval = interval
        self.queue = queue
    }
    func dynamicallyCall(withArguments args: [Void]) {
        assert(args.count == 0, "Don't pass any arguments to the debounced method")
        if timer != nil {
            debounced = true
            return
        }
        let timer = DispatchSource.makeTimerSource(queue: self.queue)
        timer.schedule(deadline: .now() + interval)
        timer.setEventHandler { [weak self] in
            guard let self = self else { return }
            self.timer = nil
            if self.debounced == true {
                self.debounced = false
                self()
            }
        }
        self.timer = timer
        timer.resume()
        self.function()
    }
}
