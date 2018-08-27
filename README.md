# Grand Central Dispatch
> 멀티 코어 프로세서 및 다중 처리 시스템이있는 시스템에 대한 응용 프로그램 지원을 최적화하기 위해 Apple 에서 개발 한 기술이다.<br>
  간단하게 말하면 멀티쓰레딩 처리를 위한 기술이라고 볼 수 있다.
  

# Dispatch Queue
> Queue 종류
- main : 메인 쓰레드에서 처리되는 serial 큐 이다.<br>
사진과같이 serial 큐는 직렬적인 구조를 가지있으며 FIFO(First In First Out)로 테스크를 차례대로 처리한다.<br>
**모든 UI 관련된 부분은 메인쓰레드에서 처리한다**
<img width="500" alt="portfolio_view" src="https://github.com/jinlee1206/GCD/blob/master/resource/SerialQueue.jpg">
<br>

- global : 전역 시스템에 공유되는 cocurrent 큐 이다.<br>
사진과 같이 concurrent 큐는 병렬적인 구조를 가지고있으며 동시에 여럿의 테스크들을 처리한다.<br>
테스크 진행은 순서를 보장할순없지만 나가는 순서는 serial 큐와 마찬가지로 FIFO를 따른다.<br>
**각 큐마다 우선순위(Qos)를 지정해 줄 수 있다.**
<img width="500" alt="portfolio_view" src="https://github.com/jinlee1206/GCD/blob/master/resource/ConcurrentQueue.jpg">
<br>

- custom : 개발자의 임의로 serial/cocurrent 을 정해서 사용 할 수 있다.<br>


# Quality of Service
> 특정작업을 멀티쓰레딩으로 병렬처리 하려고할때 global 큐를 쓰게 되는데 그때 해당 큐에 대한 우선순위를 지정해 줄 수 있다.<br>
  해당 큐의 중요도와 우선순위에 따라 6가지로 구분되지만 크게 4가지로 알아 보겠다.
  
  - userInteractive<br>
  UI업데이트나 이벤트 처리 및 대기 시간이 적은 작은 작업에 사용된다.<br>
  global 큐지만 main 쓰레드에서 실행된다.
  
  - userinitiated<br>
  userInteractive 바로 다음순위로 UI에 관계된 업데이트가 되는 도중 유저의 행동이 블럭 당하지 않기 위해서 비동기 작업이 필요할때 사용된다.<br>
  
  - utility<br>
  프로그래바에 표시될 네트워킹,계산,I/O,데이터 피드등 에너지 효율적으로 설계 되었기 때문에 시간이 어느정도 필요한 곳에 사용된다.<br>
  
  - background<br>
  급하지도않고 유저와의 인터렉션이 필요하지 않으며 시간에 민감하지도 않은 우선순위가 제일낮은 Qos이다.<br>
  
  
# Synchronous & Asynchronous
`간단하게 얘기하면 테스크 처리가 다끝날때까지 기다리느냐(Synchronous) 아니면 테스크를 지시만 해놓고 다른 일을 하러 가느냐 차이(Asynchronous)`
  








  
 
  
  
















