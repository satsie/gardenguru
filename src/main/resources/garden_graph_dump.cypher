begin
create constraint on (n:`NodeController`) assert n.`uuid` is unique
create constraint on (n:`Plant`) assert n.`uuid` is unique
create constraint on (n:`Vegetable`) assert n.`uuid` is unique
create (_0:`Vegetable` {`description`:"A spring vegetable", `name`:"Asparagus"})
create (_1:`Fruit` {`description`:"A glossy red, or occasionally yellow, pulpy edible fruit that is typically eaten as a vegetable or in salad.", `name`:"Tomatoes", `nutrition`:"Good source of vitamins A & C, and the phytonutrient lycopene"})
create (_2:`Herb` {`name`:"Basil"})
create (_3:`Bug` {`name`:"Slugs"})
create (_4:`Bug` {`name`:"Snails"})
create (_5:`Bug` {`name`:"Butterflies"})
create (_6:`Fruit` {`name`:"Grapes"})
create (_7:`Herb` {`name`:"Dill"})
create (_8:`Vegetable` {`name`:"Broccoli"})
create (_9:`Vegetable` {`name`:"Cabbage"})
create (_10:`Vegetable` {`name`:"Corn"})
create (_11:`Vegetable` {`name`:"Carrots"})
create (_12:`Bug` {`name`:"Mosquitoes"})
create (_15:`Herb` {`name`:"Lemon Balm"})
create (_16:`Vegetable` {`name`:"Beets"})
create (_17:`Vegetable` {`name`:"Lettuce"})
create (_18:`Herb` {`name`:"Parsley"})
create (_19:`Vegetable` {`name`:"Spinach"})
create (_20:`Vegetable` {`name`:"Cauliflower"})
create (_21:`Herb` {`name`:"Mustard"})
create (_22:`Vegetable` {`name`:"Onions"})
create (_23:`Vegetable` {`name`:"Celery"})
create (_24:`Vegetable` {`name`:"Cucumbers"})
create (_25:`Vegetable` {`name`:"Potatoes"})
create (_26:`Herb` {`name`:"Sage"})
create (_27:`Flower` {`name`:"Sunflowers"})
create (_28:`Herb` {`name`:"Lavender"})
create (_29:`Herb` {`name`:"Mint"})
create (_30:`Fruit` {`name`:"Raspberries"})
create _0-[:`HELPS`]->_19
create _0-[:`HELPS`]->_18
create _0-[:`HELPS`]->_17
create _0-[:`HELPS`]->_16
create _0-[:`HELPS`]->_1
create _1-[:`AVOID`]->_7
create _1-[:`HELPS`]->_0
create _2-[:`REPELS`]->_12
create _2-[:`ATTRACTS`]->_5
create _2-[:`ATTRACTS`]->_4
create _2-[:`ATTRACTS`]->_3
create _2-[:`HELPS`]->_0
create _2-[:`HELPS`]->_1
create _6-[:`AVOID`]->_9
create _7-[:`AVOID`]->_11
create _7-[:`AVOID`]->_1
create _7-[:`HELPS`]->_10
create _7-[:`HELPS`]->_9
create _7-[:`HELPS`]->_8
create _7-[:`HELPS`]->_0
create _8-[:`HELPS`]->_16
create _8-[:`AVOID`]->_1
create _8-[:`AVOID`]->_17
create _8-[:`AVOID`]->_20
create _8-[:`AVOID`]->_9
create _8-[:`HELPS`]->_26
create _8-[:`HELPS`]->_25
create _8-[:`HELPS`]->_22
create _8-[:`HELPS`]->_24
create _8-[:`HELPS`]->_23
create _11-[:`AVOID`]->_7
create _15-[:`REPELS`]->_12
create _16-[:`HELPS`]->_0
create _16-[:`HELPS`]->_22
create _16-[:`AVOID`]->_21
create _16-[:`HELPS`]->_17
create _16-[:`HELPS`]->_20
create _16-[:`HELPS`]->_8
create _20-[:`HELPS`]->_16
create _24-[:`Helps`]->_27
create _24-[:`AVOID`]->_25
create _26-[:`ATTRACTS`]->_5
create _28-[:`ATTRACTS`]->_5
create _28-[:`REPELS`]->_12
create _29-[:`ATTRACTS`]->_5
create _29-[:`HELPS`]->_18
create _30-[:`AVOID`]->_25
;
commit
