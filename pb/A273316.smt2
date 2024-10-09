;; sequence(s): A273316
;; terms: 1 9 33 81 161 281 449 673 961 1321 1761 2289 2913 3641 4481 5441 6529 7753 9121 10641
;; small program: loop((2 * (2 * ((y * y) + y))) + x, x, 1)
;; fast program: 1 + (2 * (2 * (((1 + x) * ((2 + x) * x)) div (1 + 2))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* 2 (* 2 (+ (* y y) y))) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (* 2 (divf (* (+ 1 x) (* (+ 2 x) x)) (+ 1 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
