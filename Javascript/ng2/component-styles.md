* [`:host`](#host)
* [`::host-context`](#host-context)
* [`/deep/`](#deep)
* [Template Link Tags](#template-link-tags)
* [CSS `@imports`](#css-imports)
* [Controlling View Encapsulation](#controlling-View-encapsulation)
  + [Native](#native)
  + [Emulated](#emulated)
  + [None](#none)

### :host
- `:host` pseudo-class selector to target styles in the element that hosts the component
- This is the only way we can target the host element.
```css
  :host(.active) {
    border-width: 3px;
  }
```

### :host-context
- `:host-context()` _pseudo-class_ selector looks for **a CSS class in any ancestor** of the component host element, all the way up to the document root. It's useful when combined with another selector.

### /deep/
- Component styles normally apply only to the HTML in the component's own template.
- The `/deep/` selector also has the alias `>>>`.

### Template Link Tags

```Typescript
  @Component({
    selector: 'hero-team',
    template: `<link rel="stylesheet" href="app/hero-team.component.css">`
```
- As with styleUrls, the link tag's href URL is relative to the application root, not relative to the component file

### CSS `@imports`
- URL is relative to the CSS file into which we are importing.

### Controlling View Encapsulation
#### Native
  + Use browser's native [Shadow DOM](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Shadow_DOM).
  + The component's styles are included within the Shadow DOM.
  + **Only few browsers support shadow dom at this time**

#### Emulated
  + this is default value.
  + emulate shadow dom by processing css code to effectively scope the CSS to the component's view.
  
#### None
  + Angular adds the CSS to the global styles
