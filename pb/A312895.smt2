;; sequence(s): A312895
;; terms: 1 4 9 13 17 21 26 30 34 39 43 47 51 56 60 64 69 73 77 81
;; small program: (loop((y - ((0 - (x div 2)) div (2 + 2))) + y, x, 1) + x) + x
;; fast program: ((1 + (2 + (x + x))) div (1 + (2 + (2 + 2)))) + (if x <= 0 then 1 else (2 * (x + x)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- y (divf (- 0 (divf x 2)) (+ 2 2))) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ 1 (+ 2 (+ x x))) (+ 1 (+ 2 (+ 2 2)))) (ite (<= x 0) 1 (* 2 (+ x x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
