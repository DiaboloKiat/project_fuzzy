;; Auto-generated. Do not edit!


(when (boundp 'rl_navigation::pause)
  (if (not (find-package "RL_NAVIGATION"))
    (make-package "RL_NAVIGATION"))
  (shadow 'pause (find-package "RL_NAVIGATION")))
(unless (find-package "RL_NAVIGATION::PAUSE")
  (make-package "RL_NAVIGATION::PAUSE"))
(unless (find-package "RL_NAVIGATION::PAUSEREQUEST")
  (make-package "RL_NAVIGATION::PAUSEREQUEST"))
(unless (find-package "RL_NAVIGATION::PAUSERESPONSE")
  (make-package "RL_NAVIGATION::PAUSERESPONSE"))

(in-package "ROS")





(defclass rl_navigation::pauseRequest
  :super ros::object
  :slots ())

(defmethod rl_navigation::pauseRequest
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

(defclass rl_navigation::pauseResponse
  :super ros::object
  :slots (_result ))

(defmethod rl_navigation::pauseResponse
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

(defclass rl_navigation::pause
  :super ros::object
  :slots ())

(setf (get rl_navigation::pause :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get rl_navigation::pause :datatype-) "rl_navigation/pause")
(setf (get rl_navigation::pause :request) rl_navigation::pauseRequest)
(setf (get rl_navigation::pause :response) rl_navigation::pauseResponse)

(defmethod rl_navigation::pauseRequest
  (:response () (instance rl_navigation::pauseResponse :init)))

(setf (get rl_navigation::pauseRequest :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get rl_navigation::pauseRequest :datatype-) "rl_navigation/pauseRequest")
(setf (get rl_navigation::pauseRequest :definition-)
      "#Request data
---
#Response data
string result
")

(setf (get rl_navigation::pauseResponse :md5sum-) "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(setf (get rl_navigation::pauseResponse :datatype-) "rl_navigation/pauseResponse")
(setf (get rl_navigation::pauseResponse :definition-)
      "#Request data
---
#Response data
string result
")



(provide :rl_navigation/pause "c22f2a1ed8654a0b365f1bb3f7ff2c0f")


