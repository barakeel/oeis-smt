;; sequence(s): A118672
;; terms: 2 4 6 8 9 10 12 14 16 18 20 22 24 26 27 28 30 32 34 36
;; small program: loop(((if ((1 + x) mod (1 + (2 * (2 + 2)))) <= 0 then 1 else 2) - (x mod 2)) + x, x, 2)
;; fast program: loop((((if (x mod (1 + (2 * (2 + 2)))) <= 0 then 0 else x) mod 2) + 1) + x, x, 1 + 2) - 1
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (- (ite (<= (modf (+ 1 x) (+ 1 (* 2 (+ 2 2)))) 0) 1 2) (modf x 2)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f1 x) (+ (+ (modf (ite (<= (modf x (+ 1 (* 2 (+ 2 2)))) 0) 0 x) 2) 1) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (- (v1 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
