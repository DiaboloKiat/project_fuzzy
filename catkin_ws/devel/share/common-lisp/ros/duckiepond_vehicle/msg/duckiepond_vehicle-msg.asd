
(cl:in-package :asdf)

(defsystem "duckiepond_vehicle-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "UsvDrive" :depends-on ("_package_UsvDrive"))
    (:file "_package_UsvDrive" :depends-on ("_package"))
  ))