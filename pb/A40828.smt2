;; sequence(s): A40828
;; terms: 29 3 2 3 58 3 2 3 58 3 2 3 58 3 2 3 58 3 2 3
;; small program: ((if (x mod (2 + 2)) <= 0 then loop(1 + ((2 + y) * x), 2, 2) else 1) * (if x <= 0 then 1 else 2)) + (x mod 2)
;; fast program: loop((2 + loop((x * x) * x, 1, 1 + 2)) * x, 1 - (x mod (2 + 2)), if x <= 0 then 1 else 2) + (x mod 2)
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 () Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (* (+ 2 y) x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (* (ite (<= (modf x (+ 2 2)) 0) v0 1) (ite (<= x 0) 1 2)) (modf x 2)))))
(assert (forall ((x Int)) (= (f2 x) (* (* x x) x))))
(assert (= g2 1))
(assert (= h2 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (= v2 (u2 g2 h2)))
(assert (forall ((x Int)) (= (f1 x) (* (+ 2 v2) x))))
(assert (forall ((x Int)) (= (g1 x) (- 1 (modf x (+ 2 2))))))
(assert (forall ((x Int)) (= (h1 x) (ite (<= x 0) 1 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v1 x) (modf x 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
