;; sequence(s): A247784
;; terms: 1 2 2 3 4 5 5 6 7 8 8 9 10 10 11 12 13 13 14 15
;; small program: (loop(2 + (((1 + y) - (((x div 2) div 2) div 2)) div 2), x, 2) + x) div 2
;; fast program: ((2 * (2 * (2 * ((1 + 2) * (2 + x))))) + x) div (2 + (2 * (2 * (2 * (2 + 2)))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (divf (- (+ 1 y) (divf (divf (divf x 2) 2) 2)) 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (+ (v0 x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (* 2 (* 2 (* 2 (* (+ 1 2) (+ 2 x))))) x) (+ 2 (* 2 (* 2 (* 2 (+ 2 2)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
