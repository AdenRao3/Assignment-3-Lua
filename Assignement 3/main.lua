-----------------------------------------------------------------------------------------
--
-- Created by: Aden Rao
-- Created on: March 8th, 2019
--
-- This program you choose how many toppings you want on your pizza anywhere from 1 to 4 and you enter in a text feild. Once you that you click a size either extra large or large and then what will happen is the program will give you the subtotal, taxes and the total cost.
-----------------------------------------------------------------------------------------

-- Hides the status bar
-------------------
display.setStatusBar(display.HiddenStatusBar)
-------------------

--Backround Image 
-----------------
local backgroundimage = display.newImageRect( "assets/background.jpg", 499, 795)
backgroundimage.x = display.contentCenterX
backgroundimage.y = display.contentCenterY
-----------------

--Title
---------------
local title = display.newImageRect( "assets/title.png", 375, 550)
title.x = display.contentCenterX 
title.y = display.contentCenterY - 5
---------------

-- Text telling the user to select which size pizza they want
---------------
local chooseapizzatext = display.newImageRect( "assets/text telling user to choose a size of pizza.png", 375, 550)
chooseapizzatext.x = display.contentCenterX 
chooseapizzatext.y = display.contentCenterY + 5
---------------

-- Buttons for the size of the pizza (large and x-large)
-----------------
local enterLarge = display.newImageRect( 'assets/large button.png', 120, 50)
enterLarge.x = display.contentCenterX
enterLarge.y = display.contentCenterY + 125
enterLarge.id = 'Enter Large Button'
local enterXLarge = display.newImageRect( 'assets/xtra large button.png', 120, 50)
enterXLarge.x = display.contentCenterX
enterXLarge.y = display.contentCenterY + 65
enterXLarge.id = 'Enter XLarge Button'
------------------

-- Toppings Text Field and toppings text
-----------------
local toppingstext = display.newImageRect( "assets/topping text.png", 375, 600)
toppingstext.x = display.contentCenterX 
toppingstext.y = display.contentCenterY - 145

local toppingsTextField = native.newTextField( display.contentCenterX, display.contentCenterY - 50, 300, 50)
toppingsTextField.id = 'toppings entered'
-----------------

local toppings

-- Function for calculating the cost of a large pizza and extra large pizza
----------------------------------
local function calculatePrice( event )

	local tax = subtotal * 0.13
	local total = subtotal + tax
	local showSubtotal = display.newText( 'Subtotal: $' .. string.format("%.2f", subtotal), display.contentCenterX, display.contentCenterY + 170, native.systemFont, 38 )
	showSubtotal:setTextColor( 0, 0, 255)
	local showTax = display.newText( 'Tax: $' .. string.format("%.2f", tax), display.contentCenterX, display.contentCenterY + 215, native.systemFont, 38 )
	showTax:setTextColor( 0, 0, 255 )
	local showTotal = display.newText( 'Total: $' .. string.format("%.2f", total), display.contentCenterX, display.contentCenterY + 260, native.systemFont, 38 )
	showTotal:setTextColor( 0, 0, 255 )
end
----------------------------------

-- Calculates the subtotal of a large pizza and there is an if statement so the program can determine the right cost based on many toppings were entered in the toppings text field. Then the function calls calculate price to finish and show the costs
local function onLargeTouch( event )

	toppings = tonumber( toppingsTextField.text )

	if toppings == 1 then
		subtotal = 6 + 1
		calculatePrice()
	elseif toppings == 2 then
		subtotal = 6 + 1.75
		calculatePrice()
	elseif toppings == 3 then
		subtotal = 6 + 2.5
		calculatePrice()
	elseif toppings == 4 then
		subtotal = 6 + 3.35
		calculatePrice()
	else 
		local errorText = display.newText( 'Invalid # of toppings', display.contentCenterX, display.contentCenterY + 200, native.systemFont, 35 )
		errorText:setTextColor( 0, 0, 255 )
	end	
end

-- Calculates the subtotal of an extra large pizza and there is an if statement so the program can determine the right cost based on many toppings were entered in the toppings text field. Then the function calls calculate price to finish and show the costs
local function onExtraLargeTouch( event )
	
	toppings = tonumber( toppingsTextField.text )
	
	if toppings == 1 then
		subtotal = 10 + 1
		calculatePrice()
	elseif toppings == 2 then
		subtotal = 10 + 1.75
		calculatePrice()
	elseif toppings == 3 then
		subtotal = 10 + 2.5
		calculatePrice()
	elseif toppings == 4 then
		subtotal = 10 + 3.35
		calculatePrice()
	else 
		local errorText = display.newText( 'Invalid # of toppings', display.contentCenterX, display.contentCenterY + 200, native.systemFont, 35 )
		errorText:setTextColor( 0, 0, 255 )
	end	
end

enterLarge:addEventListener( 'touch', onLargeTouch)
enterXLarge:addEventListener( 'touch', onExtraLargeTouch)
