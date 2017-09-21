- Add Gems (done)
- copy `.rubocop.yml` file
- run rubocop `rubocop --auto-gen-config --exclude-limit 0`
- remove comments on Gemfile
- run rubocop to reorder gems for Gemfile `rubocop --only Bundler -a Gemfile`
- copy `Procfile` for `foreman`
- `yarn add react-materialize materialize-css`

- Setup webpack structure
  + rename `app/javascript/packs/application.js` to `app/javascript/packs/app.js`
  + add `@import "~materialize-css/dist/css/materialize.css"` to `app/javascript/app_styles.scss`
  + prepend `import '../app-styles'` to `app/javascript/packs/app.js`  
  + move `app/javascript/packs/hello_react.jxs` to `packs/hello/components/hello.es6.jsx`
  + add file `app/javascript/packs/hello/styles/hello.scss`
  + create empty folder `app/javascript/packs/hello/models`
  + add file `app/javascript/packs/hello/hello.js`
  + add content to **app/javascript/packs/hello/hello.js**
    ```es6
        import Hello from './components/hello'        
        import './styles/hello'
    ```
