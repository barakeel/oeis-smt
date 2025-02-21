;; sequence(s): A106352
;; terms: 1 2 7 9 15 21 28 35 46 54 66 78 91 104 121 135 153 171 190 209
;; small program: 1 - loop((x - (y mod (1 + 2))) - y, x, x mod 2)
;; fast program: ((((1 + x) * (2 + x)) + (x mod (1 + 2))) div 2) - (x mod 2)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (- x (modf y (+ 1 2))) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (modf x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- 1 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (divf (+ (* (+ 1 x) (+ 2 x)) (modf x (+ 1 2))) 2) (modf x 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
