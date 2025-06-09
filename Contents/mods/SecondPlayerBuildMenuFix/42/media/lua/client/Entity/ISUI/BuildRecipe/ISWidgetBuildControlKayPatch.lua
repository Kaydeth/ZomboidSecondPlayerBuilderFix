require "Entity/ISUI/BuildRecipe/ISWidgetBuildControl"

function ISWidgetBuildControl:startBuild(force)
    ISBuildWindow.instance[self.player:getPlayerNum()]:createBuildIsoEntity();
end