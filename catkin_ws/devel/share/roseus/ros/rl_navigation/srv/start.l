;; Auto-generated. Do not edit!


(when (boundp 'rl_navigation::start)
  (if (not (find-package "RL_NAVIGATION"))
    (make-package "RL_NAVIGATION"))
  (shadow 'start (find-package "RL_NAVIGATION")))
(unless (find-package "RL_NAVIGATION::START")
  (make-package "RL_NAVIGATION::START"))
(unless (find-package "RL_NAVIGATION::STARTREQUEST")
  (make-package "RL_NAVIGATION::STARTREQUEST"))
(unless (find-package "RL_NAVIGATION::STARTRESPONSE")
  (make-package "RL_NAVIGATION::STARTRESPONSE"))

(in-package "ROS")





(defclass rl_navigation::startRequest
  :super ros::object
  :slots ())

(defmethod rl_navigation::startRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass rl_navigation::startResponse
  :super ros::object
  :slots (_result ))

(defmethod rl_navigation::startResponse
  (:init
   (&key
    ((:result __result) "")
    )
   (send-super :init)
   (setq _result (string __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; string _result
    4 (length _result)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _result
       (write-long (length _result) s) (princ _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _result
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _result (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass rl_navigation::start
  :super ros::object
  :slots ())

(setf (get rl_navigation::start :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get rl_navigation::start :datatype-) "rl_navigation/start")
(setf (get rl_navigation::start :request) rl_navigation::startRequest)
(setf (get rl_navigation::start :response) rl_navigation::startResponse)

(defmethod rl_navigation::startRequest
  (:response () (instance rl_navigation::startResponse :init)))

(setf (get rl_navigation::startRequest :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get rl_navigation::startRequest :datatype-) "rl_navigation/startRequest")
(setf (get rl_navigation::startRequest :definition-)
      "#Request data
---
#Response data
string result
")

(setf (get rl_navigation::startResponse :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get rl_navigation::startResponse :datatype-) "rl_navigation/startResponse")
(setf (get rl_navigation::startResponse :definition-)
      "#Request data
---
#Response data
string result
")



(provide :rl_navigation/start "c22f2a1ed8654a0b365f1bb3f7ff2c0f")


