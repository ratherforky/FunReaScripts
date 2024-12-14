local path = ({reaper.get_action_context()})[2]:match('^.+[\\//]')
package.path = package.path .. ";" .. path .. "?.lua"

local p = require("prelude")
local ripple = require("ripple")

local cutWithinTimeSelection = 41384

ripple.withState(ripple.State.Off, function()
  p.run(cutWithinTimeSelection)
end)


