;; sequence(s): A246171
;; terms: 3 7 11 15 19 23 27 30 34 38 42 46 50 54 58 61 65 69 73 77
;; small program: loop(1 + (x + x), 2, x) - ((1 + x) div (2 * (2 + 2)))
;; fast program: 1 + (2 + ((2 * (x + x)) - ((1 + x) div (2 * (2 + 2)))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) (divf (+ 1 x) (* 2 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ 2 (- (* 2 (+ x x)) (divf (+ 1 x) (* 2 (+ 2 2)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
