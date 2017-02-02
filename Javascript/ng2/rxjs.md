* [RxJS](https://github.com/Reactive-Extensions/RxJS) is a third party library, endorsed by Angular, that implements the asynchronous observable pattern.
* [Which Operator to Use](https://github.com/Reactive-Extensions/RxJS/blob/master/doc/gettingstarted/which-static.md)
* [The introduction to Reactive Programming you've been missing](https://gist.github.com/staltz/868e7e9bc2a7b8c1f754)
* [Subject](#subject)



### Subject
- The Subject class inherits both `Observable` and `Observer`, in the sense that it is both an __observer__ and an __observable__.
- Document [here](https://github.com/Reactive-Extensions/RxJS/blob/master/doc/gettingstarted/subjects.md)
- Examples:
```Javascript
  let aSubject = new Subject()  
  aSubject.subscribe(
    (x) => {
      console.info("Next:" + x.toString());
    },
    (err) =>{ console.info(err)},    
    () => {console.info("complete")}
  )

  aSubject.next(12)
  //=>  Next: 12

  aSubject.dispose() // Unsubscribe all observers and release resources.

  let source = Observable.interval(1000); //create a source sequence which produces an integer every 1 second
  let subject = new Subject(); // create a subject
  let subSource = source.subscribe(subject); //pass it as an observer to the source so that it will receive all the values pushed out by this source sequence

  // we create another subscriptions with subject as a source
  let subSubject = subject.subscribe(
      (x) => { console.log('Value published to observer: ' + x); },
      (e) => { console.log('onError: ' + e.message); },
      ()  => { console.log('onCompleted'); });

  //  Clean up an release resource
  setTimeout( () => {        
        subject.completed();
        subSubject.dispose();        
   }, 5000);      
   // => Value published to observer: 0   
   // => Value published to observer: 1   
   // => Value published to observer: 2   
   // => Value published to observer: 3   
   // => onCompleted
   // => onCompleted
  ```
  - Other type of Subject:
    + [`ReplaySubject`](https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/subjects/replaysubject.md) : stores all the values that it has published. Therefore, when you subscribe to it, you automatically receive an entire history of values that it has published, even though your subscription might have come in after certain values have been pushed out.
    + [`BehaviorSubject`](https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/subjects/behaviorsubject.md): is similar to `ReplaySubject`, except that it only stored the last value it published. `BehaviourSubject` also requires a default value upon initialization.
    +  [`AsyncSubject`](https://github.com/Reactive-Extensions/RxJS/blob/master/doc/api/subjects/asyncsubject.md) is similar to the `Replay` and `Behavior` subjects, however it will only store the last value, and only publish it when the sequence is completed.
