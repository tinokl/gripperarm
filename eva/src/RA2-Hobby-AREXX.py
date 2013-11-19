#!/usr/bin/env python

# AUTOR: Konstantin Lassnig
# RA2-Hobby-AREXX Velocity Command

# Subscribes on topic "velocity_commands" with arm_vel_msg messages
# Publishes connection information on topic "RA2_hobby" with strings

# Commands:
# START  ->  inits serial, moves the arm to the start position
# CLOSE  ->  moves the arm to a sleeping position, closes serial
# Move Command 1 direction: MCD + servo + direction (the higher the further)
# Move Command 2 position: MCP + clockwise/counterclockwise + servo + position

# Examples
# Move Command 1, Servo 6, clockwise 2
# string command = MCD
# int8 servo = 6
# int8 direction = 2
# int8 clockwise = 1
# int8 position = 0  -> unused

# Move Command 2, Servo 3, counter-clockwise 2
# string command = MCP
# int8 servo = 3
# int8 direction = 0 -> unused
# int8 clockwise = 0 -> unused
# int8 position = 3  -> unused

# Simple Command
# string command = START
# rest is unused or not checked

import roslib; roslib.load_manifest('eva')
import rospy
import serial
import time

from std_msgs.msg import String
from eva.msg import arm_vel_msg


class RA2Hobby:

  def __init__(self):

    rospy.loginfo(rospy.get_name() + ": Starting Node")
    self.RA2_Hobby_pub = rospy.Publisher('RA2_Hobby', String)
    rospy.Subscriber("velocity_commands", arm_vel_msg, self.checkCommand)

    self.ser = serial.Serial()
    rospy.on_shutdown(self.cleanup)

    # 1 gripper
    # 2 rotate gripper
    # 3 joint of gripper
    # 4 joint (weak)
    # 5 joint (big one)
    # 6 base (rotation)
    # save servo positions
    self.servo_pos = [0,0,0,0,0,0]

    while not rospy.is_shutdown():
      if self.ser.isOpen() == 1:
        line = self.ser.readline()
        str = "Serial Read: %s" % line
        rospy.loginfo(str)
        self.RA2_Hobby_pub.publish(String(str))
      rospy.sleep(1.0)


  def checkCommand(self, data):
    command = data.command
    if command == "CLOSE":
      self.cleanup()
    elif command == "START":
      self.initSerial()
      self.normPosition()
    elif command == "MCP":
      if self.ser.isOpen() == 1:
        self.moveCommandPosition(data)
    elif command == "MCD":
      if self.ser.isOpen() == 1:	
        self.moveCommandDirection(data)


  def moveCommandDirection(self, data):
    if data.clockwise == 1:
      position = self.servo_pos[data.servo] + data.direction
    else:
      position = self.servo_pos[data.servo] - data.direction	

    if positon < 8 and positon > -8:
      rospy.loginfo(rospy.get_name() + ": Commit direction move command")
      self.servo_pos[data.servo] = position
      str = "#%s%s%s" % data.clockwise % data.servo % position
      self.ser.write(str)	
    else:
      rospy.loginfo(rospy.get_name() + ": Furthest position reached")


  def moveCommandPosition(self, data):
    if data.position < 8:
      rospy.loginfo(rospy.get_name() + ": Commit position move command")
      str = "#%s%s%s" % data.clockwise % data.servo % data.position
      self.ser.write(str)
      if data.clockwise == 1:
        self.servo_pos[data.servo] = data.position
      else:
        self.servo_pos[data.servo] = (-1)*data.position		
    else:
      rospy.loginfo(rospy.get_name() + ": ERROR position our of bounds - position musst be smaller than 8")	


  def sleepPosition(self):
    rospy.loginfo(rospy.get_name() + ": Turn to SLEEP position")
    self.ser.write("#062")
    time.sleep(2)
    self.ser.write("#055")
    time.sleep(2)
    self.ser.write("#046")
    time.sleep(2)
    self.ser.write("#134")
    time.sleep(2)
    self.ser.write("#012")
    time.sleep(2)
    self.ser.write("#000")
    time.sleep(2)
    rospy.loginfo(rospy.get_name() + ": SLEEP position reached")


  def normPosition(self):
    rospy.loginfo(rospy.get_name() + ": Turn to NORMAL position")
    self.ser.write("#100")
    time.sleep(2)
    self.ser.write("#060")
    time.sleep(2)
    self.ser.write("#048")
    time.sleep(2)
    self.ser.write("#057")
    time.sleep(2)
    self.ser.write("#132")
    time.sleep(2)
    self.ser.write("#122")
    time.sleep(2)
    self.ser.write("#012")
    time.sleep(2)
    rospy.loginfo(rospy.get_name() + ": NORMAL position reached")


  def initSerial(self):
    rospy.loginfo(rospy.get_name() + ": INIT serial connection")
    self.ser.baudrate = 38400
    self.ser.port = '/dev/ttyUSB0'
    if self.ser.isOpen() == 0:
      self.ser.open()


  def cleanup(self):
    if self.ser.isOpen() == 1:
      self.sleepPosition()
      self.ser.close()


if __name__ == '__main__':
  rospy.init_node('RA2_Hobby_AREXX', anonymous=False)
  try:
    RA2Hobby()
  except rospy.ROSInterruptException:
    pass

