;; sequence(s): A131742
;; terms: 0 0 1 2 0 0 4 5 0 0 7 8 0 0 10 11 0 0 13 14
;; small program: (((x div 2) + x) div 2) * ((x div 2) mod 2)
;; fast program: x - loop(1 + ((x div 2) div 2), (x div 2) mod 2, x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (divf (+ (divf x 2) x) 2) (modf (divf x 2) 2)))))
(assert (forall ((x Int)) (= (f0 x) (+ 1 (divf (divf x 2) 2)))))
(assert (forall ((x Int)) (= (g0 x) (modf (divf x 2) 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (- x (v0 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
