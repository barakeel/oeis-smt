;; sequence(s): A11707
;; terms: 0 0 0 0 0 0 0 1 1 0 1 0 0 1 0 1 1 0 0 0
;; small program: ((((((1 + 2) * ((1 + (x + x)) * (2 + x))) - 1) mod (1 + (2 * (2 * (2 + 2))))) + 1) mod (1 + 2)) div 2
;; fast program: (((1 + loop((2 + x) * (x * x), 1, 2 + x)) * (1 + (2 + (2 + 2)))) mod (1 + (2 * (2 * (2 + 2))))) mod 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (modf (+ (modf (- (* (+ 1 2) (* (+ 1 (+ x x)) (+ 2 x))) 1) (+ 1 (* 2 (* 2 (+ 2 2))))) 1) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (f0 x) (* (+ 2 x) (* x x)))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (modf (modf (* (+ 1 (v0 x)) (+ 1 (+ 2 (+ 2 2)))) (+ 1 (* 2 (* 2 (+ 2 2))))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
