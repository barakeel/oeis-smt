;; sequence(s): A267317
;; terms: 0 1 3 7 5 1 3 7 5 1 3 7 5 1 3 7 5 1 3 7
;; small program: loop(2 * (x mod (1 + (2 + 2))), x, 1) - 1
;; fast program: ((x * x) - ((x - (if x <= 0 then 0 else 1)) mod (2 + 2))) mod (2 * (2 + 2))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (modf x (+ 1 (+ 2 2)))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (modf (- (* x x) (modf (- x (ite (<= x 0) 0 1)) (+ 2 2))) (* 2 (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
