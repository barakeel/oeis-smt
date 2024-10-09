;; sequence(s): A212864
;; terms: 0 2 3 5 6 9 12 15 17 22 26 30 34 40 45 51 56 63 70 77
;; small program: loop((y div (1 + 2)) + x, x, if (x mod (2 + 2)) <= 0 then 0 else 1) + x
;; fast program: ((((x * x) - x) div (2 + (2 + 2))) + (if (x mod (2 + 2)) <= 0 then 0 else 1)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (divf y (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (ite (<= (modf x (+ 2 2)) 0) 0 1))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (- (* x x) x) (+ 2 (+ 2 2))) (ite (<= (modf x (+ 2 2)) 0) 0 1)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
