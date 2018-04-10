(defmacro range (end)
  "Returns a list of numbers from 0 to end (exclusive)."
  (let ((gs (gensym)))
    `(loop for ,gs below ,end collect ,gs)))

(defmacro repeatedly (n f)
  "Returns a list of results when calling function f for n number of times."
  `(loop repeat ,n collect (funcall ,f)))

(defmacro partition (n coll &key (step n))
  "Returns a list of lists of n items each."
  (let ((gss (repeatedly n #'gensym)))
    `(loop for (,@gss) on ,coll by #'(lambda (arg)
                                       (nthcdr ,step arg))
           collect (list ,@gss))))

(defun contains-nil-p (coll)
  (position nil coll))
