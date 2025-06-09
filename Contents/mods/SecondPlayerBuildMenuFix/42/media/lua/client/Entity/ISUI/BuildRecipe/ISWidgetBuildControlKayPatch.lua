require "Entity/ISUI/BuildRecipe/ISWidgetBuildControl"

function ISWidgetBuildControl:startBuild(force)
    --Use the player specific object when a recipe is selected to be built
    ISBuildWindow.instance[self.player:getPlayerNum()]:createBuildIsoEntity();
end