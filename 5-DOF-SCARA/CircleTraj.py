from pymycobot.mycobot import MyCobot
import time
import math

radi = None
x0 = None
y0 = None
x = None
y = None
z = None
i = None

def upRange(start, stop, step):
  while start <= stop:
    yield start
    start += abs(step)

def downRange(start, stop, step):
  while start >= stop:
    yield start
    start -= abs(step)


mc = MyCobot('/dev/ttyAMA0',115200)
mc.power_on()
mc.send_angles([0,0,0,0,0,0],30)
time.sleep(4)
mc.send_angle(6,45,30)
radi = 5
x0 = 0
y0 = 0
x = 3
y = 3
z = 1
time.sleep(4)
i_end = float(2 * math.pi)
for i in (0 <= i_end) and upRange(0, i_end, 1) or downRange(0, i_end, 1):
  x0 = x + radi * math.cos(i / 180.0 * math.pi)
  y0 = x + radi * math.cos(i / 180.0 * math.pi)
  mc.send_coords([x0,y0,z,0,0,0],30,0)
  time.sleep(10)
mc.release_all_servos()
mc.power_off()
