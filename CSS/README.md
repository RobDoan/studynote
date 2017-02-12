- [`:nth-child` vs `:nth-of-type`]


*****

## `:nth-child` vs `:nth-of-type`
- `:nth-child` select second child of parent
- `:nth-of-type` select the second that type of parent.
Example:
```html
<section>
  <h1>Words</h1>
  <p>Little</p>
  <p>Piggy</p>
</section>
<style>
  /* nth-child will select second child of section which is a paragraph. So it _little_ will be red*/
  p:nth-child(2) { color: red; }

  /* nth-of-type will select second paragraph of section. So it _Piggy_ will be red*/
  p:nth-of-type(2) { color: red; }
</style>
```
