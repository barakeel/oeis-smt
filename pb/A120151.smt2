;; sequence(s): A120151
;; terms: 5 6 8 11 15 20 26 35 47 62 83 111 148 197 263 350 467 623 830 1107
;; small program: (loop((x div (1 + 2)) + x, x, loop(2 * (2 + x), 2, 2)) div 2) div 2
;; fast program: loop((x div (1 + 2)) + x, x, (2 * (2 * (2 + 2))) - 1) div (1 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (divf x (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (f1 x) (* 2 (+ 2 x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (= h0 v1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (divf (v0 x) 2) 2))))
(assert (forall ((x Int)) (= (f2 x) (+ (divf x (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 (- (* 2 (* 2 (+ 2 2))) 1)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (divf (v2 x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
