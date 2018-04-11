(in-package :cl-user)

(asdf:defsystem #:sugar-loop-test
  :depends-on (:sugar-loop
               :prove)
  :defsystem-depends-on (:prove-asdf)
  :components ((:test-file "test")))
