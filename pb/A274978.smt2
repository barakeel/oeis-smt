;; sequence(s): A274978
;; terms: 0 1 13 16 40 45 81 88 136 145 205 216 288 301 385 400 496 513 621 640
;; small program: loop(((if (y mod 2) <= 0 then (2 + (2 + 2)) else 1) * y) + x, x, 0)
;; fast program: (((2 * (2 + x)) + ((1 + 2) * (x div 2))) * (x div 2)) + x
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (ite (<= (modf y 2) 0) (+ 2 (+ 2 2)) 1) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (* 2 (+ 2 x)) (* (+ 1 2) (divf x 2))) (divf x 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
