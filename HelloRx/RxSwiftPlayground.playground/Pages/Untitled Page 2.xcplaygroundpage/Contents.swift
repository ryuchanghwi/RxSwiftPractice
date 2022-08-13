//: [Previous](@previous)

import Foundation
import UIKit
import RxSwift


//just 하나의 특정 요소로 관찰 가능 항목 생성
let observable = Observable.just(1)

//of 배열이나 다른 요소로 관찰 가능 항목 생성
let observable2 = Observable.of(1, 2, 3)

let observable3 = Observable.of([1, 2, 3])

let observable4 = Observable.from([1, 2, 3, 4, 5])

// of는 Observable<배열>을 만들고
// from은 배열의 각각 원소들을 Observable로 만든다.


//subscribe를 이용하면 값이나 변수에 접근할 수 있다.
observable4.subscribe { event in
//    print(event)
//    print(event.element)
//    next(1)
//    next(2)
//    next(3)
//    next(4)
//    next(5)
//    completed
}


observable4.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

observable3.subscribe { event in
    if let element = event.element {
        print(element)
    }
}


//onNext를 이용하면 옵저버바인딩 처리를 할 필요가 없어짐

let subscription4 = observable4.subscribe(onNext: { element in
    print(element)
})


//메모리릭을 방지하기 위해서 dispose를 사용해야 한다.
subscription4.dispose()

//하지만 dispose 시점이나 잊을 위험이 있다.

let disposeBag = DisposeBag()

Observable.of("A", "B", "C")
    .subscribe {
        print($0)
    }.disposed(by: disposeBag)


//create를 이용해서 구독 만들기
 
Observable<String>.create { observer in
    observer.onNext("A")
    observer.onCompleted()
    observer.onNext("?")
    return Disposables.create()
}.subscribe(onNext: { print($0) }, onError: { print($0) } , onCompleted: { print("completed")} , onDisposed: { print("disposed") })
    .disposed(by: disposeBag)
