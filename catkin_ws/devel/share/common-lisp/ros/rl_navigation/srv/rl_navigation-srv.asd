
(cl:in-package :asdf)

(defsystem "rl_navigation-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "pause" :depends-on ("_package_pause"))
    (:file "_package_pause" :depends-on ("_package"))
    (:file "start" :depends-on ("_package_start"))
    (:file "_package_start" :depends-on ("_package"))
    (:file "stop" :depends-on ("_package_stop"))
    (:file "_package_stop" :depends-on ("_package"))
  ))