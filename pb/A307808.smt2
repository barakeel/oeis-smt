;; sequence(s): A307808
;; terms: 3 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
;; small program: (1 + 2) mod (1 + ((2 + 2) div (1 + x)))
;; fast program: (loop(0 - (x div 2), 2 - x, 2) + 2) div (1 + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (modf (+ 1 2) (+ 1 (divf (+ 2 2) (+ 1 x)))))))
(assert (forall ((x Int)) (= (f0 x) (- 0 (divf x 2)))))
(assert (forall ((x Int)) (= (g0 x) (- 2 x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (v0 x) 2) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
