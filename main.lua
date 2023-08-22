#!/bin/lua


_G.love = require("love")

function love.load()

        _G.number = 0
        _G.pacman = {}
        pacman.x = 100
        pacman.y = 200
        pacman.mouth = {27.5, 332.5}

        _G.boarder = {
                left = {1, 1, 1, 600},
                right = {800, 1, 800, 600},
                down = {1, 600, 800, 600},
                up = {1, 1, 800, 1}
        }

        _G.food = {
                x = 600,
                y = 200,
                eaten = false
        }


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
                pacman.mouth[1] = 27.5 
                pacman.mouth[2] = 332.5 

                if pacman.x >= 750 then
                        pacman.x = 750
                else
                        pacman.x = pacman.x + 3
                end
        end

        if love.keyboard.isDown("a") then
                pacman.mouth[1] = 27.5 + 180
                pacman.mouth[2] = 332.5 + 180

                if pacman.x <= 50 then
                        pacman.x = 50
                else
                        pacman.x = pacman.x - 3
                end

        end
        if love.keyboard.isDown("w") then
                pacman.mouth[1] = 27.5 + 270
                pacman.mouth[2] = 332.5 + 270

                if pacman.y <= 50 then
                        pacman.y = 50
                else
                        pacman.y = pacman.y - 3
                end
        end

        if love.keyboard.isDown("s") then
                pacman.mouth[1] = 27.5 + 90
                pacman.mouth[2] = 332.5 + 90

                if pacman.y >= 550 then
                        pacman.y = 550
                else
                        pacman.y = pacman.y + 3
                end
        end
end

function love.draw()

        love.graphics.line(boarder.left)
        love.graphics.line(boarder.right)
        love.graphics.line(boarder.up)
        love.graphics.line(boarder.down)

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

