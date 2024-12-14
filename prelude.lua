prelude = {}
prelude.test = "hello, world!"
prelude.match = function(x, cases) return cases[x] end

prelude.getToggle = function(actionID) return reaper.GetToggleCommandState(actionID) end
prelude.run = function(actionID) reaper.Main_OnCommand(actionID, 0) end

prelude.print = function(x) reaper.ShowConsoleMsg(tostring(x)) end

return prelude
