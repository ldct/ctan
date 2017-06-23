% File `DocLevel.js'

% Copyright 2012--2013 Luis González, Javier Toro, Pedro Linares

% This material is subject to the LaTeX Project Public License. See
%   http://www.ctan.org/tex-archive/help/Catalogue/licenses.lppl.html
% for the details of that license.

\inta@addJS{
var option = /* option constants */
{
	error    : 0,
	left     : 1,
	right    : 2,
	above    : 3,
	below    : 4,
	from     : 5,
	start    : 6,
	center   : 7,
	end      : 8
};
%
/* Adds methods and properties to fields to facilitate manipuling them */
function extendField(field)
{
	field.startX = field.rect[0];
	field.endX = field.rect[2];
	field.startY = field.rect[1];
	field.endY = field.rect[3];
	/* If the coordinates are inverted */
	if(field.startX > field.endX)
	{
		field.startX = field.rect[2];
		field.endX = field.rect[0];
	}
	if(field.startY > field.endY)
	{
		field.startY = field.rect[3];
		field.endY = field.rect[1];
	}
	/* width and height are calculated and stored */
	field.width = field.endX - field.startX;
	field.height = field.endY - field.startY;
	/* Central points */
	field.centerX = field.startX + (field.width / 2);
	field.centerY = field.startY + (field.height / 2);
	/* Function to move to a given coordinates */
	field.moveTo = function(x, y)
	{
		field.startX = x;
		field.startY = y;
		field.endX = x + field.width;
		field.endY = y + field.height;
		field.centerX = field.startX + (field.width / 2);
		field.centerY = field.startY + (field.height / 2);
		field.rect = [field.startX, field.startY, field.endX, field.endY];
	};
	/* Function to move to the left of a point */
	field.moveToLeft = function(x, y)
		{ field.moveTo(x - field.width, y - (field.height / 2)); };
	/* Function to move to the right of a point */
	field.moveToRight = function(x, y)
		{ field.moveTo(x, y - (field.height / 2)); };
	/* Function to move above a point */
	field.moveAbove = function(x, y)
		{ field.moveTo(x - (field.width / 2), y); };
	/* Function to move below a point */
	field.moveBelow = function(x, y)
		{ field.moveTo(x - (field.width / 2), y - field.height); };
	/* Function to move centering on a point */
	field.moveCenter = function(x, y)
		{ field.moveTo(x - (field.width / 2), y - (field.height / 2)); };
	/* Function to scale according to a numeric constant */
	field.scale = function(c)
	{
		field.width *= c;
		field.height *= c;
		field.moveTo(field.startX, field.startY);
		field.textSize *= c;
	};
%
	/* Animation frame function - insert a button and place it into frame */
	field.addButton = function(newButton)
	{
		newButton.display = display.hidden; /* Initially, all buttons and frames will be hidden */
		newButton.parentFrame = field;
		newButton.originalFillColor = newButton.fillColor;
		newButton.originalBorderWidth = newButton.borderWidth;
		newButton.originalPosition = newButton.buttonPosition;
%
		/* Optional specifications */
		if(typeof newButton.transparent != "undefined")
		{
			newButton.makeTransparent(true);
			newButton.setAction( /* transparent buttons should not hold focus */
				"OnFocus",
				field.name + ".releaseFocus();"
			);
		}
		else
			newButton.transparent = false;
		if(typeof newButton.toggleHidden != "undefined")
		{
			newButton.setAction(
				"MouseEnter",
				newButton.name + ".makeTransparent(false);"
			);
			newButton.setAction(
				"MouseExit",
				newButton.name + ".makeTransparent(true);"
			);
		}
		else
			newButton.toggleHidden = false;
		if(typeof newButton.timeSpan == "undefined")
			newButton.timeSpan = 1000; /* Milliseconds */
		if(typeof newButton.keep == "undefined")
			newButton.keep = false;
		field.buttons.push(newButton);
%
		/* if it is first button, places it in left upper corner. Otherwise, to the right of previous button */
		if(typeof newButton.relatPosition == "undefined") /* Position option not specified */
		{
			if(field.buttons.length == 1)
			{
				newButton.moveTo(field.startX , field.endY - newButton.height);
				return;
			}
			else
			{
				newButton.relatPosition = option.right;
				delete newButton.pointX;
				delete newButton.pointY;
				delete newButton.positionX;
				delete newButton.positionY;
			}
		}
%
		/**
		* if it was given an alias instead a coordinate (like start or end)
		* assigngs its corresponding numeric value to X coordinate
		*/
		if(typeof newButton.positionX != "undefined")
			switch(newButton.positionX)
			{
				case option.start:
					newButton.pointX = field.startX;
					break;
				case option.center:
					newButton.pointX = field.centerX;
					break;
				case option.end:
					newButton.pointX = field.endX;
					break;
				default:
					console.println("There was an error processing argument of X coordinate ");
					console.show();
			}
		else if(typeof newButton.pointX != "undefined") /* If it was given X coordinate, traslade it into animation */
			newButton.pointX += field.startX;
%
		/* Now the same thing with Y coordinate */
		if(typeof newButton.positionY != "undefined")
			switch(newButton.positionY)
			{
				case option.start:
					newButton.pointY = field.startY;
					break;
				case option.center:
					newButton.pointY = field.centerY;
					break;
				case option.end:
					newButton.pointY = field.endY;
					break;
				default:
					console.println("There was an error processing argument of Y coordinate ");
					console.show();
			}
		else if(typeof newButton.pointY != "undefined")
			newButton.pointY += field.startY;
%
		/* If pointX or pointY are not defined, it assumes that the button is the reference point */
		if(typeof newButton.pointX == "undefined"
		|| typeof newButton.pointY == "undefined")
		{
			var previousButton = field.buttons[field.buttons.length - 2];
			switch(newButton.relatPosition)
			{
				case option.left:
					newButton.pointX = previousButton.startX;
					newButton.pointY = previousButton.centerY;
					break;
				case option.from:
					newButton.relatPosition = option.right;
				case option.right:
					newButton.pointX = previousButton.endX;
					newButton.pointY = previousButton.centerY;
					break;
				case option.above:
					newButton.pointX = previousButton.centerX;
					newButton.pointY = previousButton.endY;
					break;
				case option.below:
					newButton.pointX = previousButton.centerX;
					newButton.pointY = previousButton.startY;
					break;
				case option.center:
					newButton.pointX = previousButton.centerX;
					newButton.pointY = previousButton.centerY;
					break;
				default:
					console.println("There was an error placing a button");
					console.show();
			}
		}
%
		/* now it is time for placing the button */
		switch(newButton.relatPosition)
		{
			case option.left:
				newButton.moveToLeft(newButton.pointX, newButton.pointY);
				break;
			case option.right:
				newButton.moveToRight(newButton.pointX, newButton.pointY);
				break;
			case option.above:
				newButton.moveAbove(newButton.pointX, newButton.pointY);
				break;
			case option.below:
				newButton.moveBelow(newButton.pointX, newButton.pointY);
				break;
			case option.from:
				newButton.moveTo(newButton.pointX, newButton.pointY - newButton.height);
				break;
			case option.center:
				newButton.moveCenter(newButton.pointX, newButton.pointY);
				break;
			default:
				console.println("There was an error placing a button" + i);
				console.show();
			} 
	};
%
	/* Animation frame function - hide all buttons associated with the frame */
	field.hideButtons = function()
	{
		for(var i in field.buttons)
		{
			field.buttons[i].display = display.hidden;
			if(field.buttons[i].toggleHidden)
				field.buttons[i].makeTransparent(false);
		}
	};
%
	/* Animation frame function - makes visible all buttons associated with the frame */
	field.showButtons = function()
	{
		for(var i in field.buttons)
		{
			field.buttons[i].display = display.visible;
			if(field.buttons[i].toggleHidden)
				field.buttons[i].makeTransparent(true);
		}
	};
%
	/* Animation frame function - set focus to last button */
	field.releaseFocus = function()
	{
		if(length = field.buttons.length)
			field.buttons[length - 1].setFocus();
	};
%
	/* Animation widget function - add a frame */
	field.addFrame = function(newFrame)
	{
		if(typeof field.frames == "undefined")
			field.frames = new Array(); /* Frames to be displayed by the animation */
		newFrame.buttons = new Array(); /* Buttons that are into the animation frame */
		newFrame.width = field.width;
		newFrame.height = field.height;
		newFrame.moveTo(field.startX, field.startY);
		newFrame.display = display.hidden; /* Initially, all buttons and frames will be hidden */
		field.frames.push(newFrame);
	};
%
	/* Animation widget function - Displays the specified frame and hide current */
	field.displayFrame = function(frameIndex)
	{
		if(typeof frameIndex == "string") /* if was given a name instead of a index */
			frameIndex = field.frames.indexOf(field.doc.getField(frameIndex));
		if(typeof field.frames == "undefined"
		  || frameIndex >= field.frames.length) /* discards invalid argument */
			return;
%
		/* If it is not first time, hides current frame */
		if(typeof field.currentFrame != "undefined")
		{
			field.frames[field.currentFrame].hideButtons();
			field.frames[field.currentFrame].display = display.hidden;
		}
%
		/* Now displays the specified frame */
		field.frames[frameIndex].showButtons();
		field.frames[frameIndex].delay = true;
		field.frames[frameIndex].display = display.visible;
		field.frames[frameIndex].delay = false;
		field.currentFrame = frameIndex;
	};
%
	/* Animation widget function - displays first frame */
	field.displayFirstFrame = function()
	{
		field.displayFrame(0);
	};
%
	/* Animation widget function - displays last frame */
	field.displayLastFrame = function()
	{
		field.displayFrame(field.frames.length - 1);
	};
%
	/* Animation widget function - displays previous frame */
	field.displayPreviousFrame = function()
	{
		if(field.currentFrame == 0)
			field.displayLastFrame();
		else
			field.displayFrame(field.currentFrame - 1);
	};
%
	/* Animation widget function - displays next frame */
	field.displayNextFrame = function()
	{
		if(field.currentFrame == field.frames.length - 1)
			field.displayFirstFrame();
		else
			field.displayFrame(field.currentFrame + 1);
	};
%
	/* Control button function - add an image sequence */
	field.addImage = function(imageName)
	{
		field.images.push(field.doc.getIcon(imageName));
	};
%
	/* Control button function - makes button transparent or return it to visible */
	field.makeTransparent = function(transparent)
	{
		field.delay = true;
		if(transparent)
		{
			field.fillColor = color.transparent;
			field.borderWidth = 0;
			if(field.toggleHidden && !field.transparent) /* if only hidden, makes fully invisible */
				field.buttonPosition = position.iconOnly;
		}
		else
		{
			field.fillColor = field.originalFillColor;
			field.borderWidth = field.originalBorderWidth;
			field.buttonPosition = field.originalPosition;
		}
		field.delay = false;
	};
%
	/* Control button function - action to perform when a button is pressed */
	field.buttonAction = function()
	{
		/* Displays the image sequence only if exist */
		if(field.images.length == 0)
			field.targetAction();
		else
		{
			field.parentFrame.hideButtons();
			field.parentFrame.readonly = false;
			field.originalIcon = field.parentFrame.buttonGetIcon();
			field.currentImage = 0;
			field.interval = app.setInterval(
				field.name + ".playAnimation()",
				field.timeSpan
			);
			field.parentFrame.buttonSetIcon(field.images[0]);
			field.parentFrame.setAction(
				"MouseDown",
				field.name + ".stopAnimation();"
			);
			}
	};
%
	/* Control button function - animation function to be called in time intervals */
	field.playAnimation = function()
	{
		field.currentImage++;
		if(field.keep && field.currentImage == field.images.length)
			field.currentImage = 0;
		if(field.currentImage == field.images.length) /* all images were displayed */
			field.stopAnimation();
		else
		{
			field.parentFrame.delay = true;
			field.parentFrame.buttonSetIcon(field.images[field.currentImage]);
			field.parentFrame.delay = false;
		}
	};
%
	/* Control button function - stops animation function */
	field.stopAnimation = function()
	{
		app.clearInterval(field.interval);
		field.targetAction();
		field.parentFrame.buttonSetIcon(field.originalIcon);
		field.parentFrame.readonly = true;
	};
%
	return field;
}/* End of extendField() */
} \endinput
