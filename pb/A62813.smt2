;; sequence(s): A62813
;; terms: 0 2 21 228 2930 44790 800667 16434824 381367044 9876543210 282458553905 8842413667692 300771807240918 11046255305880158 435659737878916215 18364758544493064720 824008854613343261192 39210261334551566857170 1972313422155189164466189 104567135734072022160664820
;; small program: (loop2((x * y) - 1, y, 1 + x, 1, 1 + x) div (if x <= 0 then 1 else x)) * (1 + x)
;; fast program: (((((loop2(1 + (x * y), y, x - 1, 1, 1 + x) div (if x <= 0 then 1 else x)) * (1 + x)) - 1) * (x - 1)) + x) * (1 + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (* x y) 1))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) y)))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (* (divf (w0 x) (ite (<= x 0) 1 x)) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 1 (* x y)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) (- x 1))))
(assert (= i1 1))
(assert (forall ((x Int)) (= (j1 x) (+ 1 x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 (j1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ (* (- (* (divf (w1 x) (ite (<= x 0) 1 x)) (+ 1 x)) 1) (- x 1)) x) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
