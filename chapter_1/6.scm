(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; new-if 是函数（过程）
; 而 if 或 cond 是条件表达式，也许可以看作一种特殊的函数
; 猜测普通函数采用应用序求值，而条件表达式采用正则序求值
; new-if 会一直等待参数列表中的表达式求值结束再继续执行，故当由 sqrt-iter 进入递归时，先前的执行过程会被压栈保存，等待 sqrt-iter 求值结束。然而，由于 sqrt-iter 依赖于条件表达式形成递归出口，而 new-if 无法产生预期的作用，所以会导致无限递归，最终溢出

; 这里不负责任地猜测一下 scheme 的设计思路。
; 在 scheme 中，括号内第一个单词为 函数名，其后的若干单词或表达式为 参数
; 存在两种求值方式：应用序和正则序，不同种类的函数采用不同的求值方式
; #f 与 #t 也被当作函数来对待
; define 作为一种特殊的函数，不求值，只负责将函数名、参数、函数体绑定到一个执行环境中
