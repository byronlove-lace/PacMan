#!/bin/lua


_G.love = require("love")

function love.load()

        _G.number = 0
        _G.pacman = {}
        pacman.x = 100
        pacman.y = 200

        x = 10 
        y = 10 + x

        _G.food = {
                x = 600,
                y = 200,
                eaten = false
        }

        pacman.mouth = {27.5, 332.5}

        love.graphics.setBackgroundColor(0.5, 0.5, 1, 1)
end

function love.update(dt)
        number = number + 1
--[[
        if pacman.mouth[1] == open_start then
                pacman.mouth[1] = closed_start
                pacman.mouth[2] = closed_end
        elseif pacman.mouth[1] == closed_start then
                pacman.mouth[1] = open_start
                pacman.mouth[2] = open_end
        end
--]]

        if love.keyboard.isDown("d") then
                pacman.x = pacman.x + 3
                pacman.mouth[1] = 27.5 
                pacman.mouth[2] = 332.5 
                
        end
        if love.keyboard.isDown("a") then
                pacman.x = pacman.x - 3
                pacman.mouth[1] = 27.5 + 180
                pacman.mouth[2] = 332.5 + 180
        end
        if love.keyboard.isDown("w") then
                pacman.y = pacman.y - 3
                pacman.mouth[1] = 27.5 + 270
                pacman.mouth[2] = 332.5 + 270
        end
        if love.keyboard.isDown("s") then
                pacman.y = pacman.y + 3
                pacman.mouth[1] = 27.5 + 90
                pacman.mouth[2] = 332.5 + 90
        end
end

function love.draw()
        if not food.eaten then
                love.graphics.setColor(1, 1, 1)
                love.graphics.rectangle("fill", food.x, food.y, 35, 35)
        end

        if pacman.x >= food.x + 5 then
                if pacman.y >= food.y + 5 then
                        food.eaten = true
                end
        end

        love.graphics.print(number)
        love.graphics.setColor(252/255, 243/255, 63/255, 1)
        love.graphics.arc("fill", 
        "pie", 
        pacman.x, 
        pacman.y, 
        50, 
        pacman.mouth[1] * (math.pi / 180), 
        pacman.mouth[2] * (math.pi / 180)
        )
end

