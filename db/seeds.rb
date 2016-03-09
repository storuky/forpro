Company.create!([
  {id: 1, name: "agrofor"},
  {id: 2, name: "fuelfor"},
  {id: 3, name: "woodfor"},
])
WeightDimension.create!([
  {id: 1, name: "kg", convert: 1.0},
  {id: 2, name: "tonn", convert: 1000.0},
  {id: 3, name: "liter", convert: 1.0},
  {id: 4, name: "m3", convert: 1000.0},
  {id: 5, name: "ft3", convert: 28.31},
  {id: 6, name: "m2", convert: 1},
])
Currency.create!([
  {id: 1, name: "RUB"},
  {id: 2, name: "USD"},
  {id: 3, name: "EUR"},
  {id: 4, name: "GBP"},
  {id: 5, name: "JPY"},
  {id: 6, name: "CAD"},
  {id: 7, name: "CNY"},
  {id: 8, name: "AUD"},
  {id: 9, name: "NZD"}
])
Product.create!([
  {id: 1, title: "watermelon", category_id: 1, company_id: 1},
  {id: 2, title: "barberry", category_id: 1, company_id: 1},
  {id: 3, title: "cowberry", category_id: 1, company_id: 1},
  {id: 4, title: "elder", category_id: 1, company_id: 1},
  {id: 5, title: "grapes", category_id: 1, company_id: 1},
  {id: 6, title: "goji berries", category_id: 1, company_id: 1},
  {id: 7, title: "blueberry", category_id: 1, company_id: 1},
  {id: 8, title: "cherry", category_id: 1, company_id: 1},
  {id: 9, title: "melon", category_id: 1, company_id: 1},
  {id: 10, title: "blackberries", category_id: 1, company_id: 1},
  {id: 11, title: "strawberry", category_id: 1, company_id: 1},
  {id: 12, title: "shadberry", category_id: 1, company_id: 1},
  {id: 13, title: "viburnum", category_id: 1, company_id: 1},
  {id: 14, title: "dogwood", category_id: 1, company_id: 1},
  {id: 15, title: "strawberry", category_id: 1, company_id: 1},
  {id: 16, title: "cranberry", category_id: 1, company_id: 1},
  {id: 17, title: "redcurrant", category_id: 1, company_id: 1},
  {id: 18, title: "gooseberry", category_id: 1, company_id: 1},
  {id: 19, title: "lemongrass", category_id: 1, company_id: 1},
  {id: 20, title: "raspberry", category_id: 1, company_id: 1},
  {id: 21, title: "cloudberry", category_id: 1, company_id: 1},
  {id: 22, title: "sea buckthorn", category_id: 1, company_id: 1},
  {id: 23, title: "green olives", category_id: 1, company_id: 1},
  {id: 24, title: "rowan", category_id: 1, company_id: 1},
  {id: 25, title: "blackthorn", category_id: 1, company_id: 1},
  {id: 26, title: "feijoa ", category_id: 1, company_id: 1},
  {id: 27, title: "physalis", category_id: 1, company_id: 1},
  {id: 28, title: "cherry", category_id: 1, company_id: 1},
  {id: 29, title: "blackberry", category_id: 1, company_id: 1},
  {id: 30, title: "blueberry", category_id: 1, company_id: 1},
  {id: 31, title: "bird-cherry tree", category_id: 1, company_id: 1},
  {id: 32, title: "chokeberry", category_id: 1, company_id: 1},
  {id: 33, title: "mulberry", category_id: 1, company_id: 1},
  {id: 34, title: "briar", category_id: 1, company_id: 1},
  {id: 35, title: "mung beans", category_id: 2, company_id: 1},
  {id: 36, title: "vetch", category_id: 2, company_id: 1},
  {id: 37, title: "peas", category_id: 2, company_id: 1},
  {id: 38, title: "lupine", category_id: 2, company_id: 1},
  {id: 39, title: "chick-pea", category_id: 2, company_id: 1},
  {id: 40, title: "soy", category_id: 2, company_id: 1},
  {id: 41, title: "beans", category_id: 2, company_id: 1},
  {id: 42, title: "lentil", category_id: 2, company_id: 1},
  {id: 43, title: "chin", category_id: 2, company_id: 1},
  {id: 44, title: "corn sugar", category_id: 3, company_id: 1},
  {id: 45, title: "waxy maize", category_id: 3, company_id: 1},
  {id: 46, title: "corn filmy", category_id: 3, company_id: 1},
  {id: 47, title: "corn burst", category_id: 3, company_id: 1},
  {id: 48, title: "dent corn", category_id: 3, company_id: 1},
  {id: 49, title: "starchy corn", category_id: 3, company_id: 1},
  {id: 50, title: "corn siliceous", category_id: 3, company_id: 1},
  {id: 51, title: "milk", category_id: 4, company_id: 1},
  {id: 52, title: "cheese", category_id: 4, company_id: 1},
  {id: 53, title: "feta cheese", category_id: 4, company_id: 1},
  {id: 54, title: "butter", category_id: 4, company_id: 1},
  {id: 55, title: "cream", category_id: 4, company_id: 1},
  {id: 56, title: "sour cream", category_id: 4, company_id: 1},
  {id: 57, title: "cottage cheese", category_id: 4, company_id: 1},
  {id: 58, title: "raisins", category_id: 5, company_id: 1},
  {id: 59, title: "fig", category_id: 5, company_id: 1},
  {id: 60, title: "dried apricots", category_id: 5, company_id: 1},
  {id: 61, title: "date", category_id: 5, company_id: 1},
  {id: 62, title: "prune", category_id: 5, company_id: 1},
  {id: 63, title: "goose eggs", category_id: 6, company_id: 1},
  {id: 64, title: "turkey eggs", category_id: 6, company_id: 1},
  {id: 65, title: "chicken eggs", category_id: 6, company_id: 1},
  {id: 66, title: "quail eggs", category_id: 6, company_id: 1},
  {id: 67, title: "ostrich eggs", category_id: 6, company_id: 1},
  {id: 68, title: "duck eggs", category_id: 6, company_id: 1},
  {id: 69, title: "anchovies", category_id: 7, company_id: 1},
  {id: 70, title: "red mullet (sultan)", category_id: 7, company_id: 1},
  {id: 71, title: "chub", category_id: 7, company_id: 1},
  {id: 72, title: "pink salmon", category_id: 7, company_id: 1},
  {id: 73, title: "dorado", category_id: 7, company_id: 1},
  {id: 74, title: "ruff", category_id: 7, company_id: 1},
  {id: 75, title: "lancet fish", category_id: 7, company_id: 1},
  {id: 76, title: "flounder", category_id: 7, company_id: 1},
  {id: 77, title: "crucian", category_id: 7, company_id: 1},
  {id: 78, title: "carp", category_id: 7, company_id: 1},
  {id: 79, title: "dog-salmon", category_id: 7, company_id: 1},
  {id: 80, title: "mullet", category_id: 7, company_id: 1},
  {id: 81, title: "smelt", category_id: 7, company_id: 1},
  {id: 82, title: "tench", category_id: 7, company_id: 1},
  {id: 83, title: "bream", category_id: 7, company_id: 1},
  {id: 84, title: "bluefish", category_id: 7, company_id: 1},
  {id: 85, title: "mackerel", category_id: 7, company_id: 1},
  {id: 86, title: "pollack", category_id: 7, company_id: 1},
  {id: 87, title: "capelin", category_id: 7, company_id: 1},
  {id: 88, title: "sea bass", category_id: 7, company_id: 1},
  {id: 89, title: "burbot", category_id: 7, company_id: 1},
  {id: 90, title: "perch", category_id: 7, company_id: 1},
  {id: 91, title: "sturgeon", category_id: 7, company_id: 1},
  {id: 92, title: "halibut", category_id: 7, company_id: 1},
  {id: 93, title: "haddock", category_id: 7, company_id: 1},
  {id: 94, title: "roach", category_id: 7, company_id: 1},
  {id: 95, title: "carp", category_id: 7, company_id: 1},
  {id: 96, title: "sprat", category_id: 7, company_id: 1},
  {id: 97, title: "sardine", category_id: 7, company_id: 1},
  {id: 98, title: "herring", category_id: 7, company_id: 1},
  {id: 99, title: "salmon", category_id: 7, company_id: 1},
  {id: 100, title: "whitefish", category_id: 7, company_id: 1},
  {id: 101, title: "mackerel", category_id: 7, company_id: 1},
  {id: 102, title: "catfish", category_id: 7, company_id: 1},
  {id: 103, title: "horse mackerel", category_id: 7, company_id: 1},
  {id: 104, title: "sterlet", category_id: 7, company_id: 1},
  {id: 105, title: "zander", category_id: 7, company_id: 1},
  {id: 106, title: "carp", category_id: 7, company_id: 1},
  {id: 107, title: "cod", category_id: 7, company_id: 1},
  {id: 108, title: "tuna", category_id: 7, company_id: 1},
  {id: 109, title: "trout", category_id: 7, company_id: 1},
  {id: 110, title: "hake", category_id: 7, company_id: 1},
  {id: 111, title: "pike", category_id: 7, company_id: 1},
  {id: 112, title: "ide", category_id: 7, company_id: 1},
  {id: 113, title: "apricot", category_id: 8, company_id: 1},
  {id: 114, title: "avocado", category_id: 8, company_id: 1},
  {id: 115, title: "quince", category_id: 8, company_id: 1},
  {id: 116, title: "cherry-plum", category_id: 8, company_id: 1},
  {id: 117, title: "pineapple", category_id: 8, company_id: 1},
  {id: 118, title: "annona (guanabana)", category_id: 8, company_id: 1},
  {id: 119, title: "orange", category_id: 8, company_id: 1},
  {id: 120, title: "banana", category_id: 8, company_id: 1},
  {id: 121, title: "garnet", category_id: 8, company_id: 1},
  {id: 122, title: "grapefruit", category_id: 8, company_id: 1},
  {id: 123, title: "pear", category_id: 8, company_id: 1},
  {id: 124, title: "guava", category_id: 8, company_id: 1},
  {id: 125, title: "jackfruit", category_id: 8, company_id: 1},
  {id: 126, title: "draconian fruit (pitahaya)", category_id: 8, company_id: 1},
  {id: 127, title: "durian", category_id: 8, company_id: 1},
  {id: 128, title: "carambola", category_id: 8, company_id: 1},
  {id: 129, title: "kiwi", category_id: 8, company_id: 1},
  {id: 130, title: "clementines", category_id: 8, company_id: 1},
  {id: 131, title: "kumquat", category_id: 8, company_id: 1},
  {id: 132, title: "lime", category_id: 8, company_id: 1},
  {id: 133, title: "lemon", category_id: 8, company_id: 1},
  {id: 134, title: "lichee", category_id: 8, company_id: 1},
  {id: 135, title: "mango", category_id: 8, company_id: 1},
  {id: 136, title: "mangosteen", category_id: 8, company_id: 1},
  {id: 137, title: "tangerine", category_id: 8, company_id: 1},
  {id: 138, title: "passionfruit", category_id: 8, company_id: 1},
  {id: 139, title: "medlar", category_id: 8, company_id: 1},
  {id: 140, title: "nectarine", category_id: 8, company_id: 1},
  {id: 141, title: "papaya", category_id: 8, company_id: 1},
  {id: 142, title: "peach", category_id: 8, company_id: 1},
  {id: 143, title: "witch's broom", category_id: 8, company_id: 1},
  {id: 144, title: "rambutan", category_id: 8, company_id: 1},
  {id: 145, title: "sweetie", category_id: 8, company_id: 1},
  {id: 146, title: "plum", category_id: 8, company_id: 1},
  {id: 147, title: "persimmon", category_id: 8, company_id: 1},
  {id: 148, title: "apple", category_id: 8, company_id: 1},
  {id: 149, title: "artichoke", category_id: 9, company_id: 1},
  {id: 150, title: "asparagus", category_id: 9, company_id: 1},
  {id: 151, title: "basil", category_id: 9, company_id: 1},
  {id: 152, title: "parsley", category_id: 9, company_id: 1},
  {id: 153, title: "lettuce", category_id: 9, company_id: 1},
  {id: 154, title: "celery", category_id: 9, company_id: 1},
  {id: 155, title: "dill", category_id: 9, company_id: 1},
  {id: 156, title: "chicory", category_id: 9, company_id: 1},
  {id: 157, title: "wild leek", category_id: 9, company_id: 1},
  {id: 158, title: "spinach", category_id: 9, company_id: 1},
  {id: 159, title: "sorrel", category_id: 9, company_id: 1},
  {id: 160, title: "cep (boletus)", category_id: 10, company_id: 1},
  {id: 161, title: "oyster mushrooms", category_id: 10, company_id: 1},
  {id: 162, title: "milk mushroom", category_id: 10, company_id: 1},
  {id: 163, title: "ivishen (clitopilus prunulus)", category_id: 10, company_id: 1},
  {id: 164, title: "chanterelles", category_id: 10, company_id: 1},
  {id: 165, title: "boletus", category_id: 10, company_id: 1},
  {id: 166, title: "flywheel", category_id: 10, company_id: 1},
  {id: 167, title: "mushrooms", category_id: 10, company_id: 1},
  {id: 168, title: "boletus", category_id: 10, company_id: 1},
  {id: 169, title: "orange-cap boletus", category_id: 10, company_id: 1},
  {id: 170, title: "saffron milk cap", category_id: 10, company_id: 1},
  {id: 171, title: "morels", category_id: 10, company_id: 1},
  {id: 172, title: "russule", category_id: 10, company_id: 1},
  {id: 173, title: "truffle", category_id: 10, company_id: 1},
  {id: 174, title: "champignon", category_id: 10, company_id: 1},
  {id: 175, title: "shiitake", category_id: 10, company_id: 1},
  {id: 176, title: "vitamins", category_id: 11, company_id: 1},
  {id: 177, title: "cake", category_id: 11, company_id: 1},
  {id: 178, title: "pulp", category_id: 11, company_id: 1},
  {id: 179, title: "wms", category_id: 11, company_id: 1},
  {id: 180, title: "ingredients", category_id: 11, company_id: 1},
  {id: 181, title: "fodder", category_id: 11, company_id: 1},
  {id: 182, title: "feed additives", category_id: 11, company_id: 1},
  {id: 183, title: "meat meal", category_id: 11, company_id: 1},
  {id: 184, title: "meat and bone meal", category_id: 11, company_id: 1},
  {id: 185, title: "bran", category_id: 11, company_id: 1},
  {id: 186, title: "premixes", category_id: 11, company_id: 1},
  {id: 187, title: "fishmeal", category_id: 11, company_id: 1},
  {id: 188, title: "silage", category_id: 11, company_id: 1},
  {id: 189, title: "soy", category_id: 11, company_id: 1},
  {id: 190, title: "schroth", category_id: 11, company_id: 1},
  {id: 191, title: "mustard", category_id: 12, company_id: 1},
  {id: 192, title: "coriander", category_id: 12, company_id: 1},
  {id: 193, title: "sesame", category_id: 12, company_id: 1},
  {id: 194, title: "flax", category_id: 12, company_id: 1},
  {id: 195, title: "sunflower", category_id: 12, company_id: 1},
  {id: 196, title: "rape", category_id: 12, company_id: 1},
  {id: 197, title: "cumin", category_id: 12, company_id: 1},
  {id: 198, title: "lamb", category_id: 13, company_id: 1},
  {id: 199, title: "bacon", category_id: 13, company_id: 1},
  {id: 200, title: "cold boiled pork", category_id: 13, company_id: 1},
  {id: 201, title: "ham", category_id: 13, company_id: 1},
  {id: 202, title: "beef ", category_id: 13, company_id: 1},
  {id: 203, title: "hare", category_id: 13, company_id: 1},
  {id: 204, title: "goat meat", category_id: 13, company_id: 1},
  {id: 205, title: "horsemeat", category_id: 13, company_id: 1},
  {id: 206, title: "rabbit", category_id: 13, company_id: 1},
  {id: 207, title: "venison", category_id: 13, company_id: 1},
  {id: 208, title: "liver", category_id: 13, company_id: 1},
  {id: 209, title: "fat", category_id: 13, company_id: 1},
  {id: 210, title: "pork", category_id: 13, company_id: 1},
  {id: 211, title: "veal", category_id: 13, company_id: 1},
  {id: 212, title: "meat language", category_id: 13, company_id: 1},
  {id: 213, title: "linden honey", category_id: 14, company_id: 1},
  {id: 214, title: "acacia honey", category_id: 14, company_id: 1},
  {id: 215, title: "sunflower honey", category_id: 14, company_id: 1},
  {id: 216, title: "buckwheat honey", category_id: 14, company_id: 1},
  {id: 217, title: "raspberry honey", category_id: 14, company_id: 1},
  {id: 218, title: "barberry honey", category_id: 14, company_id: 1},
  {id: 219, title: "cornflower honey", category_id: 14, company_id: 1},
  {id: 220, title: "heather honey", category_id: 14, company_id: 1},
  {id: 221, title: "honey mustard", category_id: 14, company_id: 1},
  {id: 222, title: "blackberry honey", category_id: 14, company_id: 1},
  {id: 223, title: "pumpkin honey", category_id: 14, company_id: 1},
  {id: 224, title: "melissovy honey", category_id: 14, company_id: 1},
  {id: 225, title: "clover honey", category_id: 14, company_id: 1},
  {id: 226, title: "mint honey", category_id: 14, company_id: 1},
  {id: 227, title: "dandelion honey", category_id: 14, company_id: 1},
  {id: 228, title: "ryabinovny honey", category_id: 14, company_id: 1},
  {id: 229, title: "blueberry honey", category_id: 14, company_id: 1},
  {id: 230, title: "sage honey", category_id: 14, company_id: 1},
  {id: 231, title: "carrot honey", category_id: 14, company_id: 1},
  {id: 232, title: "may honey", category_id: 14, company_id: 1},
  {id: 233, title: "meadow honey", category_id: 14, company_id: 1},
  {id: 234, title: "forest honey", category_id: 14, company_id: 1},
  {id: 235, title: "field honey", category_id: 14, company_id: 1},
  {id: 236, title: "mountain honey", category_id: 14, company_id: 1},
  {id: 237, title: "tobacco honey", category_id: 14, company_id: 1},
  {id: 238, title: "stone honey", category_id: 14, company_id: 1},
  {id: 239, title: "powdered honey", category_id: 14, company_id: 1},
  {id: 240, title: "comb", category_id: 14, company_id: 1},
  {id: 241, title: "wheat top grade flour", category_id: 15, company_id: 1},
  {id: 242, title: "wheat first grade flour", category_id: 15, company_id: 1},
  {id: 243, title: "wheat second grade flour", category_id: 15, company_id: 1},
  {id: 244, title: "flaxseed oil", category_id: 15, company_id: 1},
  {id: 245, title: "olive oil", category_id: 15, company_id: 1},
  {id: 246, title: "peanuts", category_id: 16, company_id: 1},
  {id: 247, title: "brazil nuts ", category_id: 16, company_id: 1},
  {id: 248, title: "walnut", category_id: 16, company_id: 1},
  {id: 249, title: "chestnut", category_id: 16, company_id: 1},
  {id: 250, title: "pine nuts", category_id: 16, company_id: 1},
  {id: 251, title: "cashew", category_id: 16, company_id: 1},
  {id: 252, title: "coconut", category_id: 16, company_id: 1},
  {id: 253, title: "almonds", category_id: 16, company_id: 1},
  {id: 254, title: "nutmeg", category_id: 16, company_id: 1},
  {id: 255, title: "pistachios", category_id: 16, company_id: 1},
  {id: 256, title: "hazelnut", category_id: 16, company_id: 1},
  {id: 257, title: "sunflower oil", category_id: 17, company_id: 1},
  {id: 258, title: "peanut oil", category_id: 17, company_id: 1},
  {id: 259, title: "mustard oil", category_id: 17, company_id: 1},
  {id: 260, title: "sesame oil ", category_id: 17, company_id: 1},
  {id: 261, title: "corn oil", category_id: 17, company_id: 1},
  {id: 262, title: "rapeseed oil", category_id: 17, company_id: 1},
  {id: 263, title: "soybean oil", category_id: 17, company_id: 1},
  {id: 264, title: "algae", category_id: 18, company_id: 1},
  {id: 265, title: "squid", category_id: 18, company_id: 1},
  {id: 266, title: "crab", category_id: 18, company_id: 1},
  {id: 267, title: "shrimp", category_id: 18, company_id: 1},
  {id: 268, title: "crayfish", category_id: 18, company_id: 1},
  {id: 269, title: "scampi", category_id: 18, company_id: 1},
  {id: 270, title: "lobster", category_id: 18, company_id: 1},
  {id: 271, title: "mussel", category_id: 18, company_id: 1},
  {id: 272, title: "laminaria", category_id: 18, company_id: 1},
  {id: 273, title: "scallops", category_id: 18, company_id: 1},
  {id: 274, title: "octopus", category_id: 18, company_id: 1},
  {id: 275, title: "trepang", category_id: 18, company_id: 1},
  {id: 276, title: "oyster", category_id: 18, company_id: 1},
  {id: 277, title: "seed", category_id: 19, company_id: 1},
  {id: 278, title: "seedlings", category_id: 19, company_id: 1},
  {id: 279, title: "sugar", category_id: 20, company_id: 1},
  {id: 280, title: "cane sugar", category_id: 20, company_id: 1},
  {id: 281, title: "lump sugar", category_id: 20, company_id: 1},
  {id: 282, title: "candy sugar", category_id: 20, company_id: 1},
  {id: 283, title: "arrowroot", category_id: 21, company_id: 1},
  {id: 284, title: "eggplant", category_id: 21, company_id: 1},
  {id: 285, title: "rutabaga", category_id: 21, company_id: 1},
  {id: 286, title: "buryak", category_id: 21, company_id: 1},
  {id: 287, title: "squash ", category_id: 21, company_id: 1},
  {id: 288, title: "capers", category_id: 21, company_id: 1},
  {id: 289, title: "white cabbage", category_id: 21, company_id: 1},
  {id: 290, title: "broccoli", category_id: 21, company_id: 1},
  {id: 291, title: "brussels sprouts", category_id: 21, company_id: 1},
  {id: 292, title: "cabbage", category_id: 21, company_id: 1},
  {id: 293, title: "cabbage", category_id: 21, company_id: 1},
  {id: 294, title: "cauliflower", category_id: 21, company_id: 1},
  {id: 295, title: "potato", category_id: 21, company_id: 1},
  {id: 296, title: "corn", category_id: 21, company_id: 1},
  {id: 297, title: "onions", category_id: 21, company_id: 1},
  {id: 298, title: "leek", category_id: 21, company_id: 1},
  {id: 299, title: "shallot", category_id: 21, company_id: 1},
  {id: 300, title: "carrot", category_id: 21, company_id: 1},
  {id: 301, title: "cucumber", category_id: 21, company_id: 1},
  {id: 302, title: "parsnip", category_id: 21, company_id: 1},
  {id: 303, title: "squash", category_id: 21, company_id: 1},
  {id: 304, title: "sweet pepper", category_id: 21, company_id: 1},
  {id: 305, title: "tomato", category_id: 21, company_id: 1},
  {id: 306, title: "cherry tomatoes", category_id: 21, company_id: 1},
  {id: 307, title: "radishes", category_id: 21, company_id: 1},
  {id: 308, title: "radish", category_id: 21, company_id: 1},
  {id: 309, title: "turnip", category_id: 21, company_id: 1},
  {id: 310, title: "beet", category_id: 21, company_id: 1},
  {id: 311, title: "pumpkin", category_id: 21, company_id: 1},
  {id: 312, title: "horseradish", category_id: 21, company_id: 1},
  {id: 313, title: "zucchini", category_id: 21, company_id: 1},
  {id: 314, title: "garlic", category_id: 21, company_id: 1},
  {id: 315, title: "buckwheat", category_id: 22, company_id: 1},
  {id: 316, title: "wheat", category_id: 22, company_id: 1},
  {id: 317, title: "rice", category_id: 22, company_id: 1},
  {id: 318, title: "rye", category_id: 22, company_id: 1},
  {id: 319, title: "barley", category_id: 22, company_id: 1},
  {id: 320, title: "firewood", category_id: 23, company_id: 1},
  {id: 321, title: "sawdust", category_id: 23, company_id: 1},
  {id: 322, title: "biofertilizers", category_id: 24, company_id: 1},
  {id: 323, title: "herbicides", category_id: 24, company_id: 1},
  {id: 324, title: "primers", category_id: 24, company_id: 1},
  {id: 325, title: "pesticides", category_id: 24, company_id: 1},
  {id: 326, title: "plant protection products", category_id: 24, company_id: 1},
  {id: 327, title: "fertilizers", category_id: 2, company_id: 1}
])
Category.create!([
  {id: 1, title: "berries", company_id: 1},
  {id: 2, title: "bobs", company_id: 1},
  {id: 3, title: "corn", company_id: 1},
  {id: 4, title: "dairy", company_id: 1},
  {id: 5, title: "dried fruit", company_id: 1},
  {id: 6, title: "eggs", company_id: 1},
  {id: 7, title: "fish", company_id: 1},
  {id: 8, title: "fruits", company_id: 1},
  {id: 9, title: "herbs", company_id: 1},
  {id: 10, title: "mushrooms", company_id: 1},
  {id: 11, title: "feed for animals", company_id: 1},
  {id: 12, title: "oilseeds", company_id: 1},
  {id: 13, title: "meat", company_id: 1},
  {id: 14, title: "honey", company_id: 1},
  {id: 15, title: "flour", company_id: 1},
  {id: 16, title: "nuts", company_id: 1},
  {id: 17, title: "vegetable oil", company_id: 1},
  {id: 18, title: "seafood", company_id: 1},
  {id: 19, title: "seed ang seedlings", company_id: 1},
  {id: 20, title: "sugar", company_id: 1},
  {id: 21, title: "vegetables", company_id: 1},
  {id: 22, title: "wheat", company_id: 1},
  {id: 23, title: "wood", company_id: 1},
  {id: 24, title: "fertilizers and chemicals", company_id: 1}
])

