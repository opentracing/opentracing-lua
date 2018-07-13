# OpenTracing API for Lua
Lua implementation of the OpenTracing API http://opentracing.io

## Required Reading

In order to understand the Lua platform API, one must first be familiar with the
[OpenTracing project](http://opentracing.io) and
[terminology](http://opentracing.io/documentation/pages/spec) more generally. 

## API overview for those adding instrumentation

Everyday consumers of this `opentracing` package really only need to worry
about a couple of key abstractions: the `start_span` function, the `Span`
interface, and binding a `Tracer` at initialization-time. Here are code snippets
demonstrating some important use cases.

#### Starting an empty trace by creating a "root span"

It's always possible to create a "root" `Span` with no parent or other causal
reference.

```lua
    function xyz()
        ...
        tracer = --[[ Some Tracer ]]
        span = tracer:start_span("operation_name")
        -- Do some work
        span:finish()
        ...
    end
```

#### Creating a (child) Span given an existing (parent) Span

```lua
    function qrz(parent_span)
        ...
        tracer = --[[ Some Tracer ]]
        span = tracer:start_span(
          "operation_name",
          {["references"] = {{"child_of", parent_span:context()}}})
        -- Do some work
        span:finish()
        ...
    end
```

#### Inject Span context into a table

```lua
    tracer = --[[ Some Tracer ]]
    carrier = {}
    span = tracer:start_span('abc')
    tracer:http_headers_inject(span:context(), carrier)
```

#### Extract Span context from a table

```lua
    tracer = --[[ Some Tracer ]]
    carrier = --[[ Some carrier ]]
    span_context = tracer:http_headers_extract(carrier)
```

## API compatibility

For the time being, "mild" backwards-incompatible changes may be made without
changing the major version number. As OpenTracing and `opentracing-cpp` mature,
backwards compatibility will become more of a priority.

## License

By contributing to opentracing.cpp, you agree that your contributions will be licensed under its [Apache 2.0 License](./LICENSE).
