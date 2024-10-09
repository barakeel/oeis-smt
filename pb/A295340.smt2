;; sequence(s): A295340
;; terms: 11 13 26 28 41 43 56 58 71 73 86 88 101 103 116 118 131 133 146 148
;; small program: (((1 + (x div 2)) * loop(1 + (x + x), 2, 2)) + x) + x
;; fast program: (((1 + (2 + (2 * (2 + 2)))) * (1 + (x div 2))) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (+ 1 (divf x 2)) v0) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ 1 (+ 2 (* 2 (+ 2 2)))) (+ 1 (divf x 2))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
