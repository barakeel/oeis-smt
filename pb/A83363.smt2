;; sequence(s): A83363
;; terms: 1 7 11 30 38 69 81 124 140 195 215 282 306 385 413 504 536 639 675 790
;; small program: if (x * x) <= 0 then 1 else (loop(1 + (x + x), 2, x) * ((1 + x) div 2))
;; fast program: if (x * x) <= 0 then 1 else ((1 + (2 + (2 * (x + x)))) * (x - (x div 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (ite (<= (* x x) 0) 1 (* (v0 x) (divf (+ 1 x) 2))))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (* x x) 0) 1 (* (+ 1 (+ 2 (* 2 (+ x x)))) (- x (divf x 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
