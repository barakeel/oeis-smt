;; sequence(s): A347836
;; terms: 5 13 29 37 45 61 69 77 93 101 109 125 133 141 157 165 173 189 197 205
;; small program: loop(1 + (2 * (x * y)), 2, ((1 + x) div (1 + 2)) + x)
;; fast program: 1 + (2 * (2 + (2 * (2 * (((1 + x) div (1 + 2)) + x)))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (* 2 (* x y))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ (divf (+ 1 x) (+ 1 2)) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (+ 2 (* 2 (* 2 (+ (divf (+ 1 x) (+ 1 2)) x)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