Product.create!([
  {id: 1001, title: "solidol", company_id: 2, category_id: 1002},
  {id: 1002, title: "aircraft oils", company_id: 2, category_id: 1005},
  {id: 1003, title: "cylinder oil", company_id: 2, category_id: 1009},
  {id: 1004, title: "oil gear", company_id: 2, category_id: 1007},
  {id: 1005, title: "transformer oil", company_id: 2, category_id: 1008},
  {id: 1006, title: "jet fuel", company_id: 2, category_id: 1013},
  {id: 1007, title: "fuel briquettes", company_id: 2, category_id: 1014},
  {id: 1008, title: "gas condensate", company_id: 2, category_id: 1016},
  {id: 1009, title: "transportation of petroleum products", company_id: 2, category_id: 1017},
  {id: 1010, title: "heating oil", company_id: 2, category_id: 1018},
  {id: 1011, title: "marine fuels", company_id: 2, category_id: 1019},
  {id: 1012, title: "hydraulic oil", company_id: 2, category_id: 1021},
  {id: 1013, title: "oil-coolant", company_id: 2, category_id: 1022},
  {id: 1014, title: "compressor oils", company_id: 2, category_id: 1023},
  {id: 1015, title: "vacuum oil", company_id: 2, category_id: 1024},
  {id: 1016, title: "turbine oil", company_id: 2, category_id: 1025},
  {id: 1017, title: "oil ship", company_id: 2, category_id: 1026},
  {id: 1018, title: "petrol", company_id: 2, category_id: 1027},
  {id: 1019, title: "technical vaseline", company_id: 2, category_id: 1028},
  {id: 1020, title: "diesel fuel", company_id: 2, category_id: 1029},
  {id: 1021, title: "gasoil", company_id: 2, category_id: 1030},
  {id: 1022, title: "motor oil", company_id: 2, category_id: 1031},
  {id: 1023, title: "castor oil", company_id: 2, category_id: 1032},
  {id: 1024, title: "bitumen", company_id: 2, category_id: 1033},
  {id: 1025, title: "biocatalyst fuel", company_id: 2, category_id: 1034},
  {id: 1026, title: "coal", company_id: 2, category_id: 1035},
  {id: 1027, title: "firewood", company_id: 2, category_id: 1036},
  {id: 1028, title: "coolant", company_id: 2, category_id: 1001},
  {id: 1029, title: "emulsol", company_id: 2, category_id: 1001},
  {id: 1030, title: "kerosene", company_id: 2, category_id: 1003},
  {id: 1031, title: "fuel oil", company_id: 2, category_id: 1004},
  {id: 1032, title: "machine oil", company_id: 2, category_id: 1005},
  {id: 1033, title: "circulating oil", company_id: 2, category_id: 1005},
  {id: 1034, title: "oil mills", company_id: 2, category_id: 1005},
  {id: 1035, title: "oil hardening", company_id: 2, category_id: 1005},
  {id: 1036, title: "oil for the food industry", company_id: 2, category_id: 1005},
  {id: 1037, title: "spindle oil", company_id: 2, category_id: 1005},
  {id: 1038, title: "flushing oil", company_id: 2, category_id: 1009},
  {id: 1039, title: "instrumentation oil", company_id: 2, category_id: 1009},
  {id: 1040, title: "vaseline oil", company_id: 2, category_id: 1009},
  {id: 1041, title: "mills oil", company_id: 2, category_id: 1009},
  {id: 1042, title: "cylinder oil", company_id: 2, category_id: 1009},
  {id: 1043, title: "technical vegetable oils", company_id: 2, category_id: 1009},
  {id: 1044, title: "foundry coke", company_id: 2, category_id: 1010},
  {id: 1045, title: "coke coal", company_id: 2, category_id: 1010},
  {id: 1046, title: "breeze coke", company_id: 2, category_id: 1010},
  {id: 1047, title: "electrode coke", company_id: 2, category_id: 1010},
  {id: 1048, title: "conservation oils", company_id: 2, category_id: 1011},
  {id: 1049, title: "crude oil", company_id: 2, category_id: 1015},
  {id: 1050, title: "oil trading", company_id: 2, category_id: 1015},
  {id: 1051, title: "litol", company_id: 2, category_id: 1020},
  {id: 1052, title: "ciatim", company_id: 2, category_id: 1020},
  {id: 1053, title: "torsiol", company_id: 2, category_id: 1020},
  {id: 1054, title: "graphite", company_id: 2, category_id: 1020},
  {id: 1055, title: "fiol", company_id: 2, category_id: 1020},
  {id: 1056, title: "armatol", company_id: 2, category_id: 1020},
  {id: 1057, title: "uniol", company_id: 2, category_id: 1020},
  {id: 1058, title: "buksol", company_id: 2, category_id: 1020},
])

