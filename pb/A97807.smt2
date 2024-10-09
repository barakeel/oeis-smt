;; sequence(s): A97807
;; terms: 1 ~1 1 1 ~1 1 ~1 1 ~1 1 1 ~1 1 ~1 1 ~1 1 ~1 1 ~1
;; small program: 1 - (2 * (loop(x - (if x <= 0 then 0 else (1 + y)), x, x) mod 2))
;; fast program: (((loop(x - (if x <= 0 then 0 else (1 + y)), 2 * (2 + (2 + 2)), x) + 1) mod 2) * 2) - 1
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x (ite (<= x 0) 0 (+ 1 y))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- 1 (* 2 (modf (v0 x) 2))))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- x (ite (<= x 0) 0 (+ 1 y))))))
(assert (= g1 (* 2 (+ 2 (+ 2 2)))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (- (* (modf (+ (v1 x) 1) 2) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
