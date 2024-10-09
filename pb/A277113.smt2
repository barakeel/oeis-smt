;; sequence(s): A277113
;; terms: 34 68 102 137 171 205 239 274 308 342 376 411 445 479 513 548 582 616 650 685
;; small program: ((1 + x) * loop(1 + (2 * (2 * (x + x))), 2, 2)) div (2 + 2)
;; fast program: ((1 + (2 * (2 * (2 + 2)))) * (2 + (x + x))) + ((1 + x) div (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* 2 (* 2 (+ x x)))))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (divf (* (+ 1 x) v0) (+ 2 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (* 2 (* 2 (+ 2 2)))) (+ 2 (+ x x))) (divf (+ 1 x) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