Category.create!([
  {id: 1001, title: "coolants", company_id: 2},
  {id: 1002, title: "solidol", company_id: 2},
  {id: 1003, title: "kerosene", company_id: 2},
  {id: 1004, title: "fuel oil", company_id: 2},
  {id: 1005, title: "industrial oil", company_id: 2},
  {id: 1006, title: "cylinder oil", company_id: 2},
  {id: 1007, title: "oil gear", company_id: 2},
  {id: 1008, title: "transformer oil", company_id: 2},
  {id: 1009, title: "special oils", company_id: 2},
  {id: 1010, title: "coke", company_id: 2},
  {id: 1011, title: "conservation oils", company_id: 2},
  {id: 1012, title: "axial oil", company_id: 2},
  {id: 1013, title: "jet fuel", company_id: 2},
  {id: 1014, title: "fuel briquettes", company_id: 2},
  {id: 1015, title: "oil", company_id: 2},
  {id: 1016, title: "gas condensate", company_id: 2},
  {id: 1017, title: "transportation of petroleum products", company_id: 2},
  {id: 1018, title: "heating oil", company_id: 2},
  {id: 1019, title: "marine fuels", company_id: 2},
  {id: 1020, title: "greases", company_id: 2},
  {id: 1021, title: "hydraulic oil", company_id: 2},
  {id: 1022, title: "oil-coolant", company_id: 2},
  {id: 1023, title: "compressor oils", company_id: 2},
  {id: 1024, title: "vacuum oil", company_id: 2},
  {id: 1025, title: "turbine oil", company_id: 2},
  {id: 1026, title: "oil ship", company_id: 2},
  {id: 1027, title: "petrol", company_id: 2},
  {id: 1028, title: "technical vaseline", company_id: 2},
  {id: 1029, title: "diesel fuel", company_id: 2},
  {id: 1030, title: "gasoil", company_id: 2},
  {id: 1031, title: "motor oil", company_id: 2},
  {id: 1032, title: "castor oil", company_id: 2},
  {id: 1033, title: "bitumen", company_id: 2},
  {id: 1034, title: "biocatalyst fuel", company_id: 2},
  {id: 1035, title: "coal", company_id: 2},
  {id: 1036, title: "firewood", company_id: 2},
  {id: 1037, title: "aircraft oils", company_id: 2},
])

