;; sequence(s): A163811
;; terms: 1 ~1 0 0 0 1 0 ~1 0 0 0 1 0 ~1 0 0 0 1 0 ~1
;; small program: if x <= 0 then 1 else loop2(x - y, x, x, 0, x mod 2)
;; fast program: 1 - ((1 + x) mod ((x mod 2) + (if x <= 0 then 1 else 2)))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 0))
(assert (forall ((x Int)) (= (j0 x) (modf x 2))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (ite (<= x 0) 1 (w0 x)))))
(assert (forall ((x Int)) (= (fast x) (- 1 (modf (+ 1 x) (+ (modf x 2) (ite (<= x 0) 1 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
