require "Entity/ISUI/BuildRecipe/ISWidgetBuildControl"

function ISWidgetBuildControl:startBuild(force)
    --Use the player specific object when a recipe is selected to be built
    ISBuildWindow.instance[self.player:getPlayerNum()]:createBuildIsoEntity();
    ISBuildWindow.instance[self.player:getPlayerNum()]:updateManualInputs();
    self.logic:updateManualInputAllowedItemTypes();
end