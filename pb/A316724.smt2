;; sequence(s): A316724
;; terms: 0 1 23 26 70 75 141 148 236 245 355 366 498 511 665 680 856 873 1071 1090
;; small program: ((1 + (x + x)) * (loop(1 + (y - x), x, 2) + x)) - 2
;; fast program: ((1 + (2 * ((2 * ((2 - (x mod 2)) + x)) + x))) * (x div 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (- y x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 (+ x x)) (+ (v0 x) x)) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (* 2 (+ (* 2 (+ (- 2 (modf x 2)) x)) x))) (divf x 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
