require "BuildingObjects/ISBuildingObject"

function ISBuildingObject:onActionComplete()
	if self.buildPanelLogic ~= nil then
		print("ISBuildingObject -> onActionComplete - refresh BuildPanel")
		self.buildPanelLogic:stopCraftAction();

		-- Additional update to actualize the available items
		if isClient() and ISBuildWindow.instance[self.player] then
			ISBuildWindow.instance[self.player]:updateContainers();
		end
	end
end