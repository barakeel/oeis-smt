;; sequence(s): A57933
;; terms: 9 98 987 9876 98765 987654 9876543 98765432 987654320 9876543209 98765432098 987654320987 9876543209876 98765432098765 987654320987654 9876543209876543 98765432098765432 987654320987654320
;; small program: (loop((2 * ((2 * (x + x)) + x)) - 1, 2 + x, 1) - 1) div (1 + (2 * (2 + 2)))
;; fast program: (loop2(1 + (x * y), y, 1 + x, 1, 2 + (2 * (2 + 2))) * (2 * (2 + 2))) div (1 + (2 * (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- (* 2 (+ (* 2 (+ x x)) x)) 1))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (- (v0 x) 1) (+ 1 (* 2 (+ 2 2)))))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 1 (* x y)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) (+ 1 x))))
(assert (= i1 1))
(assert (= j1 (+ 2 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 j1))))
(assert (forall ((x Int)) (= (fast x) (divf (* (w1 x) (* 2 (+ 2 2))) (+ 1 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
