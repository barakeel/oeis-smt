;; sequence(s): A330144
;; terms: 2 5 8 11 13 16 19 22 24 27 30 33 35 38 41 44 46 49 52 55
;; small program: ((loop(1 + (y - ((((x div 2) div 2) + x) div (2 + 2))), x, 1) + 1) + x) + x
;; fast program: (((2 - (((1 + (2 + 2)) * (1 + x)) div (1 + (2 * (2 + (2 * (2 + 2))))))) + x) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (- y (divf (+ (divf (divf x 2) 2) x) (+ 2 2)))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (v0 x) 1) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (- 2 (divf (* (+ 1 (+ 2 2)) (+ 1 x)) (+ 1 (* 2 (+ 2 (* 2 (+ 2 2))))))) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
