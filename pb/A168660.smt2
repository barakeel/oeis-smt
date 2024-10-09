;; sequence(s): A168660
;; terms: 0 1 576 30618 532480 4921875 30373056 141649396 537919488 1745783685 5005000000 12978455886 30976598016 68960620183 144680034240 288410625000 549890031616 1008202119561 1785539723328 3065980064770
;; small program: (loop(((x - 1) + y) * (x * x), 2, x) div 2) * x
;; fast program: (loop((1 + x) * (x * x), 1, (x * x) * x) div 2) * x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ (- x 1) y) (* x x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (divf (v0 x) 2) x))))
(assert (forall ((x Int)) (= (f1 x) (* (+ 1 x) (* x x)))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* (* x x) x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (divf (v1 x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
