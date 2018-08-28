# Grand Central Dispatch
 **멀티 코어 프로세서 및 다중 처리 시스템이있는 시스템에 대한 응용 프로그램 지원을 최적화하기 위해 Apple 에서 개발 한 기술이다.<br>
   간단하게 말하면 멀티쓰레딩 처리를 위한 기술이라고 볼 수 있다.**
  

## Dispatch Queue
- **main : 메인 쓰레드에서 처리되는 serial 큐 이다.**<br>
사진과같이 serial 큐는 직렬적인 구조를 가지있으며 FIFO(First In First Out)로 테스크를 차례대로 처리한다.<br>
**모든 UI 관련된 부분은 메인쓰레드에서 처리한다**
<img width="500" alt="portfolio_view" src="https://github.com/jinlee1206/GCD/blob/master/resource/SerialQueue.jpg">
<br>

- **global : 전역 시스템에 공유되는 cocurrent 큐 이다.**<br>
사진과 같이 concurrent 큐는 병렬적인 구조를 가지고있으며 동시에 여럿의 테스크들을 처리한다.<br>
테스크 진행은 순서를 보장할순없지만 나가는 순서는 serial 큐와 마찬가지로 FIFO를 따른다.<br>
**각 큐마다 우선순위(Qos)를 지정해 줄 수 있다.**
<img width="500" alt="portfolio_view" src="https://github.com/jinlee1206/GCD/blob/master/resource/ConcurrentQueue.jpg">
<br>

- **custom : 개발자의 임의로 serial/cocurrent 을 정해서 사용 할 수 있다.**<br>


## Quality of Service
**특정작업을 멀티쓰레딩으로 병렬처리 하려고할때 global 큐를 쓰게 되는데 그때 해당 큐에 대한 우선순위를 지정해 줄 수 있다.<br>
  해당 큐의 중요도와 우선순위에 따라 6가지로 구분되지만 크게 4가지로 알아 보겠다.**
  
  - **userInteractive**<br>
  UI업데이트나 이벤트 처리 및 대기 시간이 적은 작은 작업에 사용된다.<br>
  global 큐지만 main 쓰레드에서 실행된다.
  
  - **userinitiated**<br>
  userInteractive 바로 다음순위로 UI에 관계된 업데이트가 되는 도중 유저의 행동이 블럭 당하지 않기 위해서 비동기 작업이 필요할때 사용된다.<br>
  
  - **utility**<br>
  프로그래바에 표시될 네트워킹,계산,I/O,데이터 피드등 에너지 효율적으로 설계 되었기 때문에 시간이 어느정도 필요한 곳에 사용된다.<br>
  
  - **background**<br>
  급하지도않고 유저와의 인터렉션이 필요하지 않으며 시간에 민감하지도 않은 우선순위가 제일낮은 Qos이다.<br>
  
  
## Synchronous & Asynchronous
- **synchronous**<br>
`DispatchQueue.main.sync(execute:() -> Void)`<br>
`DispatchQueue.global().async(execute:() -> Void)`<br>

- **Asynchronous**<br>
`DispatchQueue.main.sync(execute:() -> Void)`<br>
`DispatchQueue.global().async(execute:() -> Void)`<br>

- **Global Queue Qos**<br> 
`DispatchQueue.global(qos: .userInteractive).async { }`<br>

## block & non-block / Synchronous & Asynchronous
> 동기,비동기에 대해서 공부를 하다보면 블럭,논블럭에 대한 개념이 어김없이 등장한다.<br>
  조금 더 쉽게 다가가고자 정리를 한번해본다.(사실 다른 글을 찾아보면서도 아직까지도 굉장히 헷갈린다 -_-)<br>
  여러 문서들을 보면서 이해한 나의 글이기에 절대 확실하지는 않다...(1년차에게 무엇을바라리....)
  
1.block(블럭) & non-block(논블럭)<br>
**기술적으로 명확하게 구분 할 수 있으며 함수 호출에 대한 이야기다.**<br>
 - 블럭 : A라는 함수를 호출했을때 기대 했던 행위를 모두 마치고 나서 리턴한다면 `blocking`이되었다고 말 할 수있다.<br>
 - 논블럭 : A라는 함수를 호출했을때 기대 했던 행위와 관계없이 바로 리턴한다면 `non-blocking`되었다고 말 할 수 있다.<br>
  
2.Synchronous(동기) & Asynchronous(비동기)<br>
**추상적으로 구분 할 수 있으며 행위에 대한 이야기다.**<br>

- 동기(同期 = 같은시기) : 요청과 동시에 결과를 바로 받아 볼 수 있다. <br>
`어떤 객체 또는 함수 내부에서 다른 함수를 호출했을 때 이 함수의 결과를 호출한 쪽에서 처리하면 동기입니다.`
- 비동기(非同期 = 같은 시기가 아닌) : 요청과 결과값을 바로 받아 볼 수 없다. <br>
`어떤 객체 또는 함수 내부에서 다른 함수를 호출했을 때 이 함수의 결과를 호출한 쪽에서 처리하지 않으면 비동기입니다.`

각종 다양한 문서들을 보면서 정말 한번에 이해하기 쉬웠던 내용들이다.<br>
내가 사용하던 동기,비동기 방식에는 블럭,논블럭 개념이 기존에 깔려있었던것이다.(하지만 몰랐지......ㅎ)<br>
사실 내가 알던 동기,비동기의 개념은 블럭,논블럭 개념이었던것이다.<br>
지금에서야 다르다는 개념은 알았지만 아직도 조금 애매모한 감이 없지않아 존재한다.





















 



  








  
 
  
  
















