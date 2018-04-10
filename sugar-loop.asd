(in-package :cl-user)

(asdf:defsystem #:sugar-loop
  :description "LOOP macros that do almost the same thing with their counterparts in Clojure"
  :version "0.0.1"
  :license "Apache License Version 2.0"
  :components ((:file "package")
               (:file "sugar" :depends-on ("package"))))
