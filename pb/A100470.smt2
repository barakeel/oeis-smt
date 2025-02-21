;; sequence(s): A100470
;; terms: 0 1 2 3 4 5 6 7 8 9 10 10 11 11 12 12 13 13 14 14
;; small program: loop(x - 1, (((x - 1) div 2) - 2) - 2, x)
;; fast program: if (1 + ((2 * (2 + 2)) - x)) <= 0 then ((1 + (2 + 2)) + (x div 2)) else x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- x 1))))
(assert (forall ((x Int)) (= (g0 x) (- (- (divf (- x 1) 2) 2) 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (+ 1 (- (* 2 (+ 2 2)) x)) 0) (+ (+ 1 (+ 2 2)) (divf x 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
