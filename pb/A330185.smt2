;; sequence(s): A330185
;; terms: 3 7 12 16 21 25 30 34 39 42 46 51 55 60 64 69 73 78 81 85
;; small program: ((loop(2 + (y - (((x div 2) div (1 + 2)) div (1 + 2))), x + x, 2) + x) * (1 + 2)) div 2
;; fast program: (((((2 - ((2 + (x + x)) div (1 + (2 + (2 * (2 * (2 + 2))))))) + x) + x) + x) * (1 + 2)) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (- y (divf (divf (divf x 2) (+ 1 2)) (+ 1 2)))))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (* (+ (v0 x) x) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (* (+ (+ (+ (- 2 (divf (+ 2 (+ x x)) (+ 1 (+ 2 (* 2 (* 2 (+ 2 2))))))) x) x) x) (+ 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
