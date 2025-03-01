# Arboriculture

A gem for building trees.

### Example

```ruby
Arboriculture.build do
  div(:class => 'big') do
    text 'Hello'
    text 'world'
  end
end
```

Will give you this tree:

```ruby
Arboriculture::Node.new(:div, [], {:class => 'big'},
  [
    Arboriculture::Node.new(:text, ['Hello'], {}, []),
    Arboriculture::Node.new(:text, ['world'], {}, [])
  ]
)
```
