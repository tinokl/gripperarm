; Auto-generated. Do not edit!


(cl:in-package eva-msg)


;//! \htmlinclude arm_vel_msg.msg.html

(cl:defclass <arm_vel_msg> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform "")
   (servo
    :reader servo
    :initarg :servo
    :type cl:fixnum
    :initform 0)
   (direction
    :reader direction
    :initarg :direction
    :type cl:fixnum
    :initform 0)
   (clockwise
    :reader clockwise
    :initarg :clockwise
    :type cl:fixnum
    :initform 0)
   (position
    :reader position
    :initarg :position
    :type cl:fixnum
    :initform 0))
)

(cl:defclass arm_vel_msg (<arm_vel_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arm_vel_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arm_vel_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name eva-msg:<arm_vel_msg> is deprecated: use eva-msg:arm_vel_msg instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <arm_vel_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eva-msg:command-val is deprecated.  Use eva-msg:command instead.")
  (command m))

(cl:ensure-generic-function 'servo-val :lambda-list '(m))
(cl:defmethod servo-val ((m <arm_vel_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eva-msg:servo-val is deprecated.  Use eva-msg:servo instead.")
  (servo m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <arm_vel_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eva-msg:direction-val is deprecated.  Use eva-msg:direction instead.")
  (direction m))

(cl:ensure-generic-function 'clockwise-val :lambda-list '(m))
(cl:defmethod clockwise-val ((m <arm_vel_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eva-msg:clockwise-val is deprecated.  Use eva-msg:clockwise instead.")
  (clockwise m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <arm_vel_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader eva-msg:position-val is deprecated.  Use eva-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arm_vel_msg>) ostream)
  "Serializes a message object of type '<arm_vel_msg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
  (cl:let* ((signed (cl:slot-value msg 'servo)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'direction)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'clockwise)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arm_vel_msg>) istream)
  "Deserializes a message object of type '<arm_vel_msg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'servo) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'clockwise) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'position) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arm_vel_msg>)))
  "Returns string type for a message object of type '<arm_vel_msg>"
  "eva/arm_vel_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arm_vel_msg)))
  "Returns string type for a message object of type 'arm_vel_msg"
  "eva/arm_vel_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arm_vel_msg>)))
  "Returns md5sum for a message object of type '<arm_vel_msg>"
  "fc870de37598bb4ce537d2acaebe3b83")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arm_vel_msg)))
  "Returns md5sum for a message object of type 'arm_vel_msg"
  "fc870de37598bb4ce537d2acaebe3b83")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arm_vel_msg>)))
  "Returns full string definition for message of type '<arm_vel_msg>"
  (cl:format cl:nil "string command~%int8 servo~%int8 direction~%int8 clockwise~%int8 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arm_vel_msg)))
  "Returns full string definition for message of type 'arm_vel_msg"
  (cl:format cl:nil "string command~%int8 servo~%int8 direction~%int8 clockwise~%int8 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arm_vel_msg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arm_vel_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'arm_vel_msg
    (cl:cons ':command (command msg))
    (cl:cons ':servo (servo msg))
    (cl:cons ':direction (direction msg))
    (cl:cons ':clockwise (clockwise msg))
    (cl:cons ':position (position msg))
))
