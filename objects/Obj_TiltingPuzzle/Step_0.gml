// Inherit the parent event
event_inherited();

var goal_x = ball.x + ball.xsp + ball.size*sign(ball.xsp);
var goal_y = ball.y + ball.ysp + ball.size*sign(ball.xsp);
if(goal_x < .5 || goal_x > 9.5)
	ball.xsp *= -1;
if(goal_y < .5 || goal_y > 9.5)
	ball.ysp *= -1;
	
if( touching_wall(ball.x + ball.xsp + ball.size*sign(ball.xsp),ball.y) ) {
	while( !touching_wall(
				ball.x+(0.1+ball.size)*sign(ball.xsp),
				ball.y) )
		ball.x += 0.06*sign(ball.xsp);
	
	ball.xsp *= -1;
}

if( touching_wall(ball.x,ball.y + ball.ysp*sign(ball.ysp) + ball.size) ) {
	while( !touching_wall(
				ball.x,
				ball.y+(0.1+ball.size)*sign(ball.ysp)
				) )
		ball.y += 0.06*sign(ball.ysp);
	
	ball.ysp *= -1;
}

if( touching_wall(ball.x + ball.xsp + ball.size,ball.y + ball.ysp + ball.size) ) {
	while( !touching_wall(
				ball.x+(0.1+ball.size)*sign(ball.xsp),
				ball.y+(0.1+ball.size)*sign(ball.ysp)
				) )
		ball.x += 0.06*sign(ball.xsp)
		ball.y += 0.06*sign(ball.ysp);
	
	ball.xsp *= -1;
	ball.ysp *= -1;
}
	
ball.x += ball.xsp;
ball.y += ball.ysp;