(in-package #:sugar-loop)

(defmacro range (end)
  "Returns a list of numbers from 0 to end (exclusive)."
  (let ((gs (gensym)))
    `(loop for ,gs below ,end collect ,gs)))

(defmacro repeatedly (n f)
  "Returns a list of results when calling function f for n number of times."
  `(loop repeat ,n collect (funcall ,f)))

(defun contains-nil-p (coll)
  "Check if a list contains NIL."
  (position nil coll))

(defmacro partition (n coll &key (step n) include-all)
  "Returns a list of lists of n items each."
  (let ((gs (gensym))
        (gss (repeatedly n #'gensym)))
    `(loop for ,gs on ,coll by #'(lambda (arg)
                                   (nthcdr ,step arg))
           for (,@gss) = ,gs
           for sub-list = (cond
                            ((>= (length ,gs) ,n)
                             (list ,@gss))
                            (,include-all
                             (butlast (list ,@gss) (- ,n (mod (length ,gs) ,n))))
                            (t
                             nil))
           unless (null sub-list)
             collect sub-list)))
