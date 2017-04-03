;exercise 2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;exercise 3
(define (procedure1 x y z)
  (cond ((= (min x y z) x) (+ y z))
        ((= (min x y z) y) (+ x z))
        (else (+ x y))))

;exercise 4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;相当于将函数作为参数传递？

;exercise 5
(define (p) (p))
(define (test x y)
  (if (= x 0)
    0
    y))
;(test 0 (p))
;如果解释器是正则序求值，则解释过程可看做是“惰性的”，故最终会输出结果0
;如果解释器是应用序求值，则解释过程会陷入死循环
