local span_methods = {}
local span_mt = {
	__name = "opentracing.span";
	__index = span_methods;
}

local function new()
  return setmetatable({
  }, span_mt)
end

--- Indicates the work represented by this @class `Span` has completed or 
-- terminated.
--
-- If `finish` is called a second time, it is guaranteed to do nothing.
--
-- @param finish_timestamp (optional) a timestamp represented by microseconds
--    since the epoch to mark when the span ended. If unspecified, the current
--    time will be used.
function span_methods:finish(finish_timestamp)
end

--- Attaches a key/value pair to the @class `Span`.
--
-- The value must be a string, bool, numeric type, or table of such values.
--
-- @param key key or name of the tag. Must be a string.
--
-- @param value value of the tag
function span_methods:set_tag(key, value)
end

--- Attaches a log record to the @class `Span`.
-- 
-- For example:
--
--    span:log_kv({
--      ["event"] = "time to first byte",
--      ["packet.size"] = packet:size()})
--
-- @param key_values a table of string keys and values of string, bool, or
--      numeric types
function span_methods:log_kv(key_values)
end

--- Stores a Baggage item in the @class `Span` as a key/value pair.
--
-- Enables powerful distributed context propagation functionality where
-- arbitrary application data can be carried along the full path of request 
-- execution throughout the system.
--
-- Note 1: Baggage is only propagated to the future (recursive) children of this
-- @class `Span`.
--
-- Note 2: Baggage is sent in-band with every subsequent local and remote calls,
-- so this feature must be used with care.
--
-- @param key Baggage item key
--
-- @param value Baggage item value
function span_methods:set_baggage_item(key, value)
end

--- Retrieves value of the baggage item with the given key.
--
-- @param key key of the baggage item
--
-- @return value of the baggage item with given key or `nil`
function span_methods:get_baggage_item(key)
  return nil
end

return {
  new = new
}
