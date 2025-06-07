require "Enitty/ISUI/BuildRecipe/ISBuildPanel.lua"

ISBuildPanelPatch = {}
ISBuildPanelPatch.createBuildIsoEntityOrig = ISBuildPanel.createBuildIsoEntity

ISBuildPanel.createBuildIsoEntity = function(self, dontSetDrag)
    -- All the code in ISBuildIsoEntity.lua and ISBuildingObject.lua refer to player with self.player
    -- The problem is that self.player is never set when the ISBuildIsoEntity object is built so it
    -- somehow defaults to player 0 and makes player one do all the building
    ISBuildPanelPatch.createBuildIsoEntityOrig(self, dontSetDrag);
    if self.buildEntity ~= nil and self.buildEntity.character ~= nil then
        -- Set the correct player number in player variable since this is referenced by most of the code
        self.buildEntity.player = self.buildEntity.character:getPlayerNum()
    end
end