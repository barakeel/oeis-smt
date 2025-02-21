;; sequence(s): A47420
;; terms: 0 1 2 3 4 6 8 9 10 11 12 14 16 17 18 19 20 22 24 25
;; small program: loop(1 + ((((x div 2) div 2) mod 2) + x), x, 0)
;; fast program: ((x - ((x div 2) mod (1 + 2))) div (1 + 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ (modf (divf (divf x 2) 2) 2) x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (- x (modf (divf x 2) (+ 1 2))) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
