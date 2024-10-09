;; sequence(s): A250108
;; terms: 0 0 4 2 10 10 22 20 36 36 56 54 78 78 106 104 136 136 172 170
;; small program: (loop(y - x, x * x, 1 + (x div 2)) div 2) * 2
;; fast program: ((2 + ((1 + x) * loop(x - 2, x mod 2, x))) div (2 + 2)) * 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y x))))
(assert (forall ((x Int)) (= (g0 x) (* x x))))
(assert (forall ((x Int)) (= (h0 x) (+ 1 (divf x 2)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (divf (v0 x) 2) 2))))
(assert (forall ((x Int)) (= (f1 x) (- x 2))))
(assert (forall ((x Int)) (= (g1 x) (modf x 2))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (divf (+ 2 (* (+ 1 x) (v1 x))) (+ 2 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
