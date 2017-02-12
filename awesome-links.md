- Public API - A curated list of APIs from round the web.
  + https://github.com/abhishekbanthia/Public-APIs
  + https://apis.guru/browse-apis/
- [List of awesome links](https://github.com/sindresorhus/awesome)
- [Microservices](#microservices)
  + [Optimizing the Netflix API](http://techblog.netflix.com/2013/01/optimizing-netflix-api.html)
  + [Elixir in times of microservices - Jose Valim](http://blog.plataformatec.com.br/2015/06/elixir-in-times-of-microservices/)
  + [MicroservicePremium - Martin Fowler](https://martinfowler.com/bliki/MicroservicePremium.html)
- Elixir
  + [How I start Elixir with Jose Valim](http://howistart.org/posts/elixir/1)
- Reviews
  + [Clojure vs Elixir vs Go](https://smashingboxes.com/blog/choosing-your-future-tech-stack-clojure-vs-elixir-vs-go/)
- [Google Open Source projects](https://developers.google.com/open-source/projects)
- [Entrepreneur](#entrepreneur)
  + [How To Develop An Entrepreneur Mindset](https://medium.com/the-mission/how-to-develop-an-entrepreneur-mindset-949004ad71b3#.dxqun3r6v)
- CSS Tips
  + [CSS Protips](https://github.com/AllThingsSmitty/css-protips)
- Interview Question
  + Javascript
    + https://github.com/kennymkchan/interview-questions-in-javascript
  + Front-end Developer
    + https://github.com/h5bp/Front-end-Developer-Interview-Questions
----

# Microservices

### Optimizing the Netflix API
- [Link] http://techblog.netflix.com/2013/01/optimizing-netflix-api.html
- Notes:

  Optimize from:
  ![Optimize from](http://4.bp.blogspot.com/-ZRFQ9JX7mXk/UO4HuVD-m5I/AAAAAAAAAgM/4BBG936izL0/s1600/request-multi_1252.png)
  **To**
  ![Optimize To](http://2.bp.blogspot.com/-8p4--m73yYc/UO4HsUo8HDI/AAAAAAAAAgE/0hRXr-lL6c4/s1600/request-single_1252.png)

  + discrete requests, collapsed into a single request optimized for a given client.
  + The benefit is: client request to server-size with only one request. so the latency of wan will be reduce. (request will to between servers) - talking between server is low latency than client to each servers.

  + **Architecture**
    + dynamic polyglot runtime
    + fully asynchronous service layer
    + Reactive programming model

  + Using multithread to isolate dependencies => asynchronous requests then complete together via reactive framework.
  + API Service Layer abstract away all backend service and dependencies behind facades. This allows us to change underlying implementations and architecture with no or limited impact on the code that depends on the API.
  + The API Service Layer ensures that object models and other such tight-couplings are abstracted and not allowed to “leak” into the endpoint code.

### Elixir in times of microservices
- prematurely adopting microservices often negatively impacts the team’s productivity. Therefore, it is also important for languages and frameworks to provide proper abstractions for handling code complexity as the codebase grows.
- The Erlang VM and its standard library were designed by Ericsson in the 80’s for building distributed telecommunication systems.
- when building distributed system, you need to chose a communication protocol. There are many options. Unfortunately, a lot of developers choose HTTP and JSON, which is very verbose and expensive combination for performing what ends up becoming RPC calls.
- With Elixir, you already have a communication protocol and a serialization mechanism out of the box via Distributed Erlang
- Elixir processes communicate with each other via message passing, the runtime provides a feature called location transparency. This means it doesn’t really matter if two processes are in the same node or in different ones, they are still able to exchange messages.

### MicroservicePremium - Martin Fowler
- _This article talk about when we should chose monolith or microservices architecture._
- The microservices approach is all about handling a complex system, but in order to do so the approach introduces its own set of complexities. When you use microservices you have to work on automated deployment, monitoring, dealing with failure, eventual consistency, and other factors that a distributed system introduces.
![](https://martinfowler.com/bliki/images/microservice-verdict/productivity.png)
- **don't even consider microservices unless you have a system that's too complex to manage as a monolith**
- arguments: _as a system increases in size, you have to use microservices in order to have parts that are easy to modify and replace_.Yet **there's no reason why you can't make a single monolith with well defined module boundaries.**
- **remember** that the microservices approach brings a high premium, one that can slow down your development considerably. So if you can keep your system simple enough to avoid the need for microservices: do.

---

# Entrepreneur

### How To Develop An Entrepreneur Mindset
- [Source](https://medium.com/the-mission/how-to-develop-an-entrepreneur-mindset-949004ad71b3#.dxqun3r6v)
- Big vision, but small implementation

  Keep up with all the small in the industry, but make sure the BIG still holds.
- Over promise and then over deliver
  + We always had extra features that they didn’t ask for but we knew they would need. We would provide those for free.
- Sales
  + _Likability_. Don’t be a “sales guy”. Do “the 3Ls” (I am making that up). **Love** their product. **Like** the client (find common ground). **Listen** to them.
  + Solve their BIG problem and their SMALL problem
  + _Have a champion_. You can’t get a deal done if the decision maker, or someone close to the decision maker, is not your champion.If someone low-level is your champion then give up immediately and don’t waste time. **You won’t get the deal**.
- Love your business AND Hate it
  + You have to have a _problem-solving mindset_ and _get-new-clients mindset_ every day.
  + _Cash later_ is never as a good as _cash now_.
- Never get angry
  + **Life + Anger < Life**.
  + **Anger = Fear clothed**.

  Ask: what is it I am afraid of? Am I afraid the client will quit? Am I afraid the employee will damage a project? Am I afraid the partner will refuse to go along with my very personal idea for how the company can grow?
  __Solve__ the fear. Look at the worst case scenario. Is it that bad?
- **DON’T SPEND MONEY**
  + Real businesses have cycles. If you are as lean as possible then you can handle a downturn. I never hired a secretary, for instance. And we only moved offices when we were 40 people in a three room office.
  + If you live in the real world and not on welfare then you need to spend less than you charge.
  + The startup mindset is: “Do I have more cash in the bank at the end of the month (when bills are due) than I had at the beginning of the month”.
