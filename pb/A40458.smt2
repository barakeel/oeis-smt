;; sequence(s): A40458
;; terms: 21 1 9 1 42 1 9 1 42 1 9 1 42 1 9 1 42 1 9 1
;; small program: (((((((loop(1, x mod (2 + 2), 2 + (2 + 2)) - (x mod 2)) * 2) + 1) * (if x <= 0 then 1 else 2)) - (x mod 2)) * (1 + (2 + 2))) - 2) div (1 + 2)
;; fast program: (((((((loop(2 + (2 + 2), 1 - (x mod (2 + 2)), 1) - (x mod 2)) * 2) + 1) * (if x <= 0 then 1 else 2)) - (x mod 2)) * (1 + (2 + 2))) - 2) div (1 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (= f0 1))
(assert (forall ((x Int)) (= (g0 x) (modf x (+ 2 2)))))
(assert (= h0 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (- (* (- (* (+ (* (- (v0 x) (modf x 2)) 2) 1) (ite (<= x 0) 1 2)) (modf x 2)) (+ 1 (+ 2 2))) 2) (+ 1 2)))))
(assert (= f1 (+ 2 (+ 2 2))))
(assert (forall ((x Int)) (= (g1 x) (- 1 (modf x (+ 2 2))))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (divf (- (* (- (* (+ (* (- (v1 x) (modf x 2)) 2) 1) (ite (<= x 0) 1 2)) (modf x 2)) (+ 1 (+ 2 2))) 2) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
