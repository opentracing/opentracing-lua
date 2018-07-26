local tracer = require 'opentracing.tracer'

describe("in tracer", function()
  it("supports the construction of a noop tracer", function()
    local t = tracer:new()
    local span = t:start_span("abc")
    local context = span:context()
    local t2 = span:tracer()
    span:set_tag("abc", 123)
    span:log_kv({
        ["event"] = "time to first byte",
        ["packet.size"] = 100})
    span:set_baggage_item("abc", "123")
    span:get_baggage_item("abc")
    span:finish()
  end)
end)
