local path = ({reaper.get_action_context()})[2]:match('^.+[\\//]')
package.path = package.path .. ";" .. path .. "?.lua"

local p = require("prelude")

ripple = {}

ripple.State = { 
   Off = 0,
   PerTrack = 1,
   AllTracks = 2,
}

ripple.Action = {
  Off       = 40309,
  PerTracks = 40310,
  AllTracks = 40311,
}

ripple.getState = function()
  if     p.getToggle(ripple.Action.PerTracks) == 1 then
    return ripple.State.PerTrack
  elseif p.getToggle(ripple.Action.AllTracks) == 1 then
    return ripple.State.AllTracks
  else
    return ripple.State.Off
  end
end

ripple.setState = function(rState)
  p.run(p.match(rState,{
    [ripple.State.Off]       = ripple.Action.Off,
    [ripple.State.PerTrack]  = ripple.Action.PerTracks,
    [ripple.State.AllTracks] = ripple.Action.AllTracks,
  }))
end

ripple.withState = function(rStateForAction, action)
  local originalState = ripple.getState()
  ripple.setState(rStateForAction)
  action()
  ripple.setState(originalState)
end

return ripple
