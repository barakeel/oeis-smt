;; sequence(s): A63155
;; terms: 9 28 48 68 88 108 128 148 168 188 208 228 248 268 288 308 328 348 368 388
;; small program: loop2((2 * (x * y)) + x, 2, 2, 2, x) - (if x <= 0 then 1 else 2)
;; fast program: (2 * (2 * (2 + ((2 * (x + x)) + x)))) + (if x <= 0 then 1 else 0)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* 2 (* x y)) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (= i0 2))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z g0))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (- (w0 x) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* 2 (+ 2 (+ (* 2 (+ x x)) x)))) (ite (<= x 0) 1 0)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
