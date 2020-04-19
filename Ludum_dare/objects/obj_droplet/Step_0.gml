x += dx
y += dy
dx /= 1.1
dy += 0.1
timer -= 1
if(timer < 0)
	instance_destroy(self)
	
image_angle = point_direction(x, y, x + dx, y + dy)
	
image_alpha -= 0.05
	