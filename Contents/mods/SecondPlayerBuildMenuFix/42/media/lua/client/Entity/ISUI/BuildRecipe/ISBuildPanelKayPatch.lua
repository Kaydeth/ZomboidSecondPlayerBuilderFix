require "Entity/ISUI/BuildRecipe/ISBuildPanel"

ISBuildPanelKayPatch = {}

ISBuildPanelKayPatch.origNew = ISBuildPanel.new
function ISBuildPanel:new(x, y, width, height, player, craftBench, isoObject, recipeQuery)
    --The original function will overwrite the instance variable so we want to save our table and put it back after
    local saveTable = ISBuildWindow.instance
    local buildPanel = ISBuildPanelKayPatch.origNew(self, x,y,width,height,player,craftBench, isoObject, recipeQuery)
    ISBuildWindow.instance = saveTable
    ISBuildWindow.instance[player:getPlayerNum()] = buildPanel;
    return buildPanel
end

function ISBuildPanel:onDoubleClick(item)
    if self.craftRecipePanel.craftControl.buttonCraft.enable then
        --Use the player specific object when a recipe is selected to be built
        ISBuildWindow.instance[self.player:getPlayerNum()]:createBuildIsoEntity();
    end
end

