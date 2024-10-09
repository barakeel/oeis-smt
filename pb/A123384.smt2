;; sequence(s): A123384
;; terms: 1 4 7 10 14 17 20 24 27 30 34 37 40 44 47 50 54 57 60 64
;; small program: (1 + ((((((x div (2 + 2)) + x) + x) div (1 + (2 + (2 + 2)))) + x) + x)) + x
;; fast program: loop((((x + x) + x) div (2 * (2 + (2 * (2 + (2 + 2)))))) + x, 1, (x + x) + x) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ 1 (+ (+ (divf (+ (+ (divf x (+ 2 2)) x) x) (+ 1 (+ 2 (+ 2 2)))) x) x)) x))))
(assert (forall ((x Int)) (= (f0 x) (+ (divf (+ (+ x x) x) (* 2 (+ 2 (* 2 (+ 2 (+ 2 2)))))) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ (+ x x) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
