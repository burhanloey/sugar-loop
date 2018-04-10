(in-package :cl-user)

(defpackage #:sugar-loop
  (:nicknames #:sugar)
  (:use :cl)
  (:export #:range
           #:repeatedly
           #:partition))
