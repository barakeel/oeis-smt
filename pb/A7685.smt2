;; sequence(s): A7685
;; terms: 1 2 12 240 16800 4233600 3911846400 13425456844800 172785629592576000 8400837310791045120000 1552105098192510332190720000 1094904603628138948657963991040000 2960792853328653706847125274154762240000 30794022150329995743434211126374020153344000000
;; small program: loop(loop(2 * ((x - (x div y)) + x), y, x), x, 1)
;; fast program: loop(loop(loop2(x * y, 1 + y, x - 1, 1, 2 + x) div loop(x * y, x, 1), 1, y) * x, x - 1, 1) * loop2(x * y, 1 + y, x, 1, 1 + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int Int) Int)
(declare-fun h4 (Int) Int)
(declare-fun i4 () Int)
(declare-fun j4 (Int) Int)
(declare-fun u4 (Int Int Int) Int)
(declare-fun v4 (Int Int Int) Int)
(declare-fun w4 (Int) Int)
(declare-fun f5 (Int Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int Int) Int)
(declare-fun h6 (Int) Int)
(declare-fun i6 () Int)
(declare-fun j6 (Int) Int)
(declare-fun u6 (Int Int Int) Int)
(declare-fun v6 (Int Int Int) Int)
(declare-fun w6 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* 2 (+ (- x (divf x y)) x)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) (h1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g4 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (h4 x) (- x 1))))
(assert (= i4 1))
(assert (forall ((x Int)) (= (j4 x) (+ 2 x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u4 x y z) (ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v4 x y z) (ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w4 x) (u4 (h4 x) i4 (j4 x)))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (* x y))))
(assert (forall ((x Int)) (= (g5 x) x)))
(assert (= h5 1))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (f3 x) (divf (w4 x) (v5 x)))))
(assert (= g3 1))
(assert (forall ((x Int) (y Int)) (= (h3 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v3 x y) (u3 g3 (h3 x y)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* (v3 x y) x))))
(assert (forall ((x Int)) (= (g2 x) (- x 1))))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g6 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (h6 x) x)))
(assert (= i6 1))
(assert (forall ((x Int)) (= (j6 x) (+ 1 x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u6 x y z) (ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v6 x y z) (ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w6 x) (u6 (h6 x) i6 (j6 x)))))
(assert (forall ((x Int)) (= (fast x) (* (v2 x) (w6 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
