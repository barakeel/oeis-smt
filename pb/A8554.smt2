;; sequence(s): A8554-A55644
;; terms: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
;; small program: (2 * (2 * (x - (x mod loop(2 * (2 + x), 2, 2))))) + x
;; fast program: (2 * (2 * (x - (x mod (2 * (2 + (2 * (2 + 2)))))))) + x
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ 2 x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (* 2 (* 2 (- x (modf x v0)))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* 2 (- x (modf x (* 2 (+ 2 (* 2 (+ 2 2)))))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
