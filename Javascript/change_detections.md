#### Articles
- [Change And Its Detection In JavaScript Frameworks](http://teropa.info/blog/2015/03/02/change-and-its-detection-in-javascript-frameworks.html)
- [Change Detection in Angular](https://vsavkin.com/change-detection-in-angular-2-4f216b855d4c)


1. [Ember](#ember)
2. [Angular](#angular)
3. [React](#react)

*Notes*:

  - *Ember*: Data binding
  - *Angular*: Dirty checking
  - *React*: Virtual DOM

#### Summary
- The first generations of JavaScript frameworks, like Backbone.js, Ext JS, and Dojo gave you the architecture for separating your UI code from your models, they still left the synchronization between the two up to you. You can get some sort of events when changes occur, but it is your responsibility to figure out what to re-render and how to go about it.

##### <a name="ember"></a>Ember - Data binding
- Ember, just like Backbone, sends out events from the data model when changes occur. But you can bind the UI to the data model, which means that there is a listener for update events attached to the UI.
- The big tradeoff of this approach is that Ember must always be aware of changes that occur in the data model


##### <a name="angular"></a>Angular - Dirty checking
- The change detection system propagates bindings from the root to leaves.
- When you refer to your data in an Angular template, for example in an expression like `{{foo.x}}`, Angular not only renders that data but also creates a watcher for that particular value. After that, whenever anything happens in your app, Angular checks if the value in that watcher has changed from the last time. If it has, it re-renders the value in the UI. The process of running these watchers is called dirty checking.
- The downside is that as the data model now doesn't have any built-in probes that would tell the framework about changes. That means the model needs to be inspected for changes externally: All watchers are run every time anything happens. Click handlers, HTTP response processors, and timeouts all trigger a digest, which is the process responsible for running watchers.
- Running all watchers all the time sounds like a performance nightmare, but it can be surprisingly fast. This is mostly because there's usually no DOM access happening until a change is actually detected, and pure JavaScript reference equality checks are cheap.
- Angular will also benefit from upcoming standards: In particular, the Object.observe feature in ECMAScript 7 will be a good fit for Angular, as it gives you a native API for watching an object's properties for changes. It will not cover all the cases that Angular needs to support though, as Angular's watchers can do much more than just observe simple object attributes.
- Every component gets a change detector responsible for checking the bindings defined in its template.
- By default the change detection goes through every node of the tree to see if it changed, and it does it on every browser event.
- The Angular 2 change detection system can go through hundreds of thousands of simple checks (the number are platform dependent) in a few milliseconds
- Angular has to be conservative and run all the checks every single time because the JavaScript language does not give us object mutation guarantees. But we may know that certain properties hold if we, for example, use immutable or observable objects
- We can skip the component’s subtree in the change detection tree by using `ChangeDetectionStrategy.OnPush` - it restricts when Angular has to check for updates from **any time something might change** to **only when this component’s inputs have changed**
- **If a component depends only on its input properties, and they are observable, then this component can change if and only if one of its input properties emits an event.**




##### <a name="react"></a>React - Virtual DOM (with diffing algorithm)
- What React does is effectively take us back to the good old server-side rendering days, when we simply didn't care about state changes: It renders the whole UI from scratch every time there may have been a change somewhere in it.
- When a React UI is rendered, it is first rendered into a virtual DOM, which is not an actual DOM object graph, but a light-weight, pure JavaScript data structure of plain objects and arrays that represents a real DOM object graph. A separate process then takes that virtual DOM structure and creates the corresponding real DOM elements that are shown on the screen.Then, when a change occurs, a new virtual DOM is created from scratch. That new virtual DOM will reflect the new state of the data model. React now has two virtual DOM data structures at hand: The new one and the old one. It then runs a diffing algorithm on the two virtual DOMs, to get the set of changes between them. Those changes, and only those changes, are applied to the real DOM: This element was added, this attribute's value changed, etc.
