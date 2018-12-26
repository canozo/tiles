local tileString = [[
#%%%%%%%%%%%%%%%%%%%%%%%#
#      ^        ^   ^   #
#    ^         ^    ^   #
#      ^    ^           #
#    ^        ^^        #
# ^       ^             #
#    ^     ^            #
#              ^    ^   #
#           ^           #
#              ^        #
#    ^     ^            #
# ^          ^        ^ #
#         ^^^           #
# ^         ^   ^     ^ #
#        ^              #
#     ^^       ^    ^   #
#  ^       ^      ^     #
#########################
]]

local quadInfo = {
  { ' ',  0,  0 }, -- monte
  { '^',  0, 32 }, -- monte bonito
  { '%', 32,  0 }, -- caja
  { '#', 32, 32 }  -- caja desde arriba
}

newMap(32, 32, '/images/countryside.png', tileString, quadInfo)
