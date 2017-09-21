- [Zone in Angular](https://blog.thoughtram.io/angular/2016/02/01/zones-in-angular-2.html)


### Notes:
- Angular change detection may cause updating DOM by following:
+ Events - User events like click, change, input, submit,...
+ XMLHttpRequests - E.g. when fetching data from a remote service
+ Timers - setTimeout(), setInterval(), because JavaScript
- run out side the zone: using `zone.runOutsideAngular()`. Dom will not be updated until we can `zone.run`
```typescript
@Component({
})
class ProgressBar {
  progress: number = 0;
  constructor(private zone: NgZone) {}

  processOutsideAngularZone() {
    this.progress = 0;
    this.zone.runOutsideAngular(() => {
      this.increaseProgress(() => {
        this.zone.run(() => {
          console.log('Outside Done!');
        });
      });
    });
  }
}
```
