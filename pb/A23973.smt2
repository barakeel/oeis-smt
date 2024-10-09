;; sequence(s): A23973
;; terms: 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
;; small program: ((((x - (x div 2)) + x) + x) div (loop(x * x, 2, 2) + x)) mod 2
;; fast program: ((2 + ((2 - x) div (2 + 2))) div (((2 + 2) * (1 + 2)) + 1)) mod 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (modf (divf (+ (+ (- x (divf x 2)) x) x) (+ v0 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (modf (divf (+ 2 (divf (- 2 x) (+ 2 2))) (+ (* (+ 2 2) (+ 1 2)) 1)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
