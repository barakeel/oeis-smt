;; sequence(s): A286747
;; terms: 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
;; small program: ((x mod (1 + (2 + loop(x * x, 2, 2)))) mod (1 + 2)) div 2
;; fast program: ((x mod (1 + (2 + (2 * (2 * (2 + 2)))))) mod (1 + 2)) div 2
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
(assert (forall ((x Int)) (= (small x) (divf (modf (modf x (+ 1 (+ 2 v0))) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (modf (modf x (+ 1 (+ 2 (* 2 (* 2 (+ 2 2)))))) (+ 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
