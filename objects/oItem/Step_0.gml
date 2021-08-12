if easeIn
{
	if timer < duration 
	{
	    timer ++;
	    xScale = EaseSine(timer, 1.2, -0.6, duration);
	    yScale = EaseSine(timer, 1.2, -0.6, duration);
	}
	else
	{
		easeIn = false;
		timer = 0;
	}
}
else
{
	if timer < duration 
	{
	    timer ++;
	    xScale = EaseSine(timer, 0.6, 0.6, duration);
	    yScale = EaseSine(timer, 0.6, 0.6, duration);
	}
	else
	{
		easeIn = true;
		timer = 0;
	}
}