Product.create([
  {id: 2001, title: "boards", category_id: 2001, company_id: 3},
  {id: 2002, title: "brus", category_id: 2002, company_id: 3},
  {id: 2003, title: "wooden moldings", category_id: 2003, company_id: 3},
  {id: 2004, title: "molded", category_id: 2004, company_id: 3},
  {id: 2005, title: "lining", category_id: 2005, company_id: 3},
  {id: 2006, title: "bruschi", category_id: 2006, company_id: 3},
  {id: 2007, title: "log houses", category_id: 2007, company_id: 3},
  {id: 2008, title: "block house", category_id: 2008, company_id: 3},
  {id: 2009, title: "imitation of beam", category_id: 2010, company_id: 3},
  {id: 2010, title: "logs cylindered", category_id: 2011, company_id: 3},
  {id: 2011, title: "planken", category_id: 2012, company_id: 3},
  {id: 2012, title: "wood logs", category_id: 2013, company_id: 3},
  {id: 2013, title: "wooden sleepers", category_id: 2014, company_id: 3},
  {id: 2014, title: "pallet harvesting", category_id: 2015, company_id: 3},
  {id: 2015, title: "firewood", category_id: 2009, company_id: 3},
  {id: 2016, title: "pellets", category_id: 2009, company_id: 3},
  {id: 2017, title: "sawdust", category_id: 2009, company_id: 3},
  {id: 2018, title: "slab", category_id: 2009, company_id: 3},
  {id: 2019, title: "wood chips", category_id: 2009, company_id: 3},
  {id: 2020, title: "bark", category_id: 2009, company_id: 3},
  {id: 2021, title: "excelsior", category_id: 2009, company_id: 3},
])

Category.create([
  {id: 2001, title: "boards", company_id: 3},
  {id: 2002, title: "brus", company_id: 3},
  {id: 2003, title: "wooden moldings", company_id: 3},
  {id: 2004, title: "molded", company_id: 3},
  {id: 2005, title: "lining", company_id: 3},
  {id: 2006, title: "bruschi", company_id: 3},
  {id: 2007, title: "log houses", company_id: 3},
  {id: 2008, title: "block house", company_id: 3},
  {id: 2009, title: "wood waste", company_id: 3},
  {id: 2010, title: "imitation of beam", company_id: 3},
  {id: 2011, title: "logs cylindered", company_id: 3},
  {id: 2012, title: "planken", company_id: 3},
  {id: 2013, title: "wood logs", company_id: 3},
])

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end