#!/bin/lua


_G.love = require("love")

function love.load()
        _G.number = 0
        _G.pacman = {}
        pacman.x = 100
        pacman.y = 200

        open_start = 27.5 * (math.pi / 180)
        open_end = 332.5 * (math.pi / 180)
        closed_start = 0 * (math.pi / 180)
        closed_end = 360 * (math.pi / 180)

        pacman.mouth = {open_start, open_end}
        love.graphics.setBackgroundColor(0.5, 0.5, 1, 1)
end

function love.update(dt)
        number = number + 1
        pacman.x = pacman.x + 1

        if pacman.mouth[1] == open_start then
                pacman.mouth[1] = closed_start
                pacman.mouth[2] = closed_end
        elseif pacman.mouth[1] == closed_start then
                pacman.mouth[1] = open_start
                pacman.mouth[2] = open_end
        end
end


function love.draw()
        love.graphics.print(number)
        love.graphics.setColor(252/255, 243/255, 63/255, 1)
        love.graphics.arc("fill", "pie", pacman.x, pacman.y, 50, pacman.mouth[1], pacman.mouth[2])
end

