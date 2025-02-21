;; sequence(s): A172046
;; terms: 0 0 0 1 3 6 11 18 27 38 52 69 89 113 141 173 209 250 296 347
;; small program: loop(((y * y) div (1 + (2 + (2 + 2)))) + x, x, 0)
;; fast program: ((((((1 + (x + x)) * ((x * x) + x)) div (2 + (2 + 2))) - x) - x) + 1) div (1 + (2 + (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf (* y y) (+ 1 (+ 2 (+ 2 2)))) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (- (- (divf (* (+ 1 (+ x x)) (+ (* x x) x)) (+ 2 (+ 2 2))) x) x) 1) (+ 1 (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
