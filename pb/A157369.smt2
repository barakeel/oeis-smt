;; sequence(s): A157369
;; terms: 70 413 756 1099 1442 1785 2128 2471 2814 3157 3500 3843 4186 4529 4872 5215 5558 5901 6244 6587
;; small program: (loop(((2 * ((x + x) + x)) + x) + y, 1 + 2, x) + 2) + 2
;; fast program: (((2 + (2 * ((2 * (x + x)) + x))) * (1 + (2 + 2))) - x) * (1 + (2 + (2 + 2)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* 2 (+ (+ x x) x)) x) y))))
(assert (= g0 (+ 1 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (* (- (* (+ 2 (* 2 (+ (* 2 (+ x x)) x))) (+ 1 (+ 2 2))) x) (+ 1 (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
