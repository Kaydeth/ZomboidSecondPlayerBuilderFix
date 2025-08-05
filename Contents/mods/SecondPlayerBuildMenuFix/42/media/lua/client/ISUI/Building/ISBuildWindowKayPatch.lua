require "ISUI/Building/ISBuildWindow"

ISBuildWindow.instance = {};

function ISBuildWindow:isKeyConsumed(key)
    --The keyboard should only effect the open menus of the first player
    return self.playerNum == 0 and (key == Keyboard.KEY_ESCAPE or getCore():isKey("Building UI", key))
end

function ISBuildWindow:onKeyRelease(key)
    --The keyboard should only effect the open menus of the first player
    if self:isVisible() and self.playerNum == 0 and (key == Keyboard.KEY_ESCAPE or getCore():isKey("Building UI", key)) then
        self:close()
        self:removeFromUIManager();
        return
    end
end
