-- modules/cc-hui/ui.lua
-- Minimal monitor-aware UI helpers

local ui = {monitor = nil}

function ui.init()
  if peripheral and peripheral.find then
    local ok, m = pcall(peripheral.find, "monitor")
    if ok then ui.monitor = m end
  end
end

local function mon_write(text)
  if ui.monitor and ui.monitor.write then
    ui.monitor.write(text)
  end
end

function ui.clear()
  if term and term.clear then
    term.clear()
    term.setCursorPos(1,1)
  end
  if ui.monitor and ui.monitor.clear then
    ui.monitor.clear()
    ui.monitor.setCursorPos(1,1)
  end
end

function ui.print(text)
  print(text)
  mon_write(text)
  if ui.monitor then
    local x, y = ui.monitor.getCursorPos()
    ui.monitor.setCursorPos(1, y + 1)
  end
end

function ui.write(text)
  write(text)
  mon_write(text)
end

function ui.choose(options, prompt)
  for i, opt in ipairs(options) do
    local label = opt.label or opt.id or tostring(i)
    ui.print(i .. ") " .. label)
  end
  ui.write(prompt or "Select option: ")
  local idx = tonumber(read())
  if ui.monitor then
    local x, y = ui.monitor.getCursorPos()
    ui.monitor.write(tostring(idx))
    ui.monitor.setCursorPos(1, y + 1)
  end
  if idx then return options[idx] end
end

function ui.waitForInput(prompt)
  ui.write(prompt or "Press any key...")
  read()
  if ui.monitor then
    local x, y = ui.monitor.getCursorPos()
    ui.monitor.setCursorPos(1, y + 1)
  end
end

return function ()
  context = _G.context 
  return ui;
end
