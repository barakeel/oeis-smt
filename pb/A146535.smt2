;; sequence(s): A146535
;; terms: 1 1 5 7 3 11 13 5 17 19 7 23 25 9 29 31 11 35 37 13
;; small program: 1 + ((x + x) div (1 + (((x * x) + x) mod (1 + 2))))
;; fast program: (loop(x div (1 + 2), (x mod (1 + 2)) mod 2, x) * 2) + 1
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
(assert (forall ((x Int)) (= (small x) (+ 1 (divf (+ x x) (+ 1 (modf (+ (* x x) x) (+ 1 2))))))))
(assert (forall ((x Int)) (= (f0 x) (divf x (+ 1 2)))))
(assert (forall ((x Int)) (= (g0 x) (modf (modf x (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (v0 x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
