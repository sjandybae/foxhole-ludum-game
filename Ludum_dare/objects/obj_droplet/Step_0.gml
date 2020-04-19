x += dx
y += dy
dx /= 2
dy += 0.1
timer -= 1
if(timer < 0)
	instance_destroy(self)