from pymycobot.mycobot import MyCobot
import time
num = None
mc = MyCobot('/dev/ttyAMA0',115200)
mc.power_on()
mc.send_angles([0,0,0,0,0,0],50)
time.sleep(3)
mc.send_angle(1,90,50)
time.sleep(3)
num = 5
while num > 0:
  mc.send_angle(1,90,50)
  time.sleep(3)
  mc.send_angle(2,(-50),50)
  time.sleep(3)
  num = num - 1
  mc.send_angles([88.68,(-138.51),155.65,(-128.05),(-9.93),(-15.29)],50)
  time.sleep(3)
  mc.release_all_servos()
