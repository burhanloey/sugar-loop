(in-package #:sugar-loop)

(defun range (end)
  "Returns a list of numbers from 0 to end (exclusive)."
  (loop for i below end collect i))

(defun repeatedly (n f)
  "Returns a list of results when calling function f for n number of times."
  (loop repeat n collect (funcall f)))

(defun iterate (n f x)
  "Returns a list of x, (f x), (f (f x)) etc."
  (let ((r x))
    (loop repeat (1- n)
          do (setf r (funcall f r))
          collect r into results
          finally (return (cons x results)))))

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
