;; sequence(s): A191162
;; terms: 0 1 1 0 0 1 1 0 1 1 0 0 1 1 0 1 1 0 0 1
;; small program: ((1 + (((x - ((0 - x) div loop(x * x, 2, 2))) div (2 * (2 + 2))) + x)) div 2) mod 2
;; fast program: ((((2 * (2 * (2 * (2 + (2 + 2))))) - 1) * (1 + x)) div (2 + loop(x * x, 2, 1 + 2))) mod 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (modf (divf (+ 1 (+ (divf (- x (divf (- 0 x) v0)) (* 2 (+ 2 2))) x)) 2) 2))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (= h1 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (modf (divf (* (- (* 2 (* 2 (* 2 (+ 2 (+ 2 2))))) 1) (+ 1 x)) (+ 2 v1)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
