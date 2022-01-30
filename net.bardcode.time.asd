;;;; net.bardcode.uri.asd

(asdf:defsystem #:net.bardcode.time
  :description "Describe net.bardcode.time here"
  :author "mikel evins <mikel@evins.net>"
  :license  "Apache 2.0"
  :version "0.0.1"
  :serial t
  :depends-on (:local-time)
  :components ((:file "package")
               (:file "time")))

#+nil (ql:quickload :net.bardcode.time)
