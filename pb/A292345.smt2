;; sequence(s): A292345
;; terms: 96 352 736 1248 1888 2656 3552 4576 5728 7008 8416 9952 11616 13408 15328 17376 19552 21856 24288 26848
;; small program: loop2(2 * (2 * ((2 * (2 + (x * y))) + x)), y, 2, 1, x)
;; fast program: ((2 * (2 * ((1 + x) * (2 + x)))) - 2) * (2 * (2 * (2 + 2)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* 2 (* 2 (+ (* 2 (+ 2 (* x y))) x))))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) y)))
(assert (= h0 2))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (fast x) (* (- (* 2 (* 2 (* (+ 1 x) (+ 2 x)))) 2) (* 2 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
