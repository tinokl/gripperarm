#!/usr/bin/env python
import roslib; roslib.load_manifest('eva')
import rospy

from eva.msg import arm_vel_msg
from hark_msgs.msg import HarkSource
from trajectory_msgs import JointTrajectory
from trajectory_msgs import JointTrajectoryPoint

class cortex:

  def __init__(self):
    rospy.loginfo(rospy.get_name() + ": Starting Node")
    self.vel_com_pub = rospy.Publisher('velocity_commands', arm_vel_msg)
    rospy.Subscriber("HarkSource", HarkSource, self.heardNoise)

    self.msg =

    while not rospy.is_shutdown():
      #self.RA2_Hobby_pub.publish(String(str))
      rospy.sleep(1.0)


  def heardNoise(self, data):
    if data.exist_src_num > 0:
      theta = int(round(data.src[0].theta,0))
      if theta > 0:
        if theta < 95:
          #ser.write("#16" + str(theta/10))
          rospy.loginfo(rospy.get_name() + ": I want to turn %s" % str(theta/10))
      else:
        if theta > -95:
          #ser.write("#06" + str((-1)*theta/10))
          rospy.loginfo(rospy.get_name() + ": I want to turn %s" % str(theta/10))


if __name__ == '__main__':
  rospy.init_node('cortex')
  try:
    cortex()
  except rospy.ROSInterruptException:
    pass


