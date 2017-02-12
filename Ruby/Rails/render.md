### Render Options
- :content_type

  ```ruby
    render file: filename, content_type: "application/rss"
  ```

- :layout
- :location
  + You can use the :location option to set the HTTP Location header:  
- :status
  + [Status code symbol](http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/)
- :formats

  ```ruby
    render formats: :xml
    render formats: [:json, :xml]
  ```
