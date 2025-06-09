require "Entity/ISUI/BuildRecipe/ISBuildPanel"

ISBuildPanelKayPatch.origNew = ISBuildPanel.new
function ISBuildPanel:new(x, y, width, height, player, craftBench, isoObject, recipeQuery)
    local buildPanel = ISBuildPanelKayPatch.origNew(x,y,width,height,player,craftBench, isoObject, recipeQuery)
    ISBuildWindow.instance[player:getPlayerNum()] = buildPanel;
end

function ISBuildPanel:onDoubleClick(item)
    if self.craftRecipePanel.craftControl.buttonCraft.enable then
        ISBuildWindow.instance[self.player:getPlayerNum()]:createBuildIsoEntity();
    end
end

