
(cl:in-package :asdf)

(defsystem "eva-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "arm_vel_msg" :depends-on ("_package_arm_vel_msg"))
    (:file "_package_arm_vel_msg" :depends-on ("_package"))
  ))