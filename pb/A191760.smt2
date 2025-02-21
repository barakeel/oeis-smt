;; sequence(s): A191760
;; terms: 1 9 7 4 9 4 7 9 1 1 9 7 4 9 4 7 9 1 1 9
;; small program: (loop(x - y, x, 0) mod (1 + (2 * (2 + 2)))) + 1
;; fast program: 1 + ((2 * (2 * ((x * x) + x))) mod (1 + (2 * (2 + 2))))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (modf (v0 x) (+ 1 (* 2 (+ 2 2)))) 1))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (modf (* 2 (* 2 (+ (* x x) x))) (+ 1 (* 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
