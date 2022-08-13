import UIKit
import RxSwift


//just 하나의 특정 요소로 관찰 가능 항목 생성
print("dd")
let observable = Observable.just(1)

//of 배열이나 다른 요소로 관찰 가능 항목 생성
let observable2 = Observable.of(1, 2, 3)

let observable3 = Observable.of([1, 2, 3])

let observable4 = Observable.from([1, 2, 3, 4, 5])

// of는 Observable<배열>을 만들고
// from은 배열의 각각 원소들을 Observable로 만든다.


//subscribe를 이용하면 값이나 변수에 접근할 수 있다.
observable4.subscribe { event in
    print(event)
}
