;; sequence(s): A338824
;; terms: 0 0 1 2 0 4 1 6 0 8 1 10 0 12 1 14 0 16 1 18
;; small program: if (x mod 2) <= 0 then ((x div 2) mod 2) else (x - 1)
;; fast program: loop(if (x mod (2 + 2)) <= 0 then 1 else 2, 1 - (x mod 2), x) - 1
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
(assert (forall ((x Int)) (= (small x) (ite (<= (modf x 2) 0) (modf (divf x 2) 2) (- x 1)))))
(assert (forall ((x Int)) (= (f0 x) (ite (<= (modf x (+ 2 2)) 0) 1 2))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (modf x 2)))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (v0 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
