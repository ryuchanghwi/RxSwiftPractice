//: [Previous](@previous)

import Foundation
import UIKit
import RxSwift

let disposeBag = DisposeBag()

let subject = PublishSubject<String>()

subject.onNext("Issue 1")

subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 2")
subject.onNext("Issue 3")


//subject.dispose()
subject.onCompleted()

subject.onNext("Issue 4")

print("-----------")

//마지막 이벤트의 값이 저장된다. 최초 subscribe 시 이벤트가 바로 전달되어야 할 떄 사용하면 유리
let subject2 = BehaviorSubject(value: "Initial Value")

subject2.onNext("Last Issue")
subject2.onNext("Last Issue2")

subject2.subscribe { event in
    print(event)
}

subject2.onNext("Issue 1")
subject2.onNext("Issue 2")
