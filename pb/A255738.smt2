;; sequence(s): A255738
;; terms: 1 1 1 0 1 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0
;; small program: 2 div loop(2 + (x mod y), x, 2)
;; fast program: if (((((2 * (2 * (2 + 2))) - x) - x) * (2 * (2 + 2))) mod (if x <= 0 then 1 else x)) <= 0 then 1 else 0
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (modf x y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf 2 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (modf (* (- (- (* 2 (* 2 (+ 2 2))) x) x) (* 2 (+ 2 2))) (ite (<= x 0) 1 x)) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
