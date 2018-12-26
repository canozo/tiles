--[[
https://github.com/kikito/love-tile-tutorial/wiki
love2d general syntax
read http://lua-users.org/wiki/PatternsTutorial
--]]

-- load stuff at the start inside love.load() call
function love.load()
    -- tables
    this_are_tables = {'can', 'i', 'have', 'a', 'boneless', 'pizza'}

    -- tables are arrays and dictionaries
    quote_on_quote_dictionary = {['my dick'] = 'big', ['Kappa'] = 'Pride'}
    -- note that arrays on Lua start from 1 and not from 0
    local this_are_not_arrays = [[This is actually a string
                                  and it can be multiline]]
    local my_secret_msg = 'this message is nil outside this scope'

    counter = 0 -- is a global variable
end

-- draw stuff onscreen inside love.draw() call
function love.draw()
    -- print on screen, you can only print on love.draw() calls
    love.graphics.print(quote_on_quote_dictionary['my dick'], 600, 50)

    -- if else
    local condition = false
    local another_condition = true

    -- multiple declaration in one line
    local rand_num, rand_num_two = math.random(500, 515), math.random(500, 515)

    if condition then
        love.graphics.print('UwU', rand_num, rand_num_two)
    elseif another_condition then
        love.graphics.print('TRIGGERED', rand_num, rand_num_two)
    else
        love.graphics.print('else', 1, 1)
    end

    -- for loop
    for i = 1, 6 do
        local my_msg = 'ayy' .. i -- append strings with ..
        local j = 200 * i
        love.graphics.print(my_msg, j, j)
    end

    -- the # operator gets the length of the stuff
    for i = 1, #this_are_tables do
        local j = 15 * i
        local my_msg = 'strlen=' .. #this_are_tables[i] .. ',\t' .. this_are_tables[i]
        love.graphics.print(my_msg, j, j)
    end

    -- for each:
    local primes = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41}
    local gap = 50
    love.graphics.print('primes: ', 0, 150)

    for _, prime in ipairs(primes) do
        love.graphics.print(prime.. ', ', gap, 150)
        gap = gap + 22
    end

    -- while shenanigans
    local limit = counter + 10
    while counter < limit do
        love.graphics.print('AAAAAAAAAAAAAAAAAAAAAAA', 250, counter)
        counter = counter + 1
    end
    if counter > 600 then counter = 0 end

    -- repeat-until: its like a while true with a break
    -- modulus example: 5728 % 7 = 2
    local mod_this = 5728
    local mod_by = 7
    repeat
        mod_this = mod_this - mod_by
    until mod_this < mod_by
end
