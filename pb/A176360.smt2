;; sequence(s): A176360
;; terms: 1 2 2 3 4 4 1 2 2 3 4 4 1 1 2 3 3 4 1 1
;; small program: (((((1 - (x div loop(1 + (x + x), 2, 2))) + x) + x) div (2 + 1)) mod (2 + 2)) + 1
;; fast program: ((((1 + (2 + (2 + 2))) * (1 + x)) div (1 + (2 + (2 * (2 + 2))))) mod (2 + 2)) + 1
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
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (modf (divf (+ (+ (- 1 (divf x v0)) x) x) (+ 2 1)) (+ 2 2)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (modf (divf (* (+ 1 (+ 2 (+ 2 2))) (+ 1 x)) (+ 1 (+ 2 (* 2 (+ 2 2))))) (+ 2 2)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
