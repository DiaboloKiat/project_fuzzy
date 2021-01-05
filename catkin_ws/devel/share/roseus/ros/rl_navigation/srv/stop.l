;; Auto-generated. Do not edit!


(when (boundp 'rl_navigation::stop)
  (if (not (find-package "RL_NAVIGATION"))
    (make-package "RL_NAVIGATION"))
  (shadow 'stop (find-package "RL_NAVIGATION")))
(unless (find-package "RL_NAVIGATION::STOP")
  (make-package "RL_NAVIGATION::STOP"))
(unless (find-package "RL_NAVIGATION::STOPREQUEST")
  (make-package "RL_NAVIGATION::STOPREQUEST"))
(unless (find-package "RL_NAVIGATION::STOPRESPONSE")
  (make-package "RL_NAVIGATION::STOPRESPONSE"))

(in-package "ROS")





(defclass rl_navigation::stopRequest
  :super ros::object
  :slots ())

(defmethod rl_navigation::stopRequest
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

(defclass rl_navigation::stopResponse
  :super ros::object
  :slots (_result ))

(defmethod rl_navigation::stopResponse
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

(defclass rl_navigation::stop
  :super ros::object
  :slots ())

(setf (get rl_navigation::stop :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get rl_navigation::stop :datatype-) "rl_navigation/stop")
(setf (get rl_navigation::stop :request) rl_navigation::stopRequest)
(setf (get rl_navigation::stop :response) rl_navigation::stopResponse)

(defmethod rl_navigation::stopRequest
  (:response () (instance rl_navigation::stopResponse :init)))

(setf (get rl_navigation::stopRequest :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get rl_navigation::stopRequest :datatype-) "rl_navigation/stopRequest")
(setf (get rl_navigation::stopRequest :definition-)
      "#Request data
---
#Response data
string result
")

(setf (get rl_navigation::stopResponse :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get rl_navigation::stopResponse :datatype-) "rl_navigation/stopResponse")
(setf (get rl_navigation::stopResponse :definition-)
      "#Request data
---
#Response data
string result
")



(provide :rl_navigation/stop "c22f2a1ed8654a0b365f1bb3f7ff2c0f")


