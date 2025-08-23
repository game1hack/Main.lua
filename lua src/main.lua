repo-root/
│
├── README.md
├── .gitignore
└── src/
    ├── main.lua
    ├── ui.lua
    ├── bag.lua
    ├── autobuy.lua
    └── tools.lua

---

### README.md
```markdown
# Clown GUI Demo (Educational)

This is a **pure Lua project** meant for GitHub, simulating a simple GUI system
with buttons for **Bag List**, **Auto Buy Seed**, and **Tools**. It does not
interact with Roblox or executors.

## Features
- Console-based UI simulation
- Bag List display
- Auto Buy Seed toggle with ON/OFF state
- Tools list display
- Persistent looping menu (keeps running until user exits)

## Usage
```sh
lua src/main.lua
```
```

---

### .gitignore
```gitignore
*.log
.DS_Store
Thumbs.db
```

---

### src/main.lua
```lua
-- Entry point
local ui = require("src.ui")

-- Run GUI simulation
ui.start()
```

---

### src/ui.lua
```lua
-- ui.lua
local bag = require("src.bag")
local autobuy = require("src.autobuy")
local tools = require("src.tools")

local ui = {}

local function showMenu()
    print("\n=== Clown GUI Demo ===")
    print("1. Bag List")
    print("2. Auto Buy Seed (toggle)")
    print("3. Tools")
    print("4. Exit")
    print("Choose an option:")
end

function ui.start()
    local running = true
    while running do
        showMenu()
        local choice = io.read()

        if choice == "1" then
            bag.show()
        elseif choice == "2" then
            autobuy.toggle()
        elseif choice == "3" then
            tools.show()
        elseif choice == "4" then
            print("Exiting Clown GUI Demo. Goodbye!")
            running = false
        else
            print("Invalid option. Try again.")
        end
    end
end

return ui
```

---

### src/bag.lua
```lua
-- bag.lua
local bag = {}

function bag.show()
    local items = {"Seed x5", "Watering Can", "Hoe"}
    print("[Bag List]")
    for _, item in ipairs(items) do
        print("- " .. item)
    end
end

return bag
```

---

### src/autobuy.lua
```lua
-- autobuy.lua
local autobuy = { active = false }

function autobuy.toggle()
    autobuy.active = not autobuy.active
    if autobuy.active then
        print("[AutoBuy] Enabled: buying seeds every 3s (simulated)")
        for i = 1, 3 do
            print("Bought seed #" .. i)
        end
    else
        print("[AutoBuy] Disabled")
    end
end

return autobuy
```

---

### src/tools.lua
```lua
-- tools.lua
local tools = {}

function tools.show()
    local list = {"Shovel", "Hoe", "Watering Can"}
    print("[Tools]")
    for _, tool in ipairs(list) do
        print("- " .. tool)
    end
end

return tools
```
