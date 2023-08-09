function Recipe.OnCreate.TeTueOpenTofuPackage(items, result, player)
    player:getInventory():AddItem("Base.Tofu");
    player:getInventory():AddItem("Base.Tofu");
    print("Test print: ", result)
end