require "Entity/ISEntityUI"

ISEntityUIKayPatch = {}

ISEntityUIKayPatch.OpenBuildWindowOrig = ISEntityUI.OpenBuildWindow
function ISEntityUI.OpenBuildWindow(_player, _isoObject, _queryOverride, _ignoreFindSurface, recipe)
    --Skip the close all windows call when opening the building menu so that each player can open
    --the menu without closing everybody else's windows
    ISEntityUIKayPatch.ignoreClose = true;
    ISEntityUIKayPatch.OpenBuildWindowOrig(_player, _isoObject, _queryOverride, _ignoreFindSurface, recipe)
end

ISEntityUIKayPatch.OpenHandcraftWindowOrig = ISEntityUI.OpenHandcraftWindow
function ISEntityUI.OpenHandcraftWindow(_player, _isoObject, _queryOverride, _ignoreFindSurface, recipe, itemString)
    --Skip the close all windows call when opening the crafting menu so that each player can open
    --the menu without closing everybody else's windows
    ISEntityUIKayPatch.ignoreClose = true;
    ISEntityUIKayPatch.OpenHandcraftWindowOrig(_player, _isoObject, _queryOverride, _ignoreFindSurface, recipe, itemString)
end

ISEntityUIKayPatch.ignoreClose = false;
function ISEntityUI.CloseWindows()
    if ISEntityUIKayPatch.ignoreClose then
        ISEntityUIKayPatch.ignoreClose = false;
        return
    end

    ISEntityUI.EnsurePlayers();
    for k,v in pairs(ISEntityUI.players) do
        if v.windows then
            for kk,vv in pairs(v.windows) do
                if vv.instance and vv.instance.close then
                    vv.instance:close();
                end
            end
        end
    end
end