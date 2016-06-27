function love.load()
   hamster = love.graphics.newImage("hamster.png")
   x = 50
   y = 50

   width, height = love.window.getDesktopDimensions()  
   love.window.setMode(width, height-50,{resizable = true})
  
   
end
 
function love.draw()
   love.graphics.draw(hamster, x, y)
end