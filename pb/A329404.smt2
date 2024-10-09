;; sequence(s): A329404
;; terms: 0 1 4 21 20 65 48 133 88 225 140 341 204 481 280 645 368 833 468 1045
;; small program: ((1 + (x mod 2)) * (((x div 2) + x) * x)) - x
;; fast program: (((x div 2) + x) * loop(x + x, x mod 2, x)) - x
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
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 (modf x 2)) (* (+ (divf x 2) x) x)) x))))
(assert (forall ((x Int)) (= (f0 x) (+ x x))))
(assert (forall ((x Int)) (= (g0 x) (modf x 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ (divf x 2) x) (v0 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
