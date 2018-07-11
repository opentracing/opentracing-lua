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
function log_kv(key_values)
end

return {
  new = new
}
