;; sequence(s): A305238
;; terms: 19 18 17 16 15 14 13 12 11 10 29 28 27 26 25 24 23 22 21 20
;; small program: ((1 - (2 + (x + x))) mod loop(2 * (2 + x), 2, 2)) + x
;; fast program: ((((0 - (1 + x)) mod (((2 + 2) * 2) + 2)) * 2) + 1) + x
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
(assert (forall ((x Int)) (= (small x) (+ (modf (- 1 (+ 2 (+ x x))) v0) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (modf (- 0 (+ 1 x)) (+ (* (+ 2 2) 2) 2)) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
