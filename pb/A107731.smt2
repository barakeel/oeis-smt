;; sequence(s): A107731
;; terms: 1 21 141 521 1401 3101 6021 10641 17521 27301 40701 58521 81641 111021 147701 192801 247521 313141 391021 482601
;; small program: ((((1 + (2 + 2)) * loop((x * x) + x, 2, x)) div (1 + 2)) * 2) + 1
;; fast program: (2 * ((1 + (2 + 2)) * (loop((x * x) + x, 1, (x * x) + x) div (1 + 2)))) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (* x x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (divf (* (+ 1 (+ 2 2)) (v0 x)) (+ 1 2)) 2) 1))))
(assert (forall ((x Int)) (= (f1 x) (+ (* x x) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ (* x x) x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* (+ 1 (+ 2 2)) (divf (v1 x) (+ 1 2)))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
