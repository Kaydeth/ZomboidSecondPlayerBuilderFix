-- All the code in ISBuildIsoEntity.lua and ISBuildingObject.lua refer to the player with self.player
-- The problem is that self.player is never set when the ISBuildIsoEntity object is built so it
-- some how defaults to player 0 and makes player one do all the building
Events.SetDragItem.Add( function(dragTable, playerNum)
    -- Check for buildPanelLogic to narrow the scope here. We are only interested in ISBuildIsoEntity drags that were
    -- create in ISBuildPanel
    -- Check if player is already set. Mabye this gets fixed and the mod doesn't have to do anything
    if ( dragTable ~= nil and dragTable.buildPanelLogic ~= nil and dragTable.player == nil) then
        -- Set the correct player number in the player variable since this is referenced by most of the code
        dragTable.player = playerNum
    end
end)