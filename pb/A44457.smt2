;; sequence(s): A44457
;; terms: 15 31 47 63 79 95 111 127 143 159 175 191 207 223 255 271 287 303 319 335
;; small program: ((1 + (((1 + x) div (loop(x * x, 2, 2) - 1)) + x)) * loop(x * x, 2, 2)) - 1
;; fast program: ((1 + (((1 + x) div ((2 * (2 * (2 + 2))) - 1)) + x)) * (2 * (2 * (2 + 2)))) - 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 (+ (divf (+ 1 x) (- v0 1)) x)) v1) 1))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 (+ (divf (+ 1 x) (- (* 2 (* 2 (+ 2 2))) 1)) x)) (* 2 (* 2 (+ 2 2)))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
