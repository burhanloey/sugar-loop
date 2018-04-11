(in-package #:cl-user)

(defpackage #:sugar-loop-test
  (:use :cl #:sugar-loop)
  (:import-from #:prove
                #:is
                #:finalize
                #:subtest
                #:plan))

(in-package #:sugar-loop-test)

(plan 1)

(subtest "Testing PARTITION"
  (is (partition 2 '(1 2 3)) '((1 2)))
  (is (partition 2 '(1 2 3 4)) '((1 2) (3 4)))
  (is (partition 2 '()) '())

  (is (partition 2 '(1 2 3 4 5 6 7) :step 3) '((1 2) (4 5)))
  (is (partition 2 '(1 2 3 4 5 6 7 8) :step 3) '((1 2) (4 5) (7 8)))
  (is (partition 2 '() :step 3) '())

  (is (partition 2 '(1 2 3 4 5) :include-all t) '((1 2) (3 4) (5)))
  (is (partition 2 '(1 2 3 4 5 6) :include-all t) '((1 2) (3 4) (5 6)))
  (is (partition 2 '() :include-all t) '()))

(finalize)
