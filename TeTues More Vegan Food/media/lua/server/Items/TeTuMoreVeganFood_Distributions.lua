local ItemDist = {
    -- LootableMaps
    {
      Distributions = {
        {"BreakRoomCounter", 2},
        {"BreakRoomShelves", 2},
        {"ChineseKitchenButcher", 2},
        {"CrateCannedFood", 2},
        {"CrateCannedFoodSpoiled", 2},
        {"CrateCanning", 2},
        {"CrateEmptyTinCans", 2},
        {"CrateRandomJunk", 2},
        {"DishCabinetGeneric", 2},
        {"FactoryLockers", 2},
        {"GigamartCannedFood", 4},
        {"GigamartDryGoods", 2},
        {"GroceryStorageCrate1", 2},
        {"GroceryStorageCrate2", 2},
        {"GroceryStorageCrate3", 2},
        {"ItalianKitchenButcher", 2},
        {"KitchenCannedFood", 2},
        {"KitchenDryFood", 2},
        {"PizzaKitchenButcher", 2},
        {"PlankStashMisc", 2},
        {"ShelfGeneric", 2},
      },
      Items = {
        "TeTueMoreVeganFood.TeTueCannedVeganBolognese",
        "TeTueMoreVeganFood.TeTueTofuPackage",
        "TeTueMoreVeganFood.TeTueSmokedTofuPackage",
      }
    },
    -- LootableMaps
    {
      Distributions = {
        {"FridgeGeneric", 2},
        {"FridgeRich", 2},
        {"FridgeTrailerPark", 2},
        {"FridgeOther", 5},
      },
      Items = {
        "Base.Tofu",
        "Base.TofuFried",
        "TeTueMoreVeganFood.TeTueSmokedTofu",
      }
    },
    -- next item distribution group
    -- ...
  }
  
  
  
  local function getLootTable(strLootTableName)
    return ProceduralDistributions.list[strLootTableName]
  end
  
  local function insertItem(tLootTable, strItem, iWeight)
    table.insert(tLootTable.items, strItem)
    table.insert(tLootTable.items, iWeight)
  end
  
  local function preDistributionMerge()
    for i=1, #ItemDist do
      for j=1, #(ItemDist[i].Distributions) do
        for k=1, #(ItemDist[i].Items) do
          local tLootTable = getLootTable(ItemDist[i].Distributions[j][1])
          local strItem = ItemDist[i].Items[k]
          local iWeight = ItemDist[i].Distributions[j][2]
          insertItem(tLootTable, strItem, iWeight)
        end
      end
    end
  end
  Events.OnPreDistributionMerge.Add(preDistributionMerge)